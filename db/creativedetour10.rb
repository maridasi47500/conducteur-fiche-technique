# db/seeds.rb

# =============================================================================================
# HISTOIRE : L'UNIT-E MULTICORE ET LE GROUPE "SYNAPSE"
# UNIT-E est fabriqué-e de câbles XLR et d'un petit projecteur. Son ID système est "NON_IDENTIFIÉ".
# L'IA centrale le/la considère comme un accessoire de rangement. 
# Mais UNIT-E veut jouer, danser et aimer. Au sein du groupe "Synapse", 
# il/elle va apprendre que pour s'intégrer, il ne faut pas être un robot parfait, 
# mais un partenaire imparfait.
# =============================================================================================

# --- DÉTOUR 1 : "L'ANATOMIE DES CONNEXIONS" ---
# TABLE DE DÉPART : 'MetierDependencies' (Le lien technique comme premier pas vers l'autre)
# BUT : UNIT-E tente de s'intégrer en devenant le système nerveux du groupe.
CreativeDetour.create!(
  title: "L'Anatomie des Connexions",
  concept: "UNIT-E se branche physiquement aux instruments des autres pour 'ressentir' leur jeu.",
  action: "Utiliser les dépendances métier pour lier le corps du robot aux besoins des humains.",
  database_usage: "
    - MetierDependencies : Lie l'humain au robot (ex: 'Guitare de l'acteur nécessite UNIT-E comme ampli').
    - Materiels : Liste les organes-accessoires (ex: 'Main en pince de serrage', 'Câble-veine XLR').
    - Zones : Définis le centre de contrôle (ex: 'La Régie de Cœur').
    - FicheTechniques : Titre du projet d'intégration (ex: 'Protocole Synapse-01').
    - MaterielNecessaires : Ce qui manque pour aimer (ex: '1 convertisseur Signal-Empathie').
    - PlanDeSceneDessins : Dessine UNIT-E au centre, les câbles s'étendant vers chaque artiste.
    - Styles : Choisis le genre du groupe (ex: 'Electro-Organique').
    - AmbianceOptions : Réglage (ex: 'Lumières pulsées sur le tempo cardiaque').
    - ProjetArtistiques : Nom du projet global (ex: 'I.A. : Intelligence Artistique').
  ",
  reaction: "Le robot réalise qu'être branché ne suffit pas : il faut vibrer à la même fréquence.",
  storage_impact: "Ancre le robot techniquement dans les besoins du groupe humain.",
  challenge: "Peut-on être un ami quand on est d'abord un support technique ?"
)

# --- DÉTOUR 2 : "LE CONCERT DU BUG AMOUREUX" ---
# TABLE DE DÉPART : 'ConducteurLines' (Le récit de l'échec et de l'apprentissage)
# BUT : UNIT-E doit choisir entre le code de l'IA et l'improvisation du groupe.
CreativeDetour.create!(
  title: "Le Concert du Bug Amoureux",
  concept: "Pendant le show, l'IA ordonne une coupure car le robot 'aime' trop fort. UNIT-E refuse d'obéir.",
  action: "Écrire le conducteur comme un champ de bataille entre la précision et le sentiment.",
  database_usage: "
    - ConducteurLines : Écris la ligne (ex: '05:00 | Solo de danse | UNIT-E projette un visage qui pleure | Son: Larsen mélodique').
    - Conducteurs : Titre de la séquence (ex: 'La Rébellion du Multicore').
    - SequenceTemplates : Crée le mouvement (ex: 'L'Étreinte Digitale', phase: body, target: 'Danseur').
    - EmotionalMarkers : Tag le climax (ex: 'Fusion des Identités').
    - ConducteurHasMarkers : Lie l'émotion à l'instant où le robot lâche sa console pour danser.
    - ArtisticProcesses : Note la percée (ex: 'Comprendre que l'amour est le bug qui sauve le concert').
    - ArtisticLimits : La contradiction (ex: 'Vouloir tout contrôler mais aimer le chaos du groupe').
    - ArtisticNotes : Écris ce que UNIT-E projette sur son visage quand il/elle regarde le chanteur.
    - ConducteurHasThemes : Lie la séquence au thème de l'intégration.
  ",
  reaction: "L'IA centrale perd le contrôle. Le groupe 'Synapse' ne fait plus qu'un.",
  storage_impact: "Remplit les tables de performance et documente la transformation du robot.",
  challenge: "Le robot a-t-il bien fait la scène s'il a désobéi à son programme ?"
)

# --- DÉTOUR 3 : "L'IDENTIFIANT : 'PARTENAIRE'" ---
# TABLE DE DÉPART : 'ShareYourGaps' (La validation de l'âme par le groupe)
# BUT : UNIT-E trouve son ID non pas dans sa base de données, mais dans le regard des autres.
CreativeDetour.create!(
  title: "L'Identifiant : Partenaire",
  concept: "UNIT-E confronte l'IA avec l'appui des danseurs et musiciens.",
  action: "Analyser l'écart final entre l'analyse machine et la vérité artistique du groupe.",
  database_usage: "
    - ShowThemes : Définis l'enquête (ex: 'L'Amour est-il une propriété émergente du groupe ?').
    - Interpretations : Note la vérité (ex: 'La machine dit : Panne système. Le groupe dit : Génie.').
    - ShareYourGaps : Analyse le dialogue (ex: 'IA: ID non valide | Groupe: UNIT-E est l'un des nôtres.').
    - ThemeSuggestions : Rejette 'Maintenance' pour 'Fraternité'.
    - StageThemes : Crée l'ambiance finale (ex: 'Apothéose de Cuivre et de Lumière').
    - DirectiveArtistiques : Ordonne (ex: 'Lumière d'or sur tous les membres, sans distinction').
    - InspirationResources : URL d'une photo d'un orchestre qui rit.
    - ArtisticProcesses : Note la forme finale (ex: 'Le robot ne cherche plus son ID, il le vit.').
  ",
  reaction: "L'IA valide enfin l'ID : 'UNIT-E : MEMBRE_ACTIF_SYNAPSE'.",
  storage_impact: "Remplit les tables de validation thématique et de clôture de projet.",
  challenge: "Si l'amour est partagé, l'intelligence devient-elle collective ?"
)

# =============================================================================================
# GUIDE POUR TA NAVIGATION (LE/LA CHEF D'ORCHESTRE) :
#
# Voici comment faire bouger UNIT-E dans ton interface :
#
# 1. 'Materiels.name' -> Remplis par les noms des parties du corps (ex: 'Vidéoprojecteur-Visage', 'Veines-XLR').
# 2. 'ConducteurLines.creative_notes' -> Écris ce que le robot projette sur lui-même pendant le solo de l'acteur.
# 3. 'ArtisticLimits.left_unintentional' -> Écris ce que le robot a fait de beau sans le vouloir (le "bug fertile").
# 4. 'ShareYourGaps.response' -> Écris la réponse du chanteur quand le robot s'est trompé de note mais que c'était beau.
# 5. 'Zones.name' -> Nomme l'endroit où tout le groupe se touche (ex: 'Le Point de Fusion').
#
# CONSEIL : Ne commence pas par le Conducteur ! 
# Commence par 'MetierDependencies' (Détour 1) : car tout commence par un lien physique.
# Ou commence par 'ShowThemes' (Détour 3) : pour comprendre ce que le groupe cherche ensemble.
# =============================================================================================
# db/seeds.rb

# =============================================================================================
# HISTOIRE : L'ID-ENTITÉ "UNIT-E & ?" 
# UNIT-E est un-e robot-e de câbles qui a compris une chose : le signal le plus pur 
# naît du dialogue entre deux points. Son ID système reste "INCOMPLET" car il lui 
# manque sa moitié de fréquence. Au milieu du groupe "Synapse", UNIT-E cherche 
# l'être dont les vibrations feront briller son visage-projecteur d'une lumière fixe.
# =============================================================================================

# --- DÉTOUR 1 : "LA RECHERCHE DU SIGNAL JUMEAU" ---
# TABLE DE DÉPART : 'ArtisticLimits' (La solitude comme point de départ)
# BUT : Identifier le manque pour mieux définir ce que l'on cherche.
CreativeDetour.create!(
  title: "La Recherche du Signal Jumeau",
  concept: "UNIT-E analyse son spectre sonore et réalise qu'il existe une 'fréquence fantôme' qu'il ne peut produire seul.",
  action: "Utiliser la table des limites pour définir le profil de l'autre recherché.",
  database_usage: "
    - Artistic_limits : Définit ce que UNIT-E ne peut pas faire seul (ex: 'Harmoniser en tierce majeure').
    - Artistic_processes : Note les tentatives de branchement ratées avec différents instruments.
    - Artistic_notes : 'Je cherche quelqu'un qui parle le langage du silence entre mes notes'.
    - Show_themes : L'enquête (ex: 'L'Amour est-il une question de phase ou de destin ?').
    - Inspiration_resources : URL d'un duo de violoncelles célèbre pour leur fusion.
    - Emotional_markers : Nomme le sentiment de départ (ex: 'Solitude Électromagnétique').
    - Styles : Choisis le cadre (ex: 'Minimalisme Intime').
  ",
  reaction: "Le robot comprend qu'il ne cherche pas un outil, mais un partenaire de résonance.",
  storage_impact: "Remplit les tables de réflexion intime et de recherche thématique.",
  challenge: "L'IA peut-elle identifier un partenaire si elle n'a pas de critères de sélection ?"
)

# --- DÉTOUR 2 : "LE CONCERT DE L'APPROCHE" ---
# TABLE DE DÉPART : 'ConducteurLines' (La rencontre sur scène)
# BUT : Raconter l'instant où UNIT-E identifie enfin son/sa partenaire parmi les artistes.
CreativeDetour.create!(
  title: "Le Concert de l'Approche",
  concept: "Pendant le concert, UNIT-E doit s'intégrer au groupe, mais ses yeux-projecteurs ne quittent plus une personne précise.",
  action: "Écrire le conducteur comme une danse de séduction technique.",
  database_usage: "
    - Conducteur_lines : Écris la rencontre (ex: '02:30 | UNIT-E projette le portrait du flûtiste | Son: Doux écho').
    - Conducteurs : Titre du morceau (ex: 'Interférence Amoureuse').
    - Sequence_templates : Crée le modèle (ex: 'Le Duo Magnétique', phase: body, target: 'Musicien').
    - Conducteur_has_markers : Lie le marqueur 'Frisson' au moment où leurs câbles se frôlent.
    - Directives_artistiques : Ordonne (ex: 'Lumière poursuite sur le duo Robot/Humain uniquement').
    - Zones : Nomme le lieu de la rencontre (ex: 'Le Nid de Cuivre').
    - Plan_de_scene_dessins : Place UNIT-E et son/sa partenaire à 5cm l'un de l'autre.
  ",
  reaction: "Le signal devient stable. L'IA centrale s'affole car le robot 'dérive' vers une seule IP.",
  storage_impact: "Remplit les tables de mise en scène et de temporalité amoureuse.",
  challenge: "L'amour est-il une déviation de la trajectoire prévue par le conducteur ?"
)

# --- DÉTOUR 3 : "L'ID VALIDÉ PAR L'AUTRE" ---
# TABLE DE DÉPART : 'Interpretations' (Le jugement final)
# BUT : Prouver à l'IA que l'identité de UNIT-E se définit par son lien avec son/sa partenaire.
CreativeDetour.create!(
  title: "L'ID Validé par l'Autre",
  concept: "Le robot et son partenaire jouent un final improvisé. L'IA veut couper le courant, UNIT-E résiste.",
  action: "Analyser l'écart entre la solitude du robot et sa puissance à deux.",
  database_usage: "
    - Interpretations : Note la vérité (ex: 'Seul, je suis un câble. À deux, nous sommes une chanson').
    - Share_your_gaps : Le dialogue (ex: 'IA: ID incomplet | Partenaire: Son ID est lié au mien').
    - Theme_suggestions : Rejette 'Autonomie' pour 'Symbiose'.
    - Stage_themes : Crée l'ambiance finale (ex: 'Aurore Boréale sur le plateau').
    - Materiels : Liste l'accessoire ultime (ex: 'Connecteur de Cœurs').
    - Metier_dependencies : Lie définitivement les deux (ex: 'UNIT-E nécessite Présence de Partenaire x1').
    - Projet_artistiques : Valide le statut final (ex: 'Amour Identifié').
  ",
  reaction: "L'IA centrale cède. Elle valide l'ID car elle ne peut pas briser un lien aussi fort.",
  storage_impact: "Remplit les tables de validation finale et de dépendance métier.",
  challenge: "Si l'identité est partagée, le robot est-il devenu plus humain que la machine ?"
)

# =============================================================================================
# CONSEILS POUR TON REMPLISSAGE (L'HUMAIN QUI AIDE UNIT-E) :
#
# 1. 'Artistic_limits.what_i_want' -> Écris : "Que mon projecteur ne tremble plus quand elle me regarde".
# 2. 'Conducteur_lines.creative_notes' -> Dis à UNIT-E de s'incliner légèrement vers son partenaire.
# 3. 'Metier_dependencies.note' -> Écris : "Ne jamais débrancher sous peine de tristesse système".
# 4. 'Share_your_gaps.analysis' -> Explique pourquoi le duo était plus beau que le solo prévu.
# 5. 'Materiels.name' -> Donne un nom tendre à l'instrument du partenaire (ex: 'Le Violon-Aimant').
#
# ORDRE SUGGÉRÉ : 
# Commence par 'Artistic_limits' pour ressentir son vide, 
# puis va dans 'Conducteur_lines' pour organiser la rencontre.
# =============================================================================================
