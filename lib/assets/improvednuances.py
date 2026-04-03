import re

def parse_beethoven_waldstein(content):
    # 1. Trouver le numéro de mesure initial (LilyPond défaut = 1)
    start_bar_match = re.search(r'currentBarNumber\s*=\s*#(\d+)', content)
    start_measure = int(start_bar_match.group(1)) if start_bar_match else 1
    
    # 2. Paramètres rythmiques (par défaut 4/4 ici car non spécifié dans le snippet)
    beats_per_measure = 4
    beat_unit = 4

    # 3. Pattern pour capturer les blocs de voix \new Voice { ... }
    # On cherche le contenu à l'intérieur des accolades
    voice_blocks = re.findall(r'\\new Voice\s*(?:\{|<<)\s*(.*?)\s*(?:\}|>>)', content, re.DOTALL)
    
    # Si aucun bloc \new Voice, on prend les blocs \new Staff
    if not voice_blocks:
        voice_blocks = re.findall(r'\\new Staff\s*\{ (.*?) \}', content, re.DOTALL)

    all_data = []

    # Regex pour les éléments musicaux : 
    # Grp 1: Note ou Accord ou Silence | Grp 2: Durée | Grp 3: Nuances/Commandes
    music_pattern = re.compile(
        r'([a-g][flatsharp]*[\',]*|<[^>]+>|[rsS])' # Note, accord ou silence
        r'(\d*\.*)'                                # Durée (ex: 2, 4.)
        r'((?:\s*\\[a-zA-Z<>!^]+|(?:\^|\\)\s*\\markup\s*\{[^}]+\})*)' # Nuances/Markups
    )

    for i, block in enumerate(voice_blocks):
        voice_id = f"Voice_{i+1}"
        current_total_beats = 0.0
        prev_duration = 4.0 # Valeur par défaut (noire)

        for match in music_pattern.finditer(block):
            raw_element, dur_str, decorations = match.groups()

            # Calcul durée
            print("duration string", dur_str)
            if dur_str == "" or dur_str == None:
                duration = prev_duration

            else:
                duration = calculate_duration(dur_str, beat_unit)
                prev_duration = duration



            # Position temporelle
            measure_idx = int(current_total_beats // beats_per_measure) + start_measure
            beat_in_measure = (current_total_beats % beats_per_measure) + 1

            # Extraction des nuances dans les décorations
            # On cherche \p, \f, \sf, \cresc, \>, \< et les markups
            found_dynamics = re.findall(r'\\(p|f|sf|cresc|decresc|[<>!])|markup\s*\{\s*\\italic\s*([^}]+)\}', decorations)

            for dyn, markup in found_dynamics:
                label = f"\\{dyn}" if dyn else f"Markup: {markup.strip()}"
                all_data.append({
                    'measure': measure_idx,
                    'beat': round(beat_in_measure, 2),
                    'type': label,
                    'voice': voice_id,
                    'context': raw_element
                })

            current_total_beats += duration

    return all_data

def calculate_duration(dur_str, beat_unit):
    if not dur_str: return 1.0
    match = re.match(r'(?:[a-grR])?(\d+|)(\.*)', dur_str)

    val = int(match.group(1))
    dots = len(match.group(2))
    base = beat_unit / val
    return base * (2 - (0.5**dots))

# --- Exécution ---
# On simule la lecture du contenu que vous avez posté
with open("ta_nouvelle_partition.ly", 'r') as f:
    your_lilypond_content = f.read()

results = parse_beethoven_waldstein(your_lilypond_content)

print(f"{'MESURE':<8} | {'TEMPS':<8} | {'NUANCE / INDICATION':<25} | {'SUR NOTE'}")
print("-" * 70)
for r in sorted(results, key=lambda x: (x['measure'], x['beat'])):
    print(f"{r['measure']:<8} | {r['beat']:<8.2f} | {r['type']:<25} | {r['context']}")
