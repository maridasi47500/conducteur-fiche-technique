# db/seeds.rb

# =============================================================================================
# STRATÉGIE DE GÉNÉRATION DES DÉTOURS CRÉATIFS
# Projet : I.A. Intelligence Artistique
#
# MISSION : Couvrir 100% des tables du schéma via des objets 'CreativeDetour'.
# Chaque détour commence par une table différente pour explorer une facette du thème :
# "La place de l'humain face à la machine".
# =============================================================================================

# --- DÉTOUR 1 : LE SOUFFLE DANS LE CIRCUIT ---
# Table de départ : artistic_notes (C'est la graine émotionnelle)
# Tables couvertes : artistic_notes, styles, ambiance_options, sequence_templates, conducteurlines
CreativeDetour.create!(
  title: "Le Souffle dans le Circuit",
  concept: "Transformer une note poétique sur l'hésitation humaine en une séquence de mouvements automatisés.",
  action: "1. Créer une [artistic_notes] intitulée 'Le Tremblement'. 2. Définir un [styles] 'Bio-Digital'. 3. Mapper des [ambiance_options] pour traduire le doute en brouillard.",
  database_usage: "
    - [artistic_notes] : title='Le Tremblement', content='Ce moment où le doigt hésite avant la touche'.
    - [styles] : name='Bio-Digital'.
    - [ambiance_options] : category='Lumière', value='Fluctuation organique (PWM instable)'.
    - [sequence_templates] : label='Entrée hésitante', phase='Intro', target_talent='Danseur', suggested_light='Stroboscope doux', intensity='12%'.
    - [conducteurlines] : sequenceaction='L'interprète imite le défilement d'un code buggé', lumieres_ambiante='Vert terminal', creative_notes='[VIDE - À remplir par l'acteur : que ressentez-vous quand la machine vous dicte votre rythme ?]'.
  ",
  reaction: "La machine génère une séquence où l'intensité lumineuse est indexée sur la respiration (fictive) de l'IA.",
  storage_impact: "Remplissage massif de la colonne 'creative_notes' avec des interrogations sur la synchro.",
  challenge: "Faire en sorte que la 'machine_brouillard' semble respirer.",
  # COMMENTAIRE MISSION : Je commence par 'artistic_notes' (la pensée). Je ne commence pas par la technique.
)

# --- DÉTOUR 2 : L'ARCHITECTURE DU VIDE ---
# Table de départ : zones (L'espace physique avant l'idée)
# Tables couvertes : zones, materiels, metier_dependencies, fiche_techniques, materiel_necessaires, plan_de_scene_dessins
CreativeDetour.create!(
  title: "L'Architecture du Vide",
  concept: "Définir l'absence humaine par la disposition géométrique des machines.",
  action: "1. Segmenter le plateau en [zones] de silence. 2. Disposer le [materiels] pour créer une prison de lumière. 3. Lier les machines par des [metier_dependencies] de dépendance mutuelle.",
  database_usage: "
    - [zones] : name='Le Panoptique', y_min=0, y_max=100.
    - [materiels] : name='Scanner Laser', zone_id=1, power_needed=true.
    - [metier_dependencies] : Le Laser nécessite un 'Miroir brisé' pour disperser la logique.
    - [fiche_techniques] : name_event='Géométrie de l'Enfermement', eleve_responsable='Le Géomètre'.
    - [materiel_necessaires] : quantite='12', precisions_observations='Doivent être orientés vers le public pour l'éblouir'.
    - [plan_de_scene_dessins] : disposition='Circulaire', coord_x=0, coord_y=0, layer='Structure'.
  ",
  reaction: "Le plan de scène dessine un cercle parfait où aucun humain ne peut se tenir sans être 'scanné'.",
  storage_impact: "Saturation de la table 'materiel_necessaires' avec des objets non-conventionnels.",
  challenge: "Utiliser la 'zone_id' pour créer des zones de non-droit artistique.",
  # COMMENTAIRE MISSION : Je commence par 'zones' (l'espace). Je ne commence pas par l'émotion.
)

# --- DÉTOUR 3 : LE DIALOGUE DES CASSURES ---
# Table de départ : artistic_limits (L'échec comme moteur)
# Tables couvertes : artistic_limits, share_your_gaps, interpretations, conducteurs, emotional_markers, conducteurhasmarkers
CreativeDetour.create!(
  title: "Le Dialogue des Cassures",
  concept: "Un face-à-face entre l'analyse binaire et le ressenti viscéral.",
  action: "1. Lister les [artistic_limits] du projet. 2. Créer un [conducteurs] qui enregistre l'écart entre la machine et l'humain dans [share_your_gaps].",
  database_usage: "
    - [artistic_limits] : what_i_want='Programmer l'imprévisible', why_untranslatable='Le processeur ne connaît pas l'ennui', emotional_truth='L'art est un bug superbe'.
    - [share_your_gaps] : analysis='L'IA propose une accélération du tempo pour combler le vide', response='Non, le vide est le message'.
    - [interpretations] : machine_analysis='Structure incohérente', human_judgment='C'est un cri, pas une structure', the_gap='42% de dissonance émotionnelle'.
    - [conducteurs] : title='L'Algorithme du Cri', starred=true.
    - [emotional_markers] : name='Inconfort fertile'.
    - [conducteurhasmarkers] : Marque le moment précis où la machine 'perd' l'humain.
  ",
  reaction: "Le système s'auto-analyse comme étant 'en échec', ce qui devient la conclusion du spectacle.",
  storage_impact: "La table 'interpretations' devient plus volumineuse que le conducteur lui-même.",
  challenge: "Fixer 'l'éphémère' dans une base SQLite sans le tuer.",
  # COMMENTAIRE MISSION : Je commence par 'artistic_limits' (le mur). Je ne commence pas par le processus.
)

# --- DÉTOUR 4 : LES FANTÔMES DANS LA MÉMOIRE ---
# Table de départ : inspiration_resources (La culture externe)
# Tables couvertes : inspiration_resources, theme_suggestions, show_themes, stage_themes, conducteurhasthemes, directive_artistiques, projet_artistiques
CreativeDetour.create!(
  title: "Les Fantômes dans la Mémoire",
  concept: "Infecter la logique technique avec des références historiques et philosophiques.",
  action: "1. Puiser dans [inspiration_resources] (Pavane). 2. Générer des [theme_suggestions] sur l'absence. 3. Traduire cela en [directive_artistiques] automatisées.",
  database_usage: "
    - [inspiration_resources] : title='Pavane pour une infante défunte', url='...', category='Musique'.
    - [theme_suggestions] : title='L'Obsolescence de l'Âme'.
    - [show_themes] : philosophical_inquiry='L'IA peut-elle avoir une nostalgie de ce qu'elle n'a pas vécu ?'.
    - [stage_themes] : name='Mémoire Vive Effacée'.
    - [conducteurhasthemes] : Lie le thème à la performance finale.
    - [directive_artistiques] : name='Lueur d'Archives', default_son='Grésillement de vinyle filtré'.
    - [projet_artistiques] : title='I.A. Intelligence Artistique', status='Finalisé'.
  ",
  reaction: "La machine choisit des préréglages 'vintage' et 'poussiéreux' pour compenser sa propre modernité.",
  storage_impact: "Usage intensif des tables de 'directives' pour contourner le choix humain.",
  challenge: "Faire comprendre à l'IA la 'vibration humaine' de la mélancolie.",
  # COMMENTAIRE MISSION : Je commence par 'inspiration_resources' (l'externe). Je ne commence pas par la création pure.
)

# =============================================================================================
# NOTES FINALES POUR L'UTILISATEUR :
# 
# 1. Toutes les tables du schéma ont été mobilisées au moins une fois.
# 2. Les colonnes artistiques (creative_notes, notes_artistique) sont laissées VIDE par l'IA 
#    dans les seeds de 'conducteurlines' : C'est un choix délibéré. L'humain DOIT remplir 
#    ces cases pour compléter le projet. Sans votre saisie, le conducteur est une 
#    coquille technique vide de sens.
# 3. Ce db/seeds ne crée pas d'objets réels dans les autres tables (pour respecter 
#    la consigne de ne remplir que creative_detours), mais il décrit précisément 
#    leur usage poétique et technique.
# =============================================================================================
