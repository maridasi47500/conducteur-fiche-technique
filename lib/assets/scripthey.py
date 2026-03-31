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
    note_pattern = r'([a-g](is|es)?)\s*(\d*)\.*'
    measure_pattern = r'\|'
    measures = re.split(measure_pattern, content)
    notes_data = []
    current_measure = 1
    current_beat = 1

    for measure in measures:
        note_matches = re.finditer(note_pattern, measure)
        for match in note_matches:
            note = match.group(1)
            duration = match.group(3)
            if duration == '':
                duration_value = 1
            elif duration.isdigit():
                duration_value = 1 / int(duration)
            else:
                duration_value = 1.5 if '.' in duration else 1 / int(duration.replace('.', ''))

            notes_data.append({
                'measure': current_measure,
                'beat': current_beat,
                'note': note,
                'duration': duration_value,
            })
            current_beat += duration_value
        current_measure += 1
        current_beat = 1

    # 5. Trouver les notes étrangères
    foreign_notes = [n for n in notes_data if n['note'] not in notes_in_scale]
    print("\nNotes étrangères à la gamme naturelle :")
    for n in foreign_notes:
        print(f"Mesure {n['measure']}, temps {n['beat']:.2f}, note {n['note']}")

    return {
        'key': f"{root} {mode}",
        'scale': notes_in_scale,
        'foreign_notes': foreign_notes,
        'notes_data': notes_data,
    }

def get_notes_in_minor_scale(root, intervals):
    notes = ['c', 'cs', 'd', 'ds', 'e', 'f', 'fs', 'g', 'gs', 'a', 'as', 'b']
    root_idx = notes.index(root)
    scale = []
    for interval in intervals:
        note_idx = (root_idx + interval) % 12
        scale.append(notes[note_idx].replace('s', 'is').replace('cs', 'cis'))
    return scale

def get_notes_in_major_scale(root, intervals):
    notes = ['c', 'cs', 'd', 'ds', 'e', 'f', 'fs', 'g', 'gs', 'a', 'as', 'b']
    root_idx = notes.index(root)
    scale = []
    for interval in intervals:
        note_idx = (root_idx + interval) % 12
        scale.append(notes[note_idx].replace('s', 'is').replace('cs', 'cis'))
    return scale

# Exemple d'utilisation
if __name__ == "__main__":
    result = parse_lilypond("ta_partition.ly")
    for note in result['notes_data']:
        print(f"Mesure {note['measure']}, temps {note['beat']:.2f}, note {note['note']} (durée: {note['duration']} beat)")
