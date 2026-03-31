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
        # Gamme mineure naturelle : 1 2 ♭3 4 5 ♭6 ♭7
        minor_scale_intervals = [0, 2, 3, 5, 7, 8, 10]
        notes_in_scale = get_notes_in_minor_scale(root, minor_scale_intervals)
    else:
        # Gamme majeure naturelle : 1 2 3 4 5 6 7
        major_scale_intervals = [0, 2, 4, 5, 7, 9, 11]
        notes_in_scale = get_notes_in_major_scale(root, major_scale_intervals)
    print(f"Notes de la gamme naturelle : {', '.join(notes_in_scale)}")

    # 3. Extraire toutes les notes avec leur mesure, temps et voix
    #note_pattern = r'(\w+) = \{\s*\\clef\s*"(\w+)"\s*([^}]*)\}|(\\new\s+Voice\s*=\s*"(\w+)"\s*\{....................([^}]*)\})'
    note_pattern = r'(\w+) = \\relative.{([^}]*)}'
    voice_blocks = re.findall(note_pattern, content, re.DOTALL)
    notes_data = []
    for block in voice_blocks:
        voice_name = block[0]# or block[4]
        print(block)
        #notes_str = block[2] or block[5]
        notes_str = block[1]
        notes_data.extend(parse_notes_in_voice(notes_str, voice_name))

    # 4. Trouver les notes étrangères
    print(notes_data)
    foreign_notes = [n for n in notes_data if n['note'] not in notes_in_scale]
    print("\nNotes étrangères à la gamme naturelle :")
    for n in foreign_notes:
        print(f"Mesure {n['measure']}, temps {n['beat']}, note {n['note']} (voix {n['voice']})")

    return {
        'key': f"{root} {mode}",
        'scale': notes_in_scale,
        'foreign_notes': foreign_notes,
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

def parse_notes_in_voice(notes_str, voice_name):
    # Simplification : on suppose que chaque note est séparée par un espace ou une barre
    # et qu'on a des mesures et temps implicites (à adapter selon le vrai format)
    print(notes_str)
    note_matches = re.finditer(r'([a-g])(is|es)?', notes_str)
    rythme_matches = re.finditer(r'([a-g])(is|es)(\d+)', notes_str)


    notes = []
    measure = 1
    beat = 1
    hello=0
    into_array = []

    
    
    for match in rythme_matches:
        spots = match
        into_array.append(spots)
    print(into_array)
    print(into_array[hello])
    rythme=None
    lastrythme=None
    for match in note_matches:

        note = match.group(0)
        try:
          print(into_array[hello])
          rythme = into_array[hello].group(3)
        except:
          if note == rythme and lastrythme != None:
              rythme = lastrythme

     
        notes.append({
            'measure': measure,
            'rythme': rythme,
            'beat': beat,
            'note': note,
            'voice': voice_name,
        })
        try:
          lastrythme = into_array[hello].group(3)
        except:
          print("argh")
        beat += 1
        if beat > 4:  # Supposons 4 temps par mesure
            beat = 1
            measure += 1
        hello+=1
    return notes

# Exemple d'utilisation
if __name__ == "__main__":
    result = parse_lilypond("ta_partition.ly")
