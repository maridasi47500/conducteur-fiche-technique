# db/seeds.rb

# =========================================================================================
# DÉTOUR CRÉATIF 1 : "L'EFFET STROBOSCOPIQUE DU PASSÉ"
# Table de départ : sequence_templates
# Table évitée au départ : conducteurs
# But : Simuler le passage brutal d'un intérieur disco confiné à un extérieur nocturne vaste.
# =========================================================================================

CreativeDetour.create!(
  title: "L'Effet Stroboscopique du Passé",
  concept: "Un violon électrique 'play over' un flux disco. La scène alterne entre la chaleur d'une boîte de nuit (intérieur) et la fraîcheur d'un jardin sous la lune (extérieur). L'IA tente de synchroniser les néons avec les coups d'archet.",
  action: "L'artiste commence en Zone 1 (Centre Scène) avec un violon électrique. L'IA déclenche des modèles de séquence selon l'intensité du disco.",
  database_usage: "
    - Commence par 'sequence_templates' pour définir l'entrée (Phase: intro, Target: Musicien/ne, Light: rasant).
    - Utilise 'styles' (Nom: Disco-Futuriste) et 'ambiance_options' (Category: lumieres, Value: Violet Néon).
    - 'materiels' définit le violon électrique en Zone 1 avec 'power_needed: true'.
    - 'metier_dependencies' lie le violon à l'amplification et aux capteurs de lumière.
    - 'stage_themes' (Name: Le Dancefloor Infini) sert de base aux 'directive_artistiques' pour automatiser le brouillard et la vidéo-projection de boules à facettes.
    - 'plan_de_scene_dessins' place les enceintes et les projecteurs en couches (layers) pour simuler l'horizon.",
  storage_impact: "
    - Remplit 'artistic_processes' avec l'impulsion initiale : 'La nostalgie du rythme 4/4'.
    - 'emotional_markers' (Name: Euphorie Électrique) est injecté dans le flux.
    - 'artistic_notes' (Title: La vibration du cuivre) stocke le ressenti du bois face au synthétiseur.",
  reaction: "L'IA génère une réponse visuelle frénétique, mais l'artiste doit ralentir ses mouvements pour créer un contraste, documenté dans 'share_your_gaps'.",
  challenge: "Maintenir l'âme du violon acoustique dans un environnement saturé de fréquences électroniques."
)

# =========================================================================================
# DÉTOUR CRÉATIF 2 : "LE SILENCE DISCO DES ÉTOILES"
# Table de départ : interpretations
# Table évitée au départ : sequence_templates
# But : Analyser l'écart entre la froideur du calcul binaire et la chaleur de l'improvisation.
# =========================================================================================

CreativeDetour.create!(
  title: "Le Silence Disco des Étoiles",
  concept: "Le violoniste joue sur une musique de fête entendue au loin (extérieur nuit). Le son est filtré, comme si on était hors du club. L'IA doit interpréter ce qui n'est pas joué.",
  action: "Le conducteur suit une ligne temporelle où le volume du disco baisse pour laisser place aux sons de la nature, mixés au violon.",
  database_usage: "
    - Commence par 'interpretations' pour analyser la 'machine_analysis' vs 'human_judgment' sur le play-over.
    - 'conducteurs' et 'conducteurlines' gèrent la durée, les 'notes_artistique' et le 'tempo_range'.
    - 'show_themes' définit l'enquête : 'Pourquoi l'IA ne danse pas ?'.
    - 'artistic_limits' explore la 'contradiction' : 'Vouloir faire pleurer une machine sur un beat disco'.
    - 'share_your_gaps' enregistre l'écart entre le métronome parfait et le rubato du musicien.
    - 'inspiration_resources' pointe vers des archives de 'Music History' sur la disco et des vidéos de 'Gesture & Body Language'.
    - 'theme_suggestions' propose d'ajouter une 'vibration' mélancolique au milieu de la fête.
    - 'materiel_necessaires' liste les besoins en capteurs sonores pour l'extérieur.",
  storage_impact: "
    - 'conducteurhasmarkers' et 'conducteurhasthemes' lient le conducteur à l'émotion 'Nostalgie Nocturne'.
    - 'zones' délimite l'espace extérieur (Zone 2: Jardin) où le son devient éthéré.",
  reaction: "La fiche technique est mise à jour avec des 'notes_complementaires' sur l'acoustique nocturne.",
  challenge: "Capturer l'instant où l'idée naît (l'hésitation) dans une base de données SQLite rigide."
)

# =========================================================================================
# NOTE POUR L'UTILISATEUR :
# 1. Le Détour 1 ("Effet Stroboscopique") commence par 'sequence_templates'. 
#    Il ignore 'conducteurs' pour se focaliser sur l'automatisme de la fête intérieure.
# 2. Le Détour 2 ("Silence Disco") commence par 'interpretations'. 
#    Il ignore 'sequence_templates' pour se focaliser sur le ressenti et l'analyse de l'extérieur.
# 3. Tables couvertes : TOUTES (Styles, Ambiance, Zones, Markers, Dependencies, Templates, 
#    Directives, Gaps, Inspiration, Interpretations, Limits, Processes, Themes, Plan, Fiche, Materiel).
# 4. À remplir par l'utilisateur : Les colonnes 'artistic_truth', 'creative_notes' et 'doubts_questions' 
#    car l'IA a laissé la place à ta propre 'vibration humaine'.
# =========================================================================================
