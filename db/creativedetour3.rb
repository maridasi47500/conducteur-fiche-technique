# db/seeds.rb

# =============================================================================================
# DETOUR 1 : "L'IMPULSION FANTÔME"
# Départ : table 'artistic_processes' (On commence par l'origine humaine de l'idée).
# But : Capturer la trace de ce que l'IA ne peut pas simuler : l'incertitude créative.
# Tables couvertes : artistic_processes, artistic_notes, theme_suggestions, inspiration_resources, 
#                   emotional_markers, conducteurhasmarkers.
# =============================================================================================

CreativeDetour.create!(
  title: "L'Impulsion Fantôme",
  concept: "Documenter la naissance d'une idée qui échappe au binaire avant qu'elle ne devienne technique.",
  action: "Ouvrir un carnet de notes numérique pour piéger les doutes de l'artiste.",
  database_usage: "
    1. ARTISTIC_PROCESSES : Remplis 'initial_impulse' avec ton frisson de départ, 'doubts_questions' avec ce qui te fait peur, et 'rejected_ideas' avec ce que l'IA t'a proposé et que tu as refusé.
    2. ARTISTIC_NOTES : Remplis 'title' avec le nom de ton secret et 'content' avec ton manifeste personnel.
    3. THEME_SUGGESTIONS : Remplis 'category' par une discipline et 'title' par une idée que tu lances au système.
    4. INSPIRATION_RESOURCES : Remplis 'url' avec une œuvre qui te fait pleurer et 'category' par son domaine.
    5. EMOTIONAL_MARKERS : Remplis 'name' par une émotion complexe (ex: nostalgie du futur).
    6. CONDUCTEURHASMARKERS : Lie ton émotion à une étape du spectacle.",
  reaction: "La base de données contient désormais une preuve d'humanité non-linéaire.",
  storage_impact: "Remplit les tables de réflexion pour forcer l'IA à lire tes doutes avant de proposer une solution.",
  challenge: "Accepter que l'incertitude est une donnée artistique plus précieuse que la certitude technique."
)

# =============================================================================================
# DETOUR 2 : "L'ANATOMIE DU VIDE"
# Départ : table 'zones' (On définit l'espace avant les objets).
# But : Transformer le plateau technique en une géographie émotionnelle.
# Tables couvertes : zones, materiels, metier_dependencies, fiche_techniques, 
#                   materiel_necessaires, plan_de_scene_dessins.
# =============================================================================================

CreativeDetour.create!(
  title: "L'Anatomie du Vide",
  concept: "Chaque zone de la scène est un territoire mental. Le matériel n'est qu'un habitant de ces zones.",
  action: "Cartographier l'invisible sur le plan de scène technique.",
  database_usage: "
    1. ZONES : Remplis 'name' par une sensation spatiale (ex: zone du silence) et définis ses coordonnées.
    2. MATERIELS : Remplis 'name' par un objet humanisé et 'category' par sa famille poétique.
    3. METIER_DEPENDENCIES : Remplis 'note' par la raison émotionnelle pour laquelle cet objet a besoin d'un autre (dépendance affective).
    4. FICHE_TECHNIQUES : Remplis 'name_event' par le titre de ton projet artistique et 'notes_complementaires' par les rituels de montage.
    5. MATERIEL_NECESSAIRES : Remplis 'precisions_observations' par la manière dont chaque câble doit être caché ou montré.
    6. PLAN_DE_SCENE_DESSINS : Remplis 'disposition' par l'agencement visuel de tes rêves et 'layer' par la profondeur du souvenir.",
  reaction: "Le technicien lit un poème au lieu d'une liste de câbles.",
  storage_impact: "Donne une âme aux objets froids en les liant à des zones de ressenti.",
  challenge: "Faire oublier le voltage pour ne laisser voir que la vibration."
)

# =============================================================================================
# DETOUR 3 : "LA MACHINE À DIRECTIVES"
# Départ : table 'styles' (On définit l'esthétique globale).
# But : Programmer les 'réflexes' de l'IA pour qu'elle réagisse comme ton extension créative.
# Tables couvertes : styles, ambiance_options, stage_themes, directive_artistiques, 
#                   sequence_templates, projet_artistiques, show_themes.
# =============================================================================================

CreativeDetour.create!(
  title: "La Machine à Directives",
  concept: "Infiltrer le 'cerveau' de l'application en modifiant ses préférences esthétiques.",
  action: "Créer des modèles de comportement que l'IA utilisera par défaut.",
  database_usage: "
    1. STYLES : Remplis 'name' par une esthétique hybride (ex: Cyber-Poésie).
    2. AMBIANCE_OPTIONS : Remplis 'value' par une couleur ou une sensation (ex: lumière d'avant l'orage).
    3. STAGE_THEMES : Remplis 'name' par le thème de ton décor.
    4. DIRECTIVE_ARTISTIQUES : Remplis 'default_son' par une consigne sonore poétique et 'default_sequenceaction' par un geste.
    5. SEQUENCE_TEMPLATES : Remplis 'label' par le nom du mouvement et 'target_talent' par la personne qui l'exécute.
    6. PROJET_ARTISTIQUES : Remplis 'status' par l'état d'avancement de ton âme.
    7. SHOW_THEMES : Remplis 'philosophical_inquiry' par la question que tu poses à la machine et 'ai_blind_spot' par ce qu'elle ne verra jamais.",
  reaction: "L'automatisation devient un outil de signature artistique.",
  storage_impact: "Standardise tes obsessions pour que l'IA puisse les reproduire sans les comprendre.",
  challenge: "Traduire tes goûts en algorithmes de mise en scène."
)

# =============================================================================================
# DETOUR 4 : "LE TRIBUNAL DU SENS"
# Départ : table 'share_your_gaps' (On confronte l'humain et l'IA).
# But : Rendre visible l'écart (The Gap) entre le calcul et l'émotion.
# Tables couvertes : share_your_gaps, conducteurs, conducteurlines, conducteurhasthemes, 
#                   interpretations, artistic_limits.
# =============================================================================================

CreativeDetour.create!(
  title: "Le Tribunal du Sens",
  concept: "Le conducteur n'est plus un planning, c'est un dialogue critique entre l'homme et la machine.",
  action: "Mettre en scène l'échec de l'IA à comprendre l'interprétation humaine.",
  database_usage: "
    1. SHARE_YOUR_GAPS : Remplis 'analysis' par ce que l'IA a cru voir et 'response' par ton cri de vérité.
    2. CONDUCTEURS : Remplis 'title' par le nom final de ton œuvre et 'notes' par le bilan du combat.
    3. CONDUCTEURLINES : Remplis 'notes_artistique' par ce que l'interprète doit ressentir et 'creative_notes' par ce que l'IA a oublié.
    4. CONDUCTEURHASTHEMES : Relie ton conducteur final aux thèmes philosophiques.
    5. INTERPRETATIONS : Remplis 'the_gap' par la description du vide et 'artistic_truth' par ta conclusion finale.
    6. ARTISTIC_LIMITS : Remplis 'what_i_want' par ton désir impossible et 'emotional_truth' par la beauté du bug.",
  reaction: "L'œuvre finale naît de l'impossibilité de l'IA à être totalement humaine.",
  storage_impact: "Verrouille le projet artistique en soulignant ses limites volontaires.",
  challenge: "Faire du bug et de l'incompréhension le centre de la performance."
)

# =============================================================================================
# COMMENTAIRE DU SEED :
# J'ai choisi la POSSIBILITÉ 2. 
# Aucun détour ne commence par la même table.
# ORDRE DE REMPLISSAGE CONSEILLÉ POUR TOI :
# 1. Détour 1 : L'Impulsion (Processus -> Notes -> Émotions). 
#    But : Définir l'intention invisible.
# 2. Détour 2 : L'Anatomie (Zones -> Matériel -> Plan). 
#    But : Préparer le corps physique du spectacle.
# 3. Détour 3 : La Machine (Styles -> Directives -> Templates). 
#    But : Programmer les outils de création.
# 4. Détour 4 : Le Tribunal (Gaps -> Conducteur -> Limites). 
#    But : Finaliser la confrontation et l'œuvre.
#
# NOTE : Les colonnes artistiques sont à remplir par ton texte poétique, 
# les colonnes techniques par tes réglages. L'IA ne les remplit pas pour toi 
# car c'est là que réside TA 'vibration humaine' demandée par le thème.
# =============================================================================================
