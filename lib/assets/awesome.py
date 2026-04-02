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
    voice_pattern = r'new\s+Voice\s*=\s*"([^"]+)"\s*\{([^}]*)\}'
    voice_blocks = re.findall(voice_pattern, content, re.DOTALL)
    notes_data = []

    for block in voice_blocks:
        voice_name = block[0]
        notes_str = block[1]
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
        'c#': 'des', 'd#': 'ees', 'f#': 'ges', 'g#': 'aes', 'a#': 'bes',
        'cs': 'des', 'ds': 'ees', 'fs': 'ges', 'gs': 'aes', 'as': 'bes',
        'cis': 'des', 'dis': 'ees', 'fis': 'ges', 'gis': 'aes', 'ais': 'bes',
        'eis': 'f', 'bis': 'c', 'des': 'cis', 'ees': 'dis', 'ges': 'fis',
    }
    note_lower = note.lower()
    return enharmonic_equivalents.get(note_lower, note)

def get_notes_in_minor_scale(root, intervals):
    notes = ['c', 'cs', 'd', 'ds', 'e', 'f', 'fs', 'g', 'gs', 'a', 'as', 'b']
    root_idx = notes.index(root)
    scale = []
    for interval in intervals:
        note_idx = (root_idx + interval) % 12
        note = notes[note_idx].replace('s', 'is').replace('cs', 'cis')
        scale.append(note)
        enh = enharmonic(note)
        if enh != note:
            scale.append(enh)
    return scale

def get_notes_in_major_scale(root, intervals):
    notes = ['c', 'cs', 'd', 'ds', 'e', 'f', 'fs', 'g', 'gs', 'a', 'as', 'b']
    root_idx = notes.index(root)
    scale = []
    for interval in intervals:
        note_idx = (root_idx + interval) % 12
        note = notes[note_idx].replace('s', 'is').replace('cs', 'cis')
        scale.append(note)
        enh = enharmonic(note)
        if enh != note:
            scale.append(enh)
    return scale

def parse_notes_in_voice(notes_str, voice_name, beats_per_measure, beat_unit):
    # Regex pour notes, accords, silences, liaisons
    note_pattern = re.compile(r"""
        (?:<([a-g](?:is|es)?\'*\,*\s+)+>)  # Accords
        (\d+)?(\.?)                       # Durée et point
        |
        ([a-g](?:is|es)?\'*\,*)         # Note simple
        (\d+)?(\.?)                       # Durée et point
        |
        r                                 # Silence
        (\d+)?(\.?)                       # Durée et point
        |
        ~                                 # Liaison
    """, re.VERBOSE)

    notes = []
    measure = 1
    beat = 0.0
    previous_duration = '4'  # Par défaut, une noire

    for match in note_pattern.finditer(notes_str):
        # Accord
        if match.group(1):
            notes_in_chord = match.group(1).split()
            duration_str = match.group(2) or previous_duration
            is_dotted = match.group(3) is not None
            duration = 1.0 / int(duration_str) if duration_str else 1.0 / beats_per_measure
            if is_dotted:
                duration *= 1.5
            for note in notes_in_chord:
                notes.append({
                    'measure': measure,
                    'beat': round(beat, 2),
                    'note': note,
                    'duration': duration,
                    'voice': voice_name,
                    'rythme': duration_str,
                })
            beat += duration
            previous_duration = duration_str

        # Liaison
        elif match.group(0) == '~':
            if notes:
                notes[-1]['duration'] += duration
                beat += duration

        # Silence
        elif match.group(6):
            duration_str = match.group(7) or previous_duration
            is_dotted = match.group(8) is not None
            duration = 1.0 / int(duration_str) if duration_str else 1.0 / beats_per_measure
            if is_dotted:
                duration *= 1.5
            notes.append({
                'measure': measure,
                'beat': round(beat, 2),
                'note': 'r',
                'duration': duration,
                'voice': voice_name,
                'rythme': duration_str,
            })
            beat += duration
            previous_duration = duration_str

        # Note simple
        else:
            note = match.group(4)
            duration_str = match.group(5) or previous_duration
            is_dotted = match.group(6) is not None
            duration = 1.0 / int(duration_str) if duration_str else 1.0 / beats_per_measure
            if is_dotted:
                duration *= 1.5
            notes.append({
                'measure': measure,
                'beat': round(beat, 2),
                'note': note,
                'duration': duration,
                'voice': voice_name,
                'rythme': duration_str,
            })
            beat += duration
            previous_duration = duration_str

        # Gestion des mesures
        if beat > beats_per_measure:
            measure += 1
            beat = duration

    return notes

if __name__ == "__main__":
    result = parse_lilypond("ta_partition.ly")
    print("\nDONNEES DE NOTES")
    for note in result['notes_data']:
        print(f"Mesure {note['measure']}, temps {note['beat']:.2f}, note {note['note']} (durée: {note['duration']} beat)")
