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
    # Regex mise à jour (R, Accords, Notes liées, Notes simples)
    patterns = [
        r'(R)([\d\.]*)(?:\*([\d/\s]+))?', 
        r'(<[^>]+>)([\d\.]*)',            
        r'([a-g](?:is|es)?[\',]*)([\d\.]*)\s*~\s*([\d\.]*)', 
        r'([a-gr](?:is|es)?[\',]*)([\d\.]*)'                 
    ]
    patterns = [
        # 1. Silences multimesures (R)
        r'(R)([\d\.]*)(?:\*([\d/\s]+))?', 
        
        # 2. Accords: <a b>4
        r'(<[^>]+>)([\d\.]*)',            
        
        # 3. Notes liées: on exclut fermata/bar ici aussi par sécurité
        r'\b(?!(?:fermata|bar)\b)([a-g](?:is|es)?[\',]*)([\d\.]*)\s*~\s*([\d\.]*)', 
        
        # 4. Notes/silences simples: exclusion de fermata et bar
        r'\b(?!(?:fermata|bar)\b)([a-gr](?:is|es)?[\',]*)([\d\.]*)'                 
    ]
    
    combined_pattern = re.compile('|'.join(patterns))
    notes_data = []
    current_beat = 0.0
    
    # Initialisation de la persistance (LilyPond défaut: 4 si non précisé au début)
    previous_duration_val = calculate_duration("4", beat_unit)
    
    clean_str = notes_str.replace('\n', ' ').replace('\r', ' ')

    for match in combined_pattern.finditer(clean_str):
        groups = match.groups()
        
        raw_note = ""
        duration_str = ""
        extra_duration = ""
        is_tied = False
        is_R = False

        # --- Extraction des données selon le groupe capturé ---
        if groups[0] == 'R': # Silence multimesure
            is_R = True
            raw_note = "R"
            duration_str = groups[1]
            multiplier = groups[2]
        elif groups[3]: # Accord
            raw_note = groups[3]
            duration_str = groups[4]
        elif groups[5]: # Note liée
            is_tied = True
            raw_note = groups[5]
            duration_str = groups[6]
            extra_duration = groups[7]
        else: # Note simple ou silence 'r'
            raw_note = groups[8]
            duration_str = groups[9]

        # --- LOGIQUE DE PERSISTANCE (votre ajout) ---
        if duration_str == "":
            current_duration_val = previous_duration_val
        else:
            current_duration_val = calculate_duration(duration_str, beat_unit)
            # Mise à jour de la mémoire pour la note suivante
            previous_duration_val = current_duration_val

        # Cas spécifique des liaisons (~ 8) : la 2ème durée devient la nouvelle référence
        if is_tied and extra_duration:
            tied_val = calculate_duration(extra_duration, beat_unit)
            total_duration = current_duration_val + tied_val
            previous_duration_val = tied_val # La durée APRÈS le ~ devient la référence
        elif is_R and multiplier:
            total_duration = current_duration_val * evaluate_multiplier(multiplier)
        else:
            total_duration = current_duration_val

        # --- Indexation temporelle ---
        measure_number = int(current_beat // beats_per_measure) + 1
        beat_in_measure = (current_beat % beats_per_measure) + 1

        notes_data.append({
            'measure': measure_number,
            'current_beat': duration_str,
            'beat': round(beat_in_measure, 3),
            'note': raw_note,
            'duration': total_duration,
            'voice': voice_name
        })

        current_beat += total_duration

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
