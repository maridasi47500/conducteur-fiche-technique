import re
from collections import defaultdict

def parse_lilypond(file_path):
    with open(file_path, 'r') as f:
        content = f.read()

    # 0. Détecter le numéro de mesure de départ (ex: Beethoven mesure 34)
    start_bar_match = re.search(r'currentBarNumber\s*=\s*#(\d+)', content)
    start_measure = int(start_bar_match.group(1)) if start_bar_match else 1

    # 1. Trouver la tonalité
    key_match = re.search(r'\\key\s+([a-g])(\s+\\minor|\s+\\major)?', content)
    if not key_match:
        root, mode = 'c', 'major' # Défaut
    else:
        root = key_match.group(1)
        mode = key_match.group(2).strip() if key_match.group(2) else 'major'
    print(f"Tonalité : {root} {mode}")

    # 2. Gamme naturelle
    if mode == '\\minor':
        notes_in_scale = get_notes_in_minor_scale(root, [0, 2, 3, 5, 7, 8, 10])
    else:
        notes_in_scale = get_notes_in_major_scale(root, [0, 2, 4, 5, 7, 9, 11])

    # 3. Signature rythmique
    time_match = re.search(r'\\time\s+(\d+)\/(\d+)', content)
    beats_per_measure = int(time_match.group(1)) if time_match else 4
    beat_unit = int(time_match.group(2)) if time_match else 4

    # 4. Extraction des voix (Pattern Triple)
    voice_blocks = []
    # Test Pattern 1 (Standard partI voiceOne)
    voice_pattern = r'(part(?:I|II|III|IV))(?!(?:relative))(?:[(?!(?:\\))=a-z.\{\}^:\s]*)\\(voice(?:One|Two|Three|Four))\s*([^}]*)\}'
    matches = re.findall(voice_pattern, content, re.DOTALL)
    if matches:
        voice_blocks = [(f"{m[0]} {m[1]}", m[2]) for m in matches]
    
    # Test Pattern 2 (Variables \relative)
    if not voice_blocks:
        matches = re.findall(r'(\w+)\s*=\s*\\relative\s*[a-g\']*[\s]*\{([^}]*)\}', content, re.DOTALL)
        if matches: voice_blocks = matches

    # Test Pattern 3 (Blocs \new Voice directs - Beethoven)
    if not voice_blocks:
        matches = re.findall(r'\\new Voice\s*\{([^}]*)\}', content, re.DOTALL)
        voice_blocks = [(f"Voice_{i+1}", m) for i, m in enumerate(matches)]

    notes_data = []
    dynamics_data = []

    for name, notes_str in voice_blocks:
        v_notes, v_dyns = parse_notes_in_voice(notes_str, name, beats_per_measure, beat_unit, start_measure)
        notes_data.extend(v_notes)
        dynamics_data.extend(v_dyns)

    # --- AFFICHAGE ---
    print(f"\n--- NUANCES DÉTECTÉES (Départ mesure {start_measure}) ---")
    for d in sorted(dynamics_data, key=lambda x: (x['measure'], x['beat'])):
        print(f"Mesure {d['measure']}, temps {d['beat']:.2f} : Nuance {d['type']} (voix {d['voice']})")

    print("\n--- NOTES ÉTRANGÈRES ---")
    foreign_notes = [n for n in notes_data if (n['note'].lower() not in notes_in_scale and n['note'] not in ["r", "s", "R"])]
    for n in foreign_notes:
        print(f"Mesure {n['measure']}, temps {n['beat']:.2f}, note {n['note']} (voix {n['voice']})")

    return {'notes': notes_data, 'dynamics': dynamics_data}

def parse_notes_in_voice(notes_str, voice_name, beats_per_measure, beat_unit, start_measure):
    # Regex : Grp 1: Note/Accord/Silence | Grp 2: Durée | Grp 3: Nuance rattachée (\p, \sf, \>, etc)
    pattern = re.compile(r'([a-grRsS]|<[^>]+>)(?:is|es|flat|sharp)?[\',]*(\d*\.*)(?:\s*~\s*\d*\.*)?(?:\s*\\([a-zA-Z<>!]+))?')
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
    dynamics_data = []
    current_beat = 0.0
    prev_duration_val = calculate_duration("4", beat_unit) # Par défaut noire
    
    clean_str = notes_str.replace('\n', ' ').replace('\r', ' ')

    for match in pattern.finditer(clean_str):
        raw_note, dur_str, dyn = match.groups()

        # Gestion Durée
        if dur_str:
            current_duration_val = calculate_duration(dur_str, beat_unit)
            prev_duration_val = current_duration_val
        else:
            current_duration_val = prev_duration_val

        # Indexation temporelle
        measure_number = int(current_beat // beats_per_measure) + start_measure
        beat_in_measure = (current_beat % beats_per_measure) + 1

        notes_data.append({
            'measure': measure_number,
            'beat': round(beat_in_measure, 3),
            'note': raw_note,
            'voice': voice_name
        })

        # Capture des nuances
        if dyn in ['p', 'f', 'mf', 'mp', 'pp', 'ff', 'sf', 'sfz', 'cresc', 'decresc', '>', '<', '!']:
            dynamics_data.append({
                'measure': measure_number,
                'beat': round(beat_in_measure, 3),
                'type': f"\\{dyn}",
                'voice': voice_name
            })

        current_beat += current_duration_val

    return notes_data, dynamics_data

def calculate_duration(dur_str, beat_unit):
    if not dur_str: return 0.0
    match = re.match(r'(\d+)(\.*)', dur_str)
    if not match: return 1.0
    val = int(match.group(1))
    dots = len(match.group(2))
    duration = beat_unit / val
    added = duration
    for _ in range(dots):
        added /= 2
        duration += added
    return duration

# --- Fonctions de gammes ---
def enharmonic(note):
    enharmonic_equivalents = {'cs': 'des', 'ds': 'ees', 'fs': 'ges', 'gs': 'aes', 'as': 'bes'}
    note_lower = note.lower()
    return enharmonic_equivalents.get(note_lower, note)

def get_notes_in_minor_scale(root, intervals):
    notes = ['c', 'cs', 'd', 'ds', 'e', 'f', 'fs', 'g', 'gs', 'a', 'as', 'b']
    try:
        root_idx = notes.index(root)
        scale = []
        for interval in intervals:
            idx = (root_idx + interval) % 12
            n = notes[idx].replace('s', 'is').replace('cs', 'cis')
            scale.append(n)
            if enharmonic(notes[idx]) != n: scale.append(enharmonic(notes[idx]))
        return scale
    except: return []

def get_notes_in_major_scale(root, intervals):
    return get_notes_in_minor_scale(root, intervals) # Même logique de base

if __name__ == "__main__":
    result = parse_lilypond("waldstein.ly")
    pass
