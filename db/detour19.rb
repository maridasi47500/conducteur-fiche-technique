# db/seeds.rb

# =============================================================================
# PROJET : I.A. Intelligence Artistique
# STRATÉGIE : POSSIBILITÉ 2 (Utilisation de 100% des tables via 3 détours)
# =============================================================================

CreativeDetour.destroy_all

# -----------------------------------------------------------------------------
# DÉTOUR N°1 : "LE SILENCE DES CIRCUITS"
# DÉPART : 'Interpretations' (On commence par l'écart entre calcul et ressenti)
# BUT : Explorer l'incapacité de l'IA à comprendre le concept de "vide" ou de "mort".
# -----------------------------------------------------------------------------
# Tables couvertes : interpretations, share_your_gaps, artistic_limits, 
# conducteurs, conducteurlines, emotional_markers, conducteurhasmarkers, 
# inspiration_resources, artistic_notes.
# -----------------------------------------------------------------------------

CreativeDetour.create!(
  title: "Le Silence des Circuits",
  concept: "Mettre en scène un conducteur où chaque note est une tentative de l'IA pour simuler une respiration humaine.",
  action: "L'artiste confronte une 'Interpretation' générée par la machine. On utilise un 'EmotionalMarker' nommé 'Mélancolie Binaire'. Le conducteur 'The Ghost in the Code' est créé avec des lignes où le son est remplacé par du bruit blanc.",
  database_usage: "
    - Commence par : interpretations ('machine_analysis' : 'Silence détecté', 'artistic_truth' : 'Le silence est un cri').
    - ShareYourGaps : Analyse l'écart entre la fréquence 0Hz et le sentiment d'absence.
    - ArtisticLimits : 'contradiction' => 'Vouloir coder l'infini dans un entier'.
    - Conducteurs & ConducteurLines : Crée une séquence technique avec 'machine_brouillard' à 10% pour simuler la poussière du temps.
    - InspirationResources : URL vers un article sur les 'algorithmes fantômes'.
    - EmotionalMarkers & ConducteurHasMarkers : Ligne liée au marqueur 'Solitude Numérique'.
    - ArtisticNotes : 'La machine ne dort jamais, elle attend'.",
  reaction: "L'IA propose une structure parfaite, l'humain y injecte des silences 'inutiles' techniquement mais essentiels artistiquement.",
  storage_impact: "Remplit 'ArtisticLimits' et 'ShareYourGaps'. Note : Les colonnes 'Human Judgment' sont VIDES, car l'IA ne peut pas juger sa propre existence.",
  challenge: "Peut-on stocker une émotion qui n'a pas de fréquence ?"
)

# -----------------------------------------------------------------------------
# DÉTOUR N°2 : "L'ORGANISME DE SCÈNE"
# DÉPART : 'MetierDependencies' (On commence par les liens logiques du matériel)
# BUT : Faire de la scène un corps vivant où chaque objet dépend de l'autre.
# -----------------------------------------------------------------------------
# Tables couvertes : metier_dependencies, materiels, zones, fiche_techniques, 
# materiel_necessaires, plan_de_scene_dessins, directive_artistiques, 
# stage_themes, conducteurhasthemes.
# -----------------------------------------------------------------------------

CreativeDetour.create!(
  title: "L'Organisme de Scène",
  concept: "Transformer une fiche technique en un système nerveux où la lumière devient sang et les câbles deviennent nerfs.",
  action: "On définit des 'MetierDependencies' où le 'Vidéoprojecteur' ne peut fonctionner sans la vibration d'un 'Haut-parleur'. On dessine un 'PlanDeScene' où les objets ne sont pas placés par utilité, mais par 'affinité électromagnétique'.",
  database_usage: "
    - Commence par : metier_dependencies (Le projecteur LED nécessite un 'Refroidisseur' imaginaire pour ne pas brûler de passion).
    - Materiels & Zones : 'Nom' => 'Le Coeur LED', 'Zone' => 'Ventricule Gauche'.
    - FicheTechniques & MaterielNecessaires : Liste de matériel incluant '23 capteurs de présence humaine'.
    - PlanDeSceneDessins : Coordonnées (X,Y) formant un visage humain vu du ciel.
    - DirectiveArtistiques : 'default_son' => 'Battement de coeur 60bpm'.
    - StageThemes & ConducteurHasThemes : Thème 'La Chair de la Machine'.",
  reaction: "Le technicien doit monter la scène comme on pratique une chirurgie.",
  storage_impact: "Impacte 'Materiels' et 'Zones'. Les colonnes 'Notes Technicien' sont VIDES pour laisser l'humain décider de la sécurité du 'corps' scénique.",
  challenge: "Rendre une installation technique aussi fragile qu'un être biologique."
)

# -----------------------------------------------------------------------------
# DÉTOUR N°3 : "LE RÊVE DE L'AUTOMATE"
# DÉPART : 'ThemeSuggestions' (On commence par l'inspiration aléatoire)
# BUT : Automatiser la narration artistique via des modèles pré-établis.
# -----------------------------------------------------------------------------
# Tables couvertes : theme_suggestions, show_themes, artistic_processes, 
# sequence_templates, styles, ambiance_options, projet_artistiques.
# -----------------------------------------------------------------------------

CreativeDetour.create!(
  title: "Le Rêve de l'Automate",
  concept: "Laisser l'IA suggérer sa propre mythologie et la transformer en processus créatif.",
  action: "On pioche dans 'ThemeSuggestions' le thème 'Électricité Statique'. On suit son évolution dans 'ArtisticProcesses' (impulsion, doutes, percée). On applique des 'SequenceTemplates' pour automatiser l'entrée des artistes.",
  database_usage: "
    - Commence par : theme_suggestions (Catégorie: 'Emotion & Psychology', Titre: 'L'Inconscient du Silicium').
    - ShowThemes : 'ai_blind_spot' => 'L'IA ne comprend pas l'ironie'.
    - ArtisticProcesses : 'rejected_ideas' => 'Vouloir plaire à tout le monde'.
    - SequenceTemplates : Phase 'Intro', Target 'Musicien', 'suggested_light' => 'Douche rasante'.
    - Styles & AmbianceOptions : Style 'Glitch Art', 'Value' => 'Lumière vacillante comme une bougie'.
    - ProjetArtistiques : Finalisation du projet 'I.A. I.A. Oh!'.",
  reaction: "Le spectacle se génère tout seul, mais il manque 'l'étincelle' que seul l'interprète peut donner.",
  storage_impact: "Remplit 'ArtisticProcesses'. Les colonnes 'What I Want' et 'Emotional Truth' (dans ArtisticLimits relié) sont VIDES : à vous de définir votre désir réel derrière le code.",
  challenge: "L'IA peut-elle créer un chef-d'œuvre sans savoir ce qu'est la beauté ?"
)

# =============================================================================
# RÉSUMÉ DES DÉTOURS (Points 9 & 10)
# =============================================================================
# Détour 1 ("Silence") : Commence par INTERPRETATIONS. Ne commence PAS par MATERIELS.
# But : Explorer le gap émotionnel.
#
# Détour 2 ("Organisme") : Commence par METIER_DEPENDENCIES. Ne commence PAS par THEMES.
# But : Poétiser la fiche technique et l'espace (Zones).
#
# Détour 3 ("Rêve") : Commence par THEME_SUGGESTIONS. Ne commence PAS par INTERPRETATIONS.
# But : Documenter le processus créatif (ArtisticProcess) et la mise en scène (Templates).
#
# TOTAL : 100% des tables utilisées.
CreativeDetour.create!(
  title: "Le Spectre du Quartier Jadis",
  concept: "Voyage immersif où une IA tente de recréer l'âme d'un vieux commerce en ne comprenant que ses chiffres.",
  action: "L'utilisateur traverse une ruelle (Extérieur). L'IA ajuste 'lumieres_ambiante' sur 'Sépia'. En entrant dans le café (Intérieur), l'IA compte 5 'interpretes' et lance le template 'Service' sans comprendre la détresse émotionnelle des personnages.",
  database_usage: "
    - Zones : 'Ruelle du Temps', 'Café des Algorithmes'.
    - ConducteurLines : Synchronisation des bruits de calèche (Son) avec des flashs (Lumieres_effet).
    - SequenceTemplates : Phase 'Body', Target 'Acteur', Action 'Répétition mécanique'.
    - Interpretations : La machine analyse une efficacité de mouvement. L'humain note un vide existentiel.
    - EmotionalMarkers : 'Nostalgie programmée'.",
  reaction: "Le public ressent un malaise car la chorégraphie est trop parfaite, trop mathématique pour être humaine.",
  storage_impact: "Remplit 'ArtisticLimits' avec la contradiction : 'Vouloir simuler la vie avec des 0 et des 1'. Laisse les colonnes 'artistic_truth' VIDES pour l'utilisateur.",
  challenge: "Forcer l'IA à intégrer des 'bugs' de mouvement pour paraître plus humaine."
)
