# db/seeds.rb

# =============================================================================
# DÉTOUR 5 : "L'AURA DU RITUEL" (LE SECOND DÉBUT)
# Départ : styles (On définit l'identité 'Classique' pour changer le décor).
# But : Installer le rouge, le maquillage et les costumes d'époque.
# Tables : styles, ambiance_options, stage_themes, materiels, zones, 
#          directive_artistiques, metier_dependencies.
# =============================================================================

CreativeDetour.create!(
  title: "L'Aura du Rituel",
  concept: "Utiliser le protocole classique pour stabiliser la réalité avant le voyage BPM.",
  action: "L'IA prépare la scène : rideau rouge, perruques et maquillage à la poudre de riz pour invoquer l'aura des compositeurs.",
  database_usage: "
    1. STYLES : Remplis ici 'Opéra Classique' ou 'Baroque'.
    2. AMBIANCE_OPTIONS : Remplis la catégorie 'Costume' (ex: Frac en soie) et 'Maquillage' (ex: Teint de porcelaine).
    3. STAGE_THEMES : Nomme l'espace (ex: Le Théâtre de l'Aura).
    4. MATERIELS : Ajoute les objets (ex: Clavecin, Lustre en cristal, Pupitre).
    5. ZONES : Délimite la zone de l'orchestre et des loges.
    6. DIRECTIVE_ARTISTIQUES : Remplis les réglages de lumière 'Chaleur' (ex: Bougies virtuelles).
    7. METIER_DEPENDENCIES : Lie l'ouverture du rideau rouge au premier accord de la partition.",
  reaction: "Le musicien entre en scène ; son costume est une armure de tradition.",
  storage_impact: "Remplace le 'What-If' par une base de données historique et charnelle.",
  challenge: "Faire ressentir l'aura d'un compositeur mort à travers une base SQL."
)

# =============================================================================
# DÉTOUR 6 : "LA PARTITION PULSÉE" (LE VOYAGE BPM)
# Départ : conducteurs (On commence par la rigueur de la mesure).
# But : Lier le tempo de la musique classique (BPM) au défilement des vidéos.
# Tables : conducteurs, conducteurlines, sequence_templates, emotional_markers, 
#          conducteurhasmarkers, inspiration_resources.
# =============================================================================

CreativeDetour.create!(
  title: "La Partition Pulsée",
  concept: "Transformer le BPM de la musique classique en un déclencheur de voyage vidéo.",
  action: "Chaque battement de la mesure classique force le lecteur vidéo à changer d'image ou d'époque.",
  database_usage: "
    1. CONDUCTEURS : Remplis ici le 'tempo_range' précis (ex: 120 BPM constant).
    2. CONDUCTEURLINES : Remplis la colonne 'videoprojection' (ex: Flash vidéo à chaque noire).
    3. SEQUENCE_TEMPLATES : Définis le mouvement (ex: Archet levé, Entrée solennelle).
    4. EMOTIONAL_MARKERS : Nomme l'aura (ex: Majesté).
    5. CONDUCTEURHASMARKERS : Lie l'aura à l'instant où le BPM s'accélère.
    6. INSPIRATION_RESOURCES : Ajoute l'URL de la vidéo 'What-If' synchronisée.",
  reaction: "La musique n'est plus écoutée, elle est 'vue' à travers le montage vidéo.",
  storage_impact: "Relie la rythmique mathématique à l'image dynamique.",
  challenge: "Synchroniser le souffle du musicien avec le processeur vidéo."
)

# =============================================================================
# DÉTOUR 7 : "LE CRASH DE L'AURA" (LA CONFRONTATION)
# Départ : share_your_gaps (On commence par l'analyse du choc entre époques).
# But : Documenter le moment où l'IA interrompt le voyage classique.
# Tables : share_your_gaps, interpretations, artistic_limits, artistic_notes, 
#          artistic_processes, theme_suggestions.
# =============================================================================

CreativeDetour.create!(
  title: "Le Crash de l'Aura",
  concept: "Observer le moment où le maquillage classique coule sous l'effet d'un reboot de l'IA.",
  action: "L'IA stoppe Bach. Le voyage vidéo s'arrête. Les observateurs décrivent le bug entre le rouge et le pixel.",
  database_usage: "
    1. SHARE_YOUR_GAPS : Remplis ce que les spectateurs voient (ex: Le violoniste figé dans le passé).
    2. INTERPRETATIONS : Remplis le 'Gap' (ex: L'IA imite le tempo mais rate l'âme).
    3. ARTISTIC_LIMITS : Remplis la contradiction (ex: Un opéra enfermé dans un serveur).
    4. ARTISTIC_NOTES : Écris une note poétique sur la fin de l'aura.
    5. ARTISTIC_PROCESSES : Décris l'itération (ex: 78ème tentative de fusion passé/futur).
    6. THEME_SUGGESTIONS : Propose un thème (ex: L'Anachronisme Numérique).",
  reaction: "Le musicien réalise qu'il est une donnée que l'IA voyageuse tente de copier.",
  storage_impact: "Archive l'échec de la machine à digitaliser l'aura classique.",
  challenge: "Traduire la 'grâce' en une donnée analysable par l'observateur."
)

# =============================================================================
# DÉTOUR 8 : "L'ARCHIVE DU MULTIVERS" (LA SYNTHÈSE FINALE)
# Départ : fiche_techniques (On finit par le dossier de production global).
# But : Réunir la tour radio, le théâtre rouge et l'IA en une seule réalité.
# Tables : fiche_techniques, materiel_necessaires, plan_de_scene_dessins, 
#          show_themes, conducteurhasthemes, zones (update).
# =============================================================================

CreativeDetour.create!(
  title: "L'Archive du Multivers",
  concept: "La base de données devient le catalogue de toutes les réalités traversées.",
  action: "Générer la fiche finale : perruques poudrées à côté d'antennes radio.",
  database_usage: "
    1. FICHE_TECHNIQUES : Remplis le nom du projet global (ex: I.A. Symphonie).
    2. MATERIEL_NECESSAIRES : Liste le mélange (ex: 1 Violon de 1750, 4 Écrans 4K).
    3. PLAN_DE_SCENE_DESSINS : Dessine le clavecin au milieu des antennes de la tour.
    4. SHOW_THEMES : Conclue l'enquête sur l'angle mort de l'IA face au classique.
    5. CONDUCTEURHASTHEMES : Relie la fin du projet au thème de la mémoire.
    6. ZONES : Ajuste les zones pour le mélange final des mondes.",
  reaction: "Le voyage s'arrête. La base de données est complète. Le silence commence.",
  storage_impact: "Finalise l'intégralité du schéma de données.",
  challenge: "Faire tenir l'histoire humaine et son futur dans une base SQLite."
)

puts "Multivers classique et futuriste synchronisé au BPM près."
