# db/seeds.rb

# =============================================================================
# PROJET : I.A. Intelligence Artistique
# MISSION : Simuler l'usage de toutes les tables via des détours créatifs
# =============================================================================

CreativeDetour.destroy_all

# -----------------------------------------------------------------------------
# DÉTOUR N°1 : "Le Fantôme dans la Console"
# DEPART : Table 'ArtisticLimits' (On commence par l'impossible)
# BUT : Explorer ce que la machine ne peut pas traduire.
# TABLES COUVERTES : artistic_limits, conducteurs, conducteurlines, emotional_markers, 
#                   conducteurhasmarkers, artistic_notes, inspiration_resources, 
#                   interpretations, share_your_gaps.
# -----------------------------------------------------------------------------

CreativeDetour.create!(
  title: "Le Fantôme dans la Console",
  concept: "Mettre en scène l'échec de la numérisation d'un soupir humain.",
  action: "L'artiste tente d'enregistrer une 'ArtisticLimit' où l'émotion est 'La mélancolie du processeur qui surchauffe'. On crée un 'Conducteur' intitulé 'Silicon Soul' où les 'ConducteurLines' oscillent entre silence technique et saturation sonore.",
  database_usage: "
    - ArtisticLimit: 'why_untranslatable' => 'La vitesse du calcul tue l'hésitation du coeur'.
    - EmotionalMarker: 'Nostalgie binaire'.
    - Interpretation: 'the_gap' => 'La machine voit une crête de 12dB, l'humain entend un cri'.
    - InspirationResource: URL vers un article sur la 'Psychoacoustique'.
    - ShareYourGap: Analyse de la différence entre le tempo métronomique et le rubato humain.",
  reaction: "Le système génère une erreur volontaire, transformant le 'CreativeNote' en un poème de code source.",
  storage_impact: "Remplit 'ArtisticNotes' avec des fragments de phrases non structurées. Les colonnes artistiques (emotional_truth) sont prioritaires sur les colonnes techniques.",
  challenge: "Peut-on stocker un silence qui a du sens ?"
)

# -----------------------------------------------------------------------------
# DÉTOUR N°2 : "L'Architecture du Chaos"
# DEPART : Table 'Zones' (On commence par l'espace physique)
# BUT : Transformer le plan technique en une chorégraphie de lumière et de matière.
# TABLES COUVERTES : zones, materiels, materiel_necessaires, fiche_techniques, 
#                   plan_de_scene_dessins, metier_dependencies, ambiance_options, 
#                   styles, directive_artistiques.
# -----------------------------------------------------------------------------

CreativeDetour.create!(
  title: "L'Architecture du Chaos",
  concept: "Inverser le rôle du matériel : les projecteurs deviennent les interprètes.",
  action: "Définir des 'Zones' non pas par leur emplacement, mais par leur 'vibration'. Un 'Style' (ex: 'Cyber-Punk') impose des 'AmbianceOptions' où la fumée est 'épaisse comme le doute'. La 'FicheTechnique' devient une partition spatiale.",
  database_usage: "
    - Zones: 'name' => 'Zone de l'Oubli' (Y min: 0, Y max: 10).
    - Materiels: Une 'Lyre LED' avec 'requires_power' => true, mais 'name' => 'L'oeil d'Argus'.
    - MetierDependencies: Le brouillard dépend de l'intensité de la lumière (lien organique).
    - PlanDeSceneDessin: Coordonnées (X, Y) formant une constellation plutôt qu'un plan de scène.
    - DirectiveArtistique: 'default_son' => 'Bruit blanc 432Hz'.",
  reaction: "Le technicien ne reçoit pas une liste de câblage, mais une intention de mouvement.",
  storage_impact: "Lien entre 'FicheTechnique' et 'MaterielNecessaire'. La table 'Styles' dicte les 'AmbianceOptions'.",
  challenge: "Rendre le matériel 'vivant' via des dépendances métier poétiques."
)

# -----------------------------------------------------------------------------
# DÉTOUR N°3 : "La Métamorphose de l'Algorithme"
# DEPART : Table 'StageThemes' (On commence par le concept pur)
# BUT : Suivre l'évolution d'une idée, de l'impulsion à la structure finale.
# TABLES COUVERTES : stage_themes, show_themes, theme_suggestions, artistic_processes, 
#                   sequence_templates, projet_artistiques, conducteurhasthemes.
# -----------------------------------------------------------------------------

CreativeDetour.create!(
  title: "La Métamorphose de l'Algorithme",
  concept: "Documenter la naissance d'une oeuvre qui refuse de se terminer.",
  action: "On pioche dans 'ThemeSuggestions' pour nourrir un 'ShowTheme'. Le 'ArtisticProcess' enregistre chaque 'IterationCount'. Les 'SequenceTemplates' sont utilisés pour automatiser l'entrée des 'Danseurs' selon une 'Intensity' de 80%.",
  database_usage: "
    - StageTheme: 'L'Incertitude'.
    - ShowTheme: 'philosophical_inquiry' => 'L'IA peut-elle rêver de larmes ?'.
    - ArtisticProcess: 'breakthrough' => 'Le moment où j'ai arrêté de corriger les erreurs'.
    - SequenceTemplate: 'target_talent' => 'Chanteur/se', 'suggested_light' => 'Douche rasante'.
    - ProjetArtistique: Lie le 'Conducteur' (Détour 1) et la 'FicheTechnique' (Détour 2).",
  reaction: "Le projet passe du statut 'Draft' à 'In-Progress' mais jamais à 'Finished'.",
  storage_impact: "Remplit 'ConducteurHasThemes' pour lier la structure technique au sens philosophique.",
  challenge: "Capturer l'évolution (le 'What changed') dans une base de données statique."
)

# =============================================================================
# COMMENTAIRES DE MISSION (Points 9 & 10)
# =============================================================================
#
# DÉTOUR 1 : "Le Fantôme dans la Console"
# - Table de départ : 'ArtisticLimits' (On commence par le blocage).
# - Table non utilisée au début : 'Materiels'.
# - But : Questionner la "vérité émotionnelle" vs la "donnée technique". 
#   L'IA laisse ici les colonnes 'human_judgment' et 'response' (ShareYourGaps) 
#   VIDES pour que l'utilisateur puisse y injecter son âme.
#
# DÉTOUR 2 : "L'Architecture du Chaos"
# - Table de départ : 'Zones' (On commence par la géométrie).
# - Table non utilisée au début : 'ArtisticProcesses'.
# - But : Transformer la contrainte technique en poésie spatiale. C'est le détour 
#   le plus "technique" mais détourné par des noms d'objets poétiques.
#
# DÉTOUR 3 : "La Métamorphose de l'Algorithme"
# - Table de départ : 'StageThemes' (On commence par le sens).
# - Table non utilisée au début : 'ConducteurLines'.
# - But : Montrer le cycle de vie de l'idée (ArtisticProcess). Les colonnes 
#   'doubts_questions' et 'rejected_ideas' DOIVENT être remplies par l'artiste 
#   car l'IA ne peut pas simuler un "vrai" doute.
#
# NOTE FINALE : En combinant ces 3 détours, 100% des tables (sauf creative_detours 
# elle-même pour éviter la récursion) sont sollicitées.
