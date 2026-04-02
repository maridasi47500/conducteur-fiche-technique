import re

def parse_lilypond_score(content):
    # 1. Configuration des REGEX (vos motifs fournis)
    # Master regex pour consommer le texte sans doublons
    master_re = r'(?P<CHORD><\s*[a-g](?:is|es)?[\',]*(?:\s+[a-g](?:is|es)?[\',]*)*\s*>\d*\.*~?)|(?P<NOTE>\b[a-g](?:is|es)?[\',]*\d*\.*~?)|(?P<REST>\b[rR][\',]*\d*\.*~?)|(?P<SKIP>R\d*\.*)'
    
    # Détails pour l'extraction interne
    detail_note = r'([a-g](?:is|es)?[\',]*)(\d*)(\.*)(~?)'
    detail_chord = r'<\s*(.*?)\s*>(\d*)(\.*)(~?)'
    detail_rest = r'([rR][\',]*)(\d*)(\.*)(~?)'

    # 2. Extraction des infos globales
    key_match = re.search(r'\\key\s+([a-g])\s+\\(minor|major)', content)
    time_match = re.search(r'\\time\s+(\d+)\/(\d+)', content)
    
    beats_per_measure = int(time_match.group(1)) if time_match else 4
    beat_unit = int(time_match.group(2)) if time_match else 4
    measure_duration = beats_per_measure / beat_unit

    # 3. Extraction des blocs de voix (partI, partII, etc.)
    voices = re.findall(r'(part(?:I|II|III|IV))\s*=\s*\\relative\s*.*?\{(.*?)\}', content, re.DOTALL)
    
    full_report = {}

    for voice_name, voice_content in voices:
        print(f"\n--- Analyse de {voice_name} ---")
        notes_data = []
        current_time = 0.0
        last_dur = 4 # Valeur par défaut LilyPond
        
        # On itère sur les jetons trouvés par la master regex
        for match in re.finditer(master_re, voice_content):
            kind = match.lastgroup
            token = match.group()
            
            if kind == 'SKIP': # Pour les silences multimesures R1
                m = re.search(r'\d+', token)
                dur_val = int(m.group()) if m else 1
                current_time += dur_val # Avance d'une mesure entière
                continue

            # Extraction des détails
            if kind == 'CHORD':
                m = re.match(detail_chord, token)
                name, dur_str, dots, tie = m.groups()
                name = f"<{name}>"
            elif kind == 'REST':
                m = re.match(detail_rest, token)
                name, dur_str, dots, tie = m.groups()
            else: # NOTE
                m = re.match(detail_note, token)
                name, dur_str, dots, tie = m.groups()

            # Gestion de la durée (héritage)
            if dur_str:
                last_dur = int(dur_str)
            
            note_duration = 1.0 / last_dur
            if dots:
                for _ in range(len(dots)):
                    note_duration *= 1.5
            
            # Calcul Position
            measure_num = int(current_time // measure_duration) + 1
            beat_pos = (current_time % measure_duration) * beat_unit + 1
            
            notes_data.append({
                'measure': measure_num,
                'beat': round(beat_pos, 2),
                'note': name,
                'duration': note_duration,
                'token': token
            })
            
            # Affichage pour contrôle
            print(f"Mesure {measure_num} | Temps {beat_pos:.2f} | {name}")
            
            current_time += note_duration

        # Vérification si la voix finit sur une mesure pleine
        if current_time % measure_duration != 0:
            print(f"⚠️ {voice_name} : Mesure incomplète ! (Total: {current_time/measure_duration:.2f} mesures)")
        else:
            print(f"✅ {voice_name} : {int(current_time/measure_duration)} mesures complètes.")
            
        full_report[voice_name] = notes_data

    return full_report

# Simulation de l'appel avec votre texte
# (En situation réelle : content = open('fichier.ly').read())
content_ly = open('ta_partition.ly').read()
#content_ly = """votre_texte_ci_dessus""" 

# Lancement
results = parse_lilypond_score(content_ly)
