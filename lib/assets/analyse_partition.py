import re
import sys
import json
from collections import defaultdict

def parse_lilypond(file_path):
    with open(file_path, 'r') as f:
        content = f.read()
    
    # 0. Détecter le numéro de mesure de départ (ex: \set Score.currentBarNumber = #34)
    start_bar_match = re.search(r'currentBarNumber\s*=\s*#(\d+)', content)
    start_measure = int(start_bar_match.group(1)) if start_bar_match else 1

    # 1. Trouver la tonalité
    key_match = re.search(r'\\key\s+([a-g])(\s+\\minor|\s+\\major)?', content)
    if not key_match:
        root, mode = 'c', 'major'
    else:
        root = key_match.group(1)
        mode = key_match.group(2).strip() if key_match.group(2) else 'major'
    print(f"Tonalité : {root} {mode} (Départ mesure {start_measure})")

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
    voice_pattern_std = r'(part(?:I|II|III|IV))(?!(?:relative))(?:[(?!(?:\\))=a-z.\{\}^:\s]*)\\(voice(?:One|Two|Three|Four))\s*([^}]*)\}'
    #matches_std = re.findall(voice_pattern_std, content, re.DOTALL)
    #if matches_std:
    #    voice_blocks = [(f"{m[0]} {m[1]}", m[2]) for m in matches_std]
    voice_blocks=[["voice 1",content]]
    
    if not voice_blocks:
        matches_rel = re.findall(r'(\w+)\s*=\s*\\relative\s*[a-g\']*[\s]*\{([^}]*)\}', content, re.DOTALL)
        if matches_rel: voice_blocks = matches_rel

    if not voice_blocks:
        matches_direct = re.findall(r'\\new Voice\s*\{([^}]*)\}', content, re.DOTALL)
        voice_blocks = [(f"Voice_{i+1}", m) for i, m in enumerate(matches_direct)]

    all_notes = []
    all_dynamics = []

    for name, notes_str in voice_blocks:
        n_data, d_data = parse_notes_in_voice(notes_str, name, beats_per_measure, beat_unit, start_measure)
        all_notes.extend(n_data)
        all_dynamics.extend(d_data)

    # Affichage des Nuances (Dynamics)
    print("\n--- NUANCES DÉTECTÉES ---")
    for d in sorted(all_dynamics, key=lambda x: (x['measure'], x['beat'])):
        print(f"Mesure {d['measure']},previous note:{d['previous_note']}, previous rythme: {d['previous_duration']}, temps {d['beat']:.2f} : {d['type']} (voix {d['voice']})")

    # Affichage des Notes étrangères (Alterations)
    print("\n--- NOTES ÉTRANGÈRES (Altérations) ---")
    for n in all_notes:
        if n['note'].lower() not in notes_in_scale and n['note'] not in ["r", "s", "R"]:
            print(f"Mesure {n['measure']}, temps {n['beat']:.2f}, note {n['note']} (voix {n['voice']})")

    return all_notes, all_dynamics, notes_in_scale

def parse_notes_in_voice(notes_str, voice_name, beats_per_measure, beat_unit, start_measure):
    patterns = [
        r'(R)([\d\.]*)(?:\*([\d/\s]+))?',                      # 1. R rests
        r'(<[^>]+>)([\d\.]*)',                                 # 2. Accords
        r'\b([a-g](?:is|es)?[\',]*)([\d\.]*)\s*~\s*([\d\.]*)', # 3. Tied notes
        # 4. Simple notes/rests (Modifié pour exclure s1, S1, bass, fermata, bar)
        #r'\b(?![sS]\d|dolce.e.molto.legato|markup|italic|bass|\bass|fermata|bar|oneVoice|voiceOne|clef|tweak|style|none|cresc|sf\b)([a-grR](?:is|es)?[\',]*)([\d\.]*)',
# 4. Simple notes/rests (Sécurisé)
        #r'\b(?![sS]\d|dolce|markup|italic|bass|fermata|bar|oneVoice|voiceOne|clef|tweak|style|none|cresc|sf\b)([a-grRsS](?:is|es)?[\',]*)([\d\.]*)\b',
        #r'\b(?!dolce|markup|italic|bass|fermata|bar|oneVoice|voiceOne|clef|tweak|style|none|cresc|sf\b)([a-grRsS](?:is|es)?[\',]*)([\d\.]*)',
        # 4. Simple notes/rests avec capture du point ET boundary finale
        #r'\b(?!dolce|markup|italic|bass|fermata|bar|oneVoice|voiceOne|clef|tweak|style|none|cresc|sf\b)([a-grRsS](?:is|es)?[\',]*)([\d\.]*?)(?=\b)',
        #r'\b(?!(?:[sS]|clef bass|clef.bass|dolce|markup|italic|bass|fermata|bar|oneVoice|voiceOne|clef|tweak|style|none|cresc|sf)\b)([a-grR](?:is|es)?[\',]*)([\d\.]*)\b',
        r'\b(?!(?:[sS]|clef bass|clef.bass|dolce|markup|italic|bass|fermata|bar|oneVoice|voiceOne|clef|tweak|style|none|cresc|sf)\b)([a-grR](?:is|es)?[\',]*)([\d\.]*)(?![a-zA-Z])',
        r'\\(p|f|sf|cresc|decresc|[<>!])'                      # 5. DYNAMICS
    ]
    
    combined_pattern = re.compile('|'.join(patterns))
    notes_data = []
    dynamics_data = []
    current_beat = 0.0
    prev_duration_val = calculate_duration("4", beat_unit)
    prev_note=""
    #previous_current_duration_val = "0"
    
    clean_str = notes_str.replace('\n', ' ').replace('\r', ' ')

    for match in combined_pattern.finditer(clean_str):
        groups = match.groups()
        


        # Sinon, c'est une note ou un silence
        duration_str = ""
        raw_note = ""
        total_duration = 0
        
        if groups[0] == 'R': 
            raw_note, duration_str = "R", groups[1]
        elif groups[3]: 
            raw_note, duration_str = groups[3], groups[4]
        elif groups[5]: 
            raw_note, duration_str = groups[5], groups[6]
        elif groups[8]: 
            raw_note, duration_str = groups[8], groups[9]
        # Si le groupe 10 (le dernier) est matché, c'est une nuance



        # Calcul durée
        if duration_str == "":
            current_duration_val = prev_duration_val
            #prev_duration_val = previous_current_duration_val
        else:
            #previous_current_duration_val = prev_duration_val
            current_duration_val = calculate_duration(duration_str, beat_unit)
        if groups[10]:
            measure = int(current_beat // beats_per_measure) + start_measure
            beat = (current_beat % beats_per_measure) + 1# - float(previous_current_duration_val)
            dynamics_data.append({
                'measure': measure,
                'previous_note': str(prev_note),
                'previous_duration': float(prev_duration_val),
                'beat': round(beat, 3) - float(prev_duration_val),
                'type': f"\\{groups[10]}",
                'voice': voice_name
            })
            continue # On ne change pas le temps pour une nuance
        
        total_duration = current_duration_val
        
        # Enregistrement note
        measure = int(current_beat // beats_per_measure) + start_measure
        beat = (current_beat % beats_per_measure) + 1
        
        notes_data.append({
            'measure': measure,
            'duration_str': duration_str,
            'beat': round(beat, 3),
            'note': raw_note,
            'voice': voice_name
        })
        
        current_beat += total_duration
        prev_duration_val = current_duration_val # On met à jour la persistance ici seulement
        prev_note=raw_note

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

def get_notes_in_minor_scale(root, intervals):
    notes = ['c', 'cs', 'd', 'ds', 'e', 'f', 'fs', 'g', 'gs', 'a', 'as', 'b']
    try:
        root_idx = notes.index(root)
        scale = []
        for interval in intervals:
            idx = (root_idx + interval) % 12
            n = notes[idx].replace('s', 'is').replace('cs', 'cis')
            scale.append(n)
        return scale
    except: return []

def get_notes_in_major_scale(root, intervals):
    return get_notes_in_minor_scale(root, intervals)

def enharmonic(note):
    return note # Simplified for logic
# ... (votre code précédent)

if __name__ == "__main__":
    if len(sys.argv) > 1:
        fichier = sys.argv[1]
    else:
        # Fallback pour le développement local
        fichier = "waldstein.ly"
    
    try:
        # Extraction des données
        notes_extraites, all_dynamics, notes_in_scale = parse_lilypond(fichier)
        print(f"\nAnalyse terminée : {len(notes_extraites)} éléments traités.")
        print("DONNEES DE NOTES")
        for n in notes_extraites:
            print(f"Mesure {n['measure']}, temps {n['beat']:.2f},duration: {n['duration_str']} note {n['note']} (voix {n['voice']})")
        
        # Calcul des statistiques
        nb_nuances = len(all_dynamics)
        # On filtre les notes qui ne sont pas dans la gamme (altérations)
        nb_alterations = len([n for n in notes_extraites if n['note'].lower() not in notes_in_scale and n['note'] not in ["r", "s", "R"]])
        
        print("\n" + "="*40)
        print("📊 RÉSUMÉ DE L'ANALYSE LILYPOND")
        print("="*40)
        print(f"🔹 Nuances trouvées     : {nb_nuances}")
        print(f"🔹 Altérations trouvées : {nb_alterations}")
        print(f"🔸 Total d'événements  : {nb_nuances + nb_alterations}")
        print("="*40)
        print("💾 Données prêtes pour le script Ruby (musique_data.json)")
        
        # Export JSON pour Ruby
        data_export = {
            "nuances": all_dynamics,
            "alterations": [n for n in notes_extraites if n['note'].lower() not in notes_in_scale and n['note'] not in ["r", "s", "R"]]
        }
        with open('tmp/musique_data.json', 'w', encoding='utf-8') as f:
            json.dump(data_export, f, indent=4)


        




        
    except FileNotFoundError:
        print("Erreur : Le fichier .ly est introuvable.")
    except Exception as e:
        print(f"Une erreur est survenue : {e}")

