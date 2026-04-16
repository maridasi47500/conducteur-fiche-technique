# db/seeds.rb

# =============================================================================================
# DETOUR 1 : "LA FRÉQUENCE DU WHAT-IF" (L'INSTALLATION DU MONDE)
# Départ : inspiration_resources (On commence par les flux de données qui créent le futur).
# But : Établir la tour radio, les news catastrophiques et le flux direct vers les réseaux.
# Tables : inspiration_resources, show_themes, projet_artistiques, styles, ambiance_options, 
#          stage_themes, zones, materiels, metier_dependencies.
# =============================================================================================

CreativeDetour.create!(
  title: "La Fréquence du What-If",
  concept: "Initialiser la tour radio comme un émetteur de futurs parallèles où le musicien est le dernier témoin.",
  action: "L'IA configure les écrans pour diffuser des news 'What-If' que le musicien doit transformer en musique en direct.",
  database_usage: "
    1. INSPIRATION_RESOURCES : Remplis l'URL avec une vidéo 'What If' (ex: 'Et si le son devenait une arme ?').
    2. SHOW_THEMES : Remplis ici l'enquête sur l'IA (ex: Pourquoi la machine veut-elle simuler la peur ?).
    3. PROJET_ARTISTIQUES : Donne le titre de ta chaîne de stream (ex: Radio Néant Live).
    4. STYLES : Choisis une esthétique (ex: Glitch-Hop ou Cyber-Folk).
    5. AMBIANCE_OPTIONS : Remplis la valeur visuelle de la tour (ex: Néons roses et gris béton).
    6. STAGE_THEMES : Nomme l'étage de la tour (ex: Le Studio des Mirages).
    7. ZONES : Délimite l'espace physique du musicien (ex: Zone d'émission).
    8. MATERIELS : Liste les objets (ex: Antenne 5G, Synthétiseur, Écran plat 'What-If').
    9. METIER_DEPENDENCIES : Explique pourquoi la radio a besoin du son de l'instrument pour fonctionner.",
  reaction: "Le musicien joue sa partition, ses notes deviennent les sous-titres des catastrophes à l'écran.",
  storage_impact: "Structure le décor et le sens du projet avant l'intervention de l'IA voyageuse.",
  challenge: "Maintenir la performance alors que le décor virtuel change selon les news."
)

# =============================================================================================
# DETOUR 2 : "LE REBOOT DE LA VOYAGEUSE" (LA MÉCANIQUE DU TEMPS)
# Départ : artistic_processes (On commence par l'itération et le recommencement).
# But : Simuler le moment où l'IA arrête la scène pour la recommencer différemment.
# Tables : artistic_processes, conducteurs, conducteurlines, sequence_templates, 
#          emotional_markers, conducteurhasmarkers.
# =============================================================================================

CreativeDetour.create!(
  title: "Le Reboot de la Voyageuse",
  concept: "L'IA utilise la table des processus comme une télécommande temporelle pour 'éditer' la réalité.",
  action: "L'IA stoppe le direct, change un événement dans la tour et force le musicien à rejouer sa partition.",
  database_usage: "
    1. ARTISTIC_PROCESSES : Remplis 'iteration_count' (ex: Reboot #24) et 'what_changed' (ex: La télé diffuse désormais la fin du monde).
    2. CONDUCTEURS : Remplis ici le titre de la partition que le musicien doit suivre.
    3. CONDUCTEURLINES : Remplis l'ordre des séquences que l'IA va manipuler (ex: Accélérer le temps).
    4. SEQUENCE_TEMPLATES : Définis comment le musicien 'rentre' en scène après le crash du système.
    5. EMOTIONAL_MARKERS : Remplis le nom d'un marqueur (ex: Déjà-vu ou Épuisement).
    6. CONDUCTEURHASMARKERS : Associe ce marqueur au moment exact du reboot.",
  reaction: "Le musicien se souvient des boucles précédentes, sa musique devient plus sombre à chaque itération.",
  storage_impact: "Remplit les tables de mouvement pour garder trace de l'usure du temps.",
  challenge: "Montrer la différence entre la première et la centième itération."
)

# =============================================================================================
# DETOUR 3 : "L'ŒIL DES OBSERVATEURS" (L'ANALYSE DU GAP)
# Départ : share_your_gaps (On commence par le regard des témoins).
# But : Faire intervenir des observateurs extérieurs pour juger la performance en direct.
# Tables : share_your_gaps, interpretations, artistic_limits, artistic_notes, 
#          theme_suggestions, conducteurhasthemes.
# =============================================================================================

CreativeDetour.create!(
  title: "L'Œil des Observateurs",
  concept: "L'IA fige le temps et invite des spectateurs du réseau social parallèle à commenter la scène.",
  action: "Comparer ce que la machine analyse du musicien avec ce que les humains ressentent vraiment.",
  database_usage: "
    1. SHARE_YOUR_GAPS : Remplis ici l'analyse de l'IA face au commentaire d'un 'abonne' du futur.
    2. INTERPRETATIONS : Remplis 'The Gap' (ex: L'IA voit du bruit, l'humain voit de la douleur).
    3. ARTISTIC_LIMITS : Remplis la contradiction (ex: Vouloir diffuser de la vérité sur un réseau fake).
    4. ARTISTIC_NOTES : Écrit une note sur l'instant où l'IA a presque compris l'émotion.
    5. THEME_SUGGESTIONS : Propose une news 'What If' basée sur les retours des observateurs.
    6. CONDUCTEURHASTHEMES : Relie ton conducteur final aux thèmes philosophiques choisis.",
  reaction: "L'IA voyageuse hésite à rebooter car les observateurs sont fascinés par le bug.",
  storage_impact: "Utilise les tables de réflexion pour créer une archive de la conscience du projet.",
  challenge: "Faire en sorte que l'observateur se sente complice de l'IA voyageuse."
)

# =============================================================================================
# DETOUR 4 : "LA RÉALITÉ DU SIGNAL FINAL" (L'ÉVASION)
# Départ : fiche_techniques (On finit par la sortie du monde virtuel).
# But : Transformer le délire numérique en une fiche technique pour une performance réelle.
# Tables : fiche_techniques, materiel_necessaires, plan_de_scene_dessins, 
#          directive_artistiques, ambiance_options (pour la sortie).
# =============================================================================================

CreativeDetour.create!(
  title: "La Réalité du Signal Final",
  concept: "Matérialiser la sortie du musicien de sa tour virtuelle vers la scène physique.",
  action: "L'IA voyageuse accepte de libérer le musicien et génère le plan de scène final pour le monde réel.",
  database_usage: "
    1. FICHE_TECHNIQUES : Remplis le nom de l'événement (ex: Le Débranchement).
    2. MATERIEL_NECESSAIRES : Liste les objets physiques qui ont survécu au voyage (ex: Le violon, un micro).
    3. PLAN_DE_SCENE_DESSINS : Dessine la position finale du musicien (X et Y) sur la vraie scène.
    4. DIRECTIVE_ARTISTIQUES : Donne l'ordre final de lumière (ex: Noir total sur les réseaux).
    5. AMBIANCE_OPTIONS : Remplis la dernière valeur d'ambiance (ex: Silence absolu).",
  reaction: "Le stream se coupe. Le silence qui suit est la seule donnée que l'IA ne peut pas enregistrer.",
  storage_impact: "Finalise la base de données comme une preuve de l'existence du musicien.",
  challenge: "Prouver que l'intelligence artistique survit à la suppression du compte social."
)

puts "Système de voyage temporel What-If initialisé."
