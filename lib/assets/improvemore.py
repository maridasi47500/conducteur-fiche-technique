import re
from collections import defaultdict

def parse_lilypond(file_path):
    with open(file_path, 'r') as f:
        content = f.read()
    # 1. Trouver la tonalité (key signature)
    key_match = re.search(r'\\key\s+([a-g])(\s+\\minor|\s+\\major)?', content)
    if not key_match:
        raise ValueError("Tonalité non trouvée dans le fichier LilyPond.")
    root = key_match.group(1)
    mode = key_match.group(2).strip() if key_match.group(2) else 'major'
    print(f"Tonalité : {root} {mode}")

    # 2. Déterminer les notes de la gamme naturelle
    if mode == '\\minor':
        minor_scale_intervals = [0, 2, 3, 5, 7, 8, 10]
        notes_in_scale = get_notes_in_minor_scale(root, minor_scale_intervals)
    else:
        major_scale_intervals = [0, 2, 4, 5, 7, 9, 11]
        notes_in_scale = get_notes_in_major_scale(root, major_scale_intervals)
    print(f"Notes de la gamme naturelle : {', '.join(notes_in_scale)}")

    # 3. Trouver la signature rythmique
    time_match = re.search(r'\\time\s+(\d+)\/(\d+)', content)
    if not time_match:
        raise ValueError("Signature rythmique non trouvée.")
    beats_per_measure = int(time_match.group(1))
    beat_unit = int(time_match.group(2))
    print(f"Signature rythmique : {beats_per_measure}/{beat_unit}")

    # 4. Extraire toutes les notes avec leur mesure, temps, durée et voix
    note_pattern = r'([a-g](is|es)?)(\d*)(\.?)'
    voice_pattern = r'(\w+) = \\relative\s*\{([^}]*)\}'
    voice_pattern = r'part(I|II|III|IV).=.[^\s]*voice(One|Two|Three|Four)\s*([^}]*)\}'
    voice_pattern = r'(part(?:I|II|III|IV))(?!(?:relative))(?:[(?!(?:\\))=a-z.\{\}^:\s]*)\\(voice(?:One|Two|Three|Four))\s*([^}]*)\}'
    voice_blocks = re.findall(voice_pattern, content, re.DOTALL)
    notes_data = []

    for block in voice_blocks:
        voice_name = block[0]+" "+block[1]
        notes_str = block[2]
        notes_data.extend(parse_notes_in_voice(notes_str, voice_name, beats_per_measure, beat_unit))

    # 5. Trouver les notes étrangères
    foreign_notes = [n for n in notes_data if (n['note'] not in notes_in_scale and n['note'] != "r")]
    print("\nNotes étrangères à la gamme naturelle :")
    for n in foreign_notes:
        if n["note"] == "r":
            continue
        print(f"Mesure {n['measure']}, temps {n['beat']:.2f}, note {n['note']} (voix {n['voice']})")

    return {
        'key': f"{root} {mode}",
        'scale': notes_in_scale,
        'foreign_notes': foreign_notes,
        'notes_data': notes_data,
    }

def enharmonic(note):
    enharmonic_equivalents = {
        'c#': 'd♭',
        'd#': 'e♭',
        'f#': 'g♭',
        'g#': 'a♭',
        'a#': 'b♭',
        'cs': 'des',
        'ds': 'ees',
        'fs': ' ges',
        'gs': 'aes',
        'as': 'b',
        'bes': 'ais',
        'bis': 'c',
        'eis': 'f',
        'cis': 'des',
        'dis': 'ees',
        'fis': 'ges',
        'gis': 'aes',
        'ais': 'bes'
    }

    note_lower = note.lower()
    if note_lower in enharmonic_equivalents:
        return enharmonic_equivalents[note_lower]
    else:
        return note  # Return original if no enharmonic equivalent found
def get_notes_in_minor_scale(root, intervals):
    notes = ['c', 'cs', 'd', 'ds', 'e', 'f', 'fs', 'g', 'gs', 'a', 'as', 'b']
    root_idx = notes.index(root)
    scale = []
    for interval in intervals:
        note_idx = (root_idx + interval) % 12
        scale.append(notes[note_idx].replace('s', 'is').replace('cs', 'cis'))
        myenharmonic=enharmonic(notes[note_idx].replace('s', 'is').replace('cs', 'cis'))
        if notes[note_idx].replace('s', 'is').replace('cs', 'cis') != myenharmonic:
            scale.append(myenharmonic)
      
    return scale

def get_notes_in_major_scale(root, intervals):
    notes = ['c', 'cs', 'd', 'ds', 'e', 'f', 'fs', 'g', 'gs', 'a', 'as', 'b']
    root_idx = notes.index(root)
    scale = []
    for interval in intervals:
        note_idx = (root_idx + interval) % 12
        scale.append(notes[note_idx].replace('s', 'is').replace('cs', 'cis'))
        myenharmonic=enharmonic(notes[note_idx].replace('s', 'is').replace('cs', 'cis'))
        if notes[note_idx].replace('s', 'is').replace('cs', 'cis') != myenharmonic:
            scale.append(myenharmonic)
    return scale
def parse_notes_in_voice(notes_str, voice_name, beats_per_measure, beat_unit):
    # Liste ordonnée de regex (du plus spécifique au plus général)
    # 1. Accords: <a b>4.
    # 2. Notes liées: bes4 ~ 8 ou bes4~8
    # 3. Notes simples / silences: ais'16. ou r4
    patterns = [
r'(R)([\d\.]*)(?:\*([\d/\s]+))?', # 1. Silences multimesures: R1*4 ou R2.
        r'(<[^>]+>)([\d\.]*)',          # Accords
        r'([a-g](?:is|es|is|as)?[\',]*)([\d\.]*)\s*~\s*([\d\.]*)', # Notes liées
        r'([a-grR](?:is|es|is|as)?[\',]*)([\d\.]*)'                 # Notes/silences simples
    ]
    
    # On compile une regex globale avec des groupes nommés ou alternatifs
    # Mais pour plus de clarté, on peut aussi itérer sur le texte
    combined_pattern = re.compile('|'.join(patterns))
    
    notes_data = []
    current_beat = 0.0
    current_duration_val = 4.0  # Par défaut la noire (4) si rien n'est précisé au début
    
    # Nettoyage des retours à la ligne pour faciliter la regex
    clean_str = notes_str.replace('\n', ' ').replace('\r', ' ')

    for match in combined_pattern.finditer(clean_str):
        groups = match.groups()
        
        raw_note = ""
        duration_str = ""
        is_tied = False
        extra_duration = ""

        # Identification du type de match
        if groups[0]: # Accord
            raw_note = groups[0]
            duration_str = groups[1]
        elif groups[2]: # Note liée
            raw_note = groups[2]
            duration_str = groups[3]
            extra_duration = groups[4]
            is_tied = True
        else: # Note simple
            raw_note = groups[5]
            duration_str = groups[6]

        if duration_str == "":
            current_duration_val = previous_duration_val
        else:
            current_duration_val = calculate_duration(duration_str, beat_unit)
        # Gestion de la persistance de la durée LilyPond
        if groups[2] and duration_str and duration_str.strip():
            previous_duration_val = calculate_duration(extra_duration, beat_unit)
        elif duration_str and duration_str.strip():
            previous_duration_val = calculate_duration(duration_str, beat_unit)

        
        final_duration = current_duration_val
        
        # Si c'est une liaison, on ajoute la durée liée
        if is_tied and extra_duration:
            final_duration += calculate_duration(extra_duration, beat_unit)

        # Calcul mesure et temps dans la mesure
        measure_number = int(current_beat // beats_per_measure) + 1
        beat_in_measure = (current_beat % beats_per_measure) + 1

        notes_data.append({
            'measure': measure_number,
            'beat': beat_in_measure,
            'current_beat': duration_str,
            'note': raw_note,
            'duration': final_duration,
            'voice': voice_name
        })

        current_beat += final_duration
    total_beats = sum(n['duration'] for n in notes_data)
    total_measures = total_beats / beats_per_measure
    print(f"Total mesures calculées : {total_measures}")

    return notes_data

def calculate_duration(dur_str, beat_unit):
    """Convertit une durée LilyPond (ex: '4.') en valeur numérique (beats)."""
    if not dur_str: return 0.0
    
    # Extraction du chiffre de base et des points
    match = re.match(r'(\d+)(\.*)', dur_str)
    if not match: return 0.0
    
    val = int(match.group(1))
    dots = len(match.group(2))
    
    # Conversion : une ronde (1) vaut 4 noires, etc. 
    # Rapportée à l'unité de temps (beat_unit)
    duration = beat_unit / val
    
    # Gestion des points (chaque point ajoute la moitié de la valeur précédente)
    added = duration
    for _ in range(dots):
        added /= 2
        duration += added
        
    return duration


# Exemple d'utilisation
if __name__ == "__main__":
    result = parse_lilypond("ta_partition.ly")
    print("DONNEES DE NOTES")
    for note in result['notes_data']:
        print(f"Mesure {note['measure']}, temps {note['beat']:.2f}, current beat {note['current_beat']}, note {note['note']} (durée: {note['duration']} beat)")
