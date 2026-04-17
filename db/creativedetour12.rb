# db/seeds.rb

# =============================================================================
# PROJET : I.A. (Intelligence Artistique)
# MISSION : Cartographier l'écart entre le processeur et le frisson.
# =============================================================================

CreativeDetour.create!([
  {
    title: "Détour #1 : Le Fantôme dans la Zone (Départ : ZONES)",
    concept: "Inverser la création : ne pas partir de la musique, mais de l'espace vide. On définit où le silence 'habite' avant de jouer une note.",
    challenge: "Peut-on ressentir une émotion uniquement par la géographie d'une scène ?",
    action: "1. Définir une Zone 'Lointain Gauche'. 2. Y placer un Materiel (Projecteur) via MaterielNecessaire. 3. Créer une DirectiveArtistique qui force le silence dans cette zone.",
    database_usage: "Tables utilisées : Zones -> Materiels -> MaterielNecessaires -> PlanDeSceneDessins -> FicheTechniques -> DirectiveArtistiques -> StageThemes.",
    reaction: "La machine sature la zone de lumière, l'humain y place une chaise vide. L'écart est là.",
    storage_impact: "Remplit les coordonnées spatiales (coord_x, coord_y) et les limites physiques (y_min, y_max)."
  },
  # [NOTE POUR L'UTILISATEUR] : Ici on commence par ZONES. 
  # Le but est de te forcer à visualiser l'espace physique avant l'idée. 
  # Tu dois d'abord remplir : Zones, puis Materiels, puis FicheTechnique.

  {
    title: "Détour #2 : L'Algorithme de l'Hésitation (Départ : ARTISTIC_PROCESS)",
    concept: "Documenter les versions que l'I.A. a rejetées pour trouver le 'bug' parfait.",
    challenge: "Rendre l'erreur système poétique.",
    action: "1. Noter un ArtisticProcess (Rejected Ideas). 2. Créer un Style 'Digital Glitch'. 3. Générer des AmbianceOptions (Machine_brouillard : 'hoquet intermittent').",
    database_usage: "Tables utilisées : ArtisticProcesses -> Styles -> AmbianceOptions -> SequenceTemplates -> Conducteurs -> ConducteurLines.",
    reaction: "Le conducteur final est une succession de 'presque' bonnes idées. C'est magnifique car c'est instable.",
    storage_impact: "Augmente l'iteration_count et remplit les colonnes 'rejected_ideas' et 'final_form'."
  },
  # [NOTE POUR L'UTILISATEUR] : Ici on commence par ARTISTIC_PROCESS. 
  # On ne commence PAS par le résultat (Conducteur). 
  # Tu dois d'abord remplir : ArtisticProcess (tes doutes), puis Style, puis seulement ton Conducteur.

  {
    title: "Détour #3 : La Fréquence de l'Incompris (Départ : SHARE_YOUR_GAPS)",
    concept: "Partir du désaccord total entre l'homme et la machine.",
    challenge: "Interroger le 'Blind Spot' de l'I.A.",
    action: "1. Écrire un ShareYourGap (Analysis vs Response). 2. Définir une ArtisticLimit (Why untranslatable). 3. Lier à une Interpretation humaine.",
    database_usage: "Tables utilisées : ShareYourGaps -> Interpretations -> ArtisticLimits -> ShowThemes -> ProjetArtistiques -> EmotionalMarkers.",
    reaction: "L'I.A. analyse le tempo, l'humain ressent la mélancolie du temps qui passe. Le détour enregistre ce divorce.",
    storage_impact: "Remplit les colonnes de 'human_judgment', 'the_gap' et 'emotional_truth'."
  },
  # [NOTE POUR L'UTILISATEUR] : Ici on commence par SHARE_YOUR_GAPS. 
  # Le but est de commencer par la CRITIQUE. 
  # Tu dois d'abord remplir : ShareYourGaps, puis Interpretation, puis ProjetArtistique.

  {
    title: "Détour #4 : L'Héritage Analogique (Départ : INSPIRATION_RESOURCES)",
    concept: "Nourrir la base de données avec des souvenirs non-numériques.",
    challenge: "Transformer une URL en une vibration lumineuse.",
    action: "1. Piocher une InspirationResource. 2. Créer une ArtisticNote (poétique). 3. Déterminer une MetierDependency (ce qu'il faut physiquement pour réaliser ce rêve).",
    database_usage: "Tables utilisées : InspirationResources -> ArtisticNotes -> MetierDependencies -> ThemeSuggestions -> ConducteurHasMarkers -> ConducteurHasThemes.",
    reaction: "Une photo de 1920 devient la directive pour un stroboscope en 2026.",
    storage_impact: "Remplit les colonnes 'category', 'url', 'content' et 'qty_multiplier'."
  }
  # [NOTE POUR L'UTILISATEUR] : Ici on commence par INSPIRATION_RESOURCES. 
  # Le but est de sortir de ton propre cerveau. 
  # Tu dois d'abord remplir : InspirationResources, puis ArtisticNotes, puis MetierDependencies.
])

puts "✅ Les Détours Créatifs ont été semés. L'Intelligence Artistique peut commencer son voyage."
