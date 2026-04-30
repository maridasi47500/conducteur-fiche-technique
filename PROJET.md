aide moi a resumer mon projet artistique : voici mon resume de projet artistique :  When  to trust code (conducteur génère par Ruby), when trust your intuition that is intelligence artistique 
Automatically conducteur
Vallee de l'étrange de 95% a 0% étrange ( scène seulement =technicien =100%humain)
IA cherche son style
(95%humain 5%defaut)=====
Musique classique 
IA très étrange (doigt qui clippe) (musicien) vidéo générée
IA
 très étrange (danseur suspendu par des fils ballet) IA très étrange 
(acteur avec les yeux vide qui dit un texte (vidéo générée)) ,violoniste
 sans tête ou sans corps (vidéo)

IA 50%humain 50%etrange
IA
 qui "stocke" ses souvenir dans un compte Facebook (se rend compte que 
c'est impossible de poster comme un robot )/plan centré sur l'école de 
musique Google maps/carte du ciel centre sur l'école de musique (4modes 
de posts)
Conducteur de scènes selon altération et nuances (script génère à l'aide de l'IA mais d'abord par humain) 
Script
 générant une partition selon un conducteur (vitesse /tempo du morceau 
+caractère du morceau +rythme du morceau selon un conducteur et grâce à 
un script non un prompt)

0%IA
 : essayer de demander à danseur/musicien du conservatoire de danser 
quelque chose /jouer quelque chose simple / fin sur photo de 
conservatoire /météo du jour/date du jour heure /routine de bonjour / 
extérieur salle rallumée 

Début : 
Style 1 musique africaine 
Style 2 opéra  voici la base de donnees du "profil facebook wall e r2d2"<%= form_with(model: machine_log) do |f| %>
  <% if machine_log.errors.any? %>
    <div style="color: red">
      <h2><%= pluralize(machine_log.errors.count, "error") %> prohibited this machine_log from being saved:</h2>

      <ul>
        <% machine_log.errors.each do |error| %>
          <li><%= error.full_message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>

  
  <div class="field">
    <%= f.label :module, "Composant du Processeur" %>
    <%= f.select :module, ['DYNAMIC', 'HARMONY', 'SYSTEM', 'GEO', 'ASTRONOMY'], prompt: "Choisir un module" %>
  </div>

  <div class="field">
    <%= f.label :level, "Niveau d'Alerte Log" %>
    <%= f.select :level, ['INFO', 'WARN', 'ERROR', 'FATAL'] %>
  </div>

  <div class="field">
    <%= f.label :raw_data, "Donnée Brute (Calcul)" %>
    <%= f.text_field :raw_data, placeholder: "ex: Gain < 5dB ou Coord: 48.8566, 2.3522" %>
  </div>

  <hr>

  <div class="field">
    <%= f.label :fb_translation, "🤖 Mur Facebook (Le Processeur)" %>
    <%= f.text_area :fb_translation, placeholder: "[LOG] Phrase froide et technique ici..." %>
  </div>

  <div class="field">
    <%= f.label :human_perspective, "🎻 Perspective Humaine (L'Artiste)" %>
    <%= f.text_area :human_perspective, placeholder: "Ce que le musicien ressent réellement..." %>
  </div>

  <div class="actions">
    <%= f.submit "Injecter dans la base de données" %>
  </div>

<% end %>
Voici le script qui marche deja pour transformer un partition lilypond en conducteur : mport re
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
    #    voice_blocks = [(f"{m[0]} {m[1]}", m[2]) for m in matches_std]
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
        r'(R)([\d\.]*)(?:\*([\d/\s]+))?',                      # 1. R rests
        r'(<[^>]+>)([\d\.]*)',                                 # 2. Accords
        r'\b([a-g](?:is|es)?[\',]*)([\d\.]*)\s*~\s*([\d\.]*)', # 3. Tied notes
        # 4. Simple notes/rests (Modifié pour exclure s1, S1, bass, fermata, bar)
        #r'\b(?![sS]\d|dolce.e.molto.legato|markup|italic|relative|major|minor|key|bass|\bass|fermata|bar|oneVoice|voiceOne|clef|tweak|style|none|cresc|sf\b)([a-grR](?:is|es)?[\',]*)([\d\.]*)',
# 4. Simple notes/rests (Sécurisé)
        #r'\b(?![sS]\d|dolce|markup|italic|bass|fermata|bar|oneVoice|voiceOne|clef|tweak|style|none|cresc|sf\b)([a-grRsS](?:is|es)?[\',]*)([\d\.]*)\b',
        #r'\b(?!dolce|markup|italic|bass|fermata|bar|oneVoice|voiceOne|clef|tweak|style|none|cresc|sf\b)([a-grRsS](?:is|es)?[\',]*)([\d\.]*)',
        # 4. Simple notes/rests avec capture du point ET boundary finale
        #r'\b(?!dolce|markup|italic|bass|fermata|bar|oneVoice|voiceOne|clef|tweak|style|none|cresc|sf\b)([a-grRsS](?:is|es)?[\',]*)([\d\.]*?)(?=\b)',
        #r'\b(?!(?:[sS]|clef bass|clef.bass|dolce|markup|italic|bass|fermata|bar|oneVoice|voiceOne|clef|tweak|style|none|cresc|sf)\b)([a-grR](?:is|es)?[\',]*)([\d\.]*)\b',
        r'\b(?!(?:[sS]|clef bass|clef.bass|dolce|markup|italic|bass|fermata|bar|oneVoice|voiceOne|clef|tweak|style|none|cresc|sf)\b)([a-grR](?:is|es)?[\',]*)([\d\.]*)(?![a-zA-Z])',
        r'\\(p|f|sf|cresc|decresc|[<>!])'                      # 5. DYNAMICS
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
        print(f"🔹 Nuances trouvées     : {nb_nuances}")
        print(f"🔹 Altérations trouvées : {nb_alterations}")
        print(f"🔸 Total d'événements  : {nb_nuances + nb_alterations}")
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
voici ma base de donnees : create_table "ambiance_options", force: :cascade do |t|
    t.integer "style_id", null: false
    t.string "category"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["style_id"], name: "index_ambiance_options_on_style_id"
  end

  create_table "ambiance_options_creative_detours", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "ambiance_option_id", null: false
    t.index ["ambiance_option_id", "creative_detour_id"], name: "idx_ambiance_detour"
    t.index ["creative_detour_id", "ambiance_option_id"], name: "idx_detour_ambiance"
  end

  create_table "artistic_limits", force: :cascade do |t|
    t.integer "conducteur_id"
    t.string "what_i_want"
    t.string "why_untranslatable"
    t.string "contradiction"
    t.string "emotional_truth"
    t.string "left_unintentional"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artistic_limits_creative_detours", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "artistic_limit_id", null: false
    t.index ["creative_detour_id", "artistic_limit_id"], name: "idx_detour_artistic_limit"
  end

  create_table "artistic_notes", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artistic_notes_creative_detours", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "artistic_note_id", null: false
    t.index ["creative_detour_id", "artistic_note_id"], name: "idx_detour_note"
  end

  create_table "artistic_processes", force: :cascade do |t|
    t.integer "conducteur_id"
    t.string "initial_impulse"
    t.string "first_attempt"
    t.string "doubts_questions"
    t.string "rejected_ideas"
    t.string "breakthrough"
    t.string "final_form"
    t.integer "iteration_count"
    t.string "what_changed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artistic_processes_creative_detours", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "artistic_process_id", null: false
    t.index ["creative_detour_id", "artistic_process_id"], name: "idx_detour_process"
  end

  create_table "conducteurhasmarkers", force: :cascade do |t|
    t.integer "conducteur_id"
    t.integer "emotional_marker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conducteurhasthemes", force: :cascade do |t|
    t.integer "conducteur_id"
    t.integer "stage_theme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conducteurlines", force: :cascade do |t|
    t.string "conducteur_id"
    t.time "duree"
    t.string "sequenceaction"
    t.string "interpretes"
    t.string "lumieres_ambiante"
    t.string "lumieres_effet"
    t.string "machine_brouillard"
    t.string "videoprojection"
    t.string "notes_technicien"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "son"
    t.string "ordre"
    t.string "notes_artistique"
    t.string "creative_notes"
    t.integer "emotional_marker_id"
    t.string "etat"
  end

  create_table "conducteurs", force: :cascade do |t|
    t.string "title"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fiche_technique_id"
    t.string "tempo_range"
    t.boolean "starred"
    t.string "notes"
  end

  create_table "conducteurs_creative_detours", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "conducteur_id", null: false
    t.index ["creative_detour_id", "conducteur_id"], name: "idx_detour_conducteur"
  end

  create_table "creative_detours", force: :cascade do |t|
    t.string "title"
    t.text "concept"
    t.text "action"
    t.text "database_usage"
    t.text "reaction"
    t.text "storage_impact"
    t.string "challenge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creative_detours_directive_artistiques", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "directive_artistique_id", null: false
    t.index ["creative_detour_id", "directive_artistique_id"], name: "idx_detour_directive"
    t.index ["directive_artistique_id", "creative_detour_id"], name: "idx_directive_detour"
  end

  create_table "creative_detours_emotional_markers", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "emotional_marker_id", null: false
    t.index ["creative_detour_id", "emotional_marker_id"], name: "idx_detour_marker"
  end

  create_table "creative_detours_fiche_techniques", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "fiche_technique_id", null: false
    t.index ["creative_detour_id", "fiche_technique_id"], name: "idx_detour_fiche"
  end

  create_table "creative_detours_inspiration_resources", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "inspiration_resource_id", null: false
    t.index ["creative_detour_id", "inspiration_resource_id"], name: "idx_detour_resource"
  end

  create_table "creative_detours_interpretations", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "interpretation_id", null: false
    t.index ["creative_detour_id", "interpretation_id"], name: "idx_detour_interpretation"
  end

  create_table "creative_detours_materiels", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "materiel_id", null: false
    t.index ["creative_detour_id", "materiel_id"], name: "idx_detour_materiel"
  end

  create_table "creative_detours_plan_de_scene_dessins", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "plan_de_scene_dessin_id", null: false
    t.index ["creative_detour_id", "plan_de_scene_dessin_id"], name: "idx_detour_plan_de_scene_dessin"
  end

  create_table "creative_detours_sequence_templates", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "sequence_template_id", null: false
    t.index ["creative_detour_id", "sequence_template_id"], name: "idx_detour_sequence_template"
    t.index ["sequence_template_id", "creative_detour_id"], name: "idx_sequence_template_detour"
  end

  create_table "creative_detours_share_your_gaps", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "share_your_gap_id", null: false
    t.index ["creative_detour_id", "share_your_gap_id"], name: "idx_detour_share_your_gap"
  end

  create_table "creative_detours_stage_themes", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "stage_theme_id", null: false
    t.index ["creative_detour_id", "stage_theme_id"], name: "idx_detour_theme"
  end

  create_table "creative_detours_styles", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "style_id", null: false
    t.index ["creative_detour_id", "style_id"], name: "idx_detour_style"
  end

  create_table "creative_detours_theme_suggestions", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "theme_suggestion_id", null: false
    t.index ["creative_detour_id", "theme_suggestion_id"], name: "idx_detour_theme_suggestion"
    t.index ["theme_suggestion_id", "creative_detour_id"], name: "idx_theme_suggestion_detour"
  end

  create_table "creative_detours_zones", id: false, force: :cascade do |t|
    t.integer "creative_detour_id", null: false
    t.integer "zone_id", null: false
    t.index ["creative_detour_id", "zone_id"], name: "idx_detour_zone"
  end

  create_table "directive_artistiques", force: :cascade do |t|
    t.string "name"
    t.integer "stage_theme_id", null: false
    t.string "default_lumieres_ambiante"
    t.string "default_lumieres_effet"
    t.string "default_videoprojection"
    t.string "default_son"
    t.string "default_notes_technicien"
    t.string "default_sequenceaction"
    t.time "default_duree"
    t.string "default_interpretes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stage_theme_id"], name: "index_directive_artistiques_on_stage_theme_id"
  end

  create_table "emotional_markers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fiche_techniques", force: :cascade do |t|
    t.string "name_event"
    t.string "eleve_responsable"
    t.string "date"
    t.string "professeur_referent"
    t.string "notes_complementaires"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inspiration_resources", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interpretations", force: :cascade do |t|
    t.integer "conducteur_id"
    t.string "machine_analysis"
    t.string "human_judgment"
    t.string "the_gap"
    t.string "artistic_truth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machine_logs", force: :cascade do |t|
    t.string "level"
    t.string "module"
    t.string "raw_data"
    t.string "fb_translation"
    t.string "human_perspective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materiel_necessaires", force: :cascade do |t|
    t.string "fiche_technique_id"
    t.string "materiel_id"
    t.string "quantite"
    t.string "precisions_observations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materiels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "on_stage"
    t.integer "maximum"
    t.string "zone_y"
    t.boolean "power_needed"
    t.string "category"
    t.string "default_layer"
    t.boolean "requires_power", default: false
    t.boolean "is_bundle", default: false
    t.integer "spread"
    t.integer "x_pref"
    t.integer "zone_id"
    t.index ["zone_id"], name: "index_materiels_on_zone_id"
  end

  create_table "metier_dependencies", force: :cascade do |t|
    t.integer "materiel_id"
    t.integer "required_item_id"
    t.integer "qty_multiplier"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_de_scene_dessins", force: :cascade do |t|
    t.string "fiche_technique_id"
    t.string "disposition"
    t.string "materiel_musicien"
    t.string "ordre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coord_x"
    t.integer "coord_y"
    t.string "layer"
  end

  create_table "projet_artistiques", force: :cascade do |t|
    t.integer "fiche_technique_id"
    t.integer "conducteur_id"
    t.string "title"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "style"
  end

  create_table "sequence_templates", force: :cascade do |t|
    t.string "label"
    t.string "phase"
    t.string "target_talent"
    t.string "suggested_light"
    t.string "intensity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "style_id", null: false
    t.index ["style_id"], name: "index_sequence_templates_on_style_id"
  end

  create_table "share_your_gaps", force: :cascade do |t|
    t.string "conducteur_id"
    t.string "analysis"
    t.string "response"
    t.string "interpretation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "show_themes", force: :cascade do |t|
    t.integer "projet_artistique_id"
    t.string "title"
    t.string "philosophical_inquiry"
    t.string "emotional_frequency"
    t.string "ai_blind_spot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stage_themes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "theme_suggestions", force: :cascade do |t|
    t.string "category"
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.integer "y_min"
    t.integer "y_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ambiance_options", "styles"
  add_foreign_key "directive_artistiques", "stage_themes"
  add_foreign_key "materiels", "zones"
  add_foreign_key "sequence_templates", "styles"
end
aide moi à resumer mon projet artistique:w!

