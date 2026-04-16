# db/seeds.rb

# =============================================================================================
# DETOUR 1 : "LE SOUFFLE DANS LA MACHINE" (L'APPROCHE PHILOSOPHIQUE)
# Début : show_themes (On commence par le "Pourquoi").
# But : Interroger l'incapacité de l'IA à comprendre l'émotion humaine.
# Tables couvertes : show_themes, projet_artistiques, styles, inspiration_resources, 
#                   artistic_limits, emotional_markers, conducteurhasmarkers, share_your_gaps.
# =============================================================================================

CreativeDetour.create!(
  title: "Le Souffle dans la Machine",
  concept: "Démarrer par l'enquête philosophique pour confronter l'IA à ses propres zones d'ombre.",
  action: "Définir une question humaine que l'algorithme ne peut pas résoudre avant de créer le spectacle.",
  database_usage: "
    1. SHOW_THEMES : Remplis ici l'enquête philosophique (ex: Pourquoi la solitude existe ?).
    2. PROJET_ARTISTIQUES : Donne un titre simple à cette recherche (ex: Projet Echo).
    3. STYLES : Définis le style général (ex: Jazz ou Abstrait).
    4. INSPIRATION_RESOURCES : Ajoute l'URL d'un article qui parle d'émotion humaine.
    5. ARTISTIC_LIMITS : Remplis ici ce que tu veux faire que l'IA ne peut pas coder (ex: Un silence gênant).
    6. EMOTIONAL_MARKERS : Remplis le nom d'une émotion de base (ex: Joie).
    7. CONDUCTEURHASMARKERS : Associe cette émotion à ton futur conducteur.
    8. SHARE_YOUR_GAPS : Écris ici pourquoi l'IA a râté son analyse de ton émotion.",
  reaction: "L'IA enregistre son propre échec, ce qui devient l'œuvre d'art.",
  storage_impact: "L'utilisateur doit d'abord réfléchir au sens avant de toucher aux boutons.",
  challenge: "Trouver la vibration humaine que l'IA ne peut pas copier."
)

# =============================================================================================
# DETOUR 2 : "L'AUTOMATE IMPARFAIT" (L'APPROCHE PAR LE GESTE)
# Début : sequence_templates (On commence par le "Mouvement").
# But : Créer une chorégraphie automatisée pour voir où le corps humain déborde.
# Tables couvertes : sequence_templates, stage_themes, directive_artistiques, conducteurs, 
#                   conducteurlines, artistic_processes, artistic_notes.
# =============================================================================================

CreativeDetour.create!(
  title: "L'Automate Imparfait",
  concept: "Partir du mouvement pré-défini pour piéger l'humain dans une boucle technique.",
  action: "Lancer des séquences de lumières et d'actions automatiques et noter les erreurs humaines.",
  database_usage: "
    1. SEQUENCE_TEMPLATES : Remplis la phase (ex: Intro) et le mouvement (ex: Entrée lente).
    2. STAGE_THEMES : Donne un nom à l'ambiance de scène (ex: L'Ombre).
    3. DIRECTIVE_ARTISTIQUES : Remplis la consigne de lumière par défaut (ex: Tout en bleu).
    4. CONDUCTEURS : Remplis le titre de la partition (ex: Ballet Binaire).
    5. CONDUCTEURLINES : Remplis l'ordre des actions et les notes artistiques pour l'acteur.
    6. ARTISTIC_PROCESSES : Décris ici ton premier essai et ce que tu as rejeté (ex: Trop rapide).
    7. ARTISTIC_NOTES : Remplis le titre de ta note (ex: Idée de génie).",
  reaction: "Le conducteur devient une contrainte que l'humain doit essayer de briser.",
  storage_impact: "Structure la base de données autour du mouvement et de la répétition.",
  challenge: "Rester humain dans une séquence qui ne s'arrête jamais."
)

# =============================================================================================
# DETOUR 3 : "LES OBJETS QUI RÊVENT" (L'APPROCHE TECHNIQUE)
# Début : zones (On commence par "L'Espace").
# But : Transformer le matériel froid en une constellation de personnages.
# Tables couvertes : zones, materiels, metier_dependencies, fiche_techniques, 
#                   materiel_necessaires, plan_de_scene_dessins, ambiance_options, 
#                   interpretations, theme_suggestions, conducteurhasthemes.
# =============================================================================================

CreativeDetour.create!(
  title: "Les Objets qui Rêvent",
  concept: "Donner un rôle aux machines pour qu'elles ne soient plus seulement des outils.",
  action: "Organiser l'espace scénique comme une discussion entre les projecteurs et les câbles.",
  database_usage: "
    1. ZONES : Remplis le nom de l'espace (ex: Zone A ou Le Centre).
    2. MATERIELS : Remplis le nom de l'objet (ex: Projecteur 1).
    3. METIER_DEPENDENCIES : Remplis la note sur le lien entre deux objets (ex: A besoin de B).
    4. FICHE_TECHNIQUES : Remplis le nom de l'élève responsable du montage.
    5. MATERIEL_NECESSAIRES : Remplis la quantité d'objets (ex: 2 lampes).
    6. PLAN_DE_SCENE_DESSINS : Remplis les coordonnées (X et Y) pour placer l'objet.
    7. AMBIANCE_OPTIONS : Remplis la valeur de l'ambiance (ex: Blanc chaud).
    8. INTERPRETATIONS : Remplis la vérité artistique trouvée par l'humain.
    9. THEME_SUGGESTIONS : Remplis une proposition de thème (ex: La machine fatiguée).
    10. CONDUCTEURHASTHEMES : Relie ton matériel au thème global.",
  reaction: "La fiche technique devient une carte de personnalités.",
  storage_impact: "Remplit les tables spatiales et matérielles pour ancrer l'idée dans le réel.",
  challenge: "Faire en sorte qu'un simple câble raconte une histoire."
)

puts "Détours créatifs générés avec succès !"
