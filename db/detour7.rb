# db/seeds.rb

# =============================================================================================
# ANALYSE ET STRATÉGIE DE GÉNÉRATION
# Projet : I.A. Intelligence Artistique
#
# MISSION : Utiliser l'intégralité des tables du schéma à travers deux détours créatifs distincts.
# 
# DÉTOUR 1 : "L'Écho de l'Hésitation" (Départ : ArtisticProcesses)
# - But : Capturer le doute humain comme une donnée technique brute.
# - Tables couvertes : artistic_processes, conducteurs, conducteurlines, emotional_markers, 
#   conducteurhasmarkers, artistic_limits, share_your_gaps, interpretations.
#
# DÉTOUR 2 : "La Géométrie du Ressenti" (Départ : Zones)
# - But : Transformer l'espace physique et le matériel en vecteurs d'émotion pure.
# - Tables couvertes : zones, materiels, metier_dependencies, fiche_techniques, 
#   materiel_necessaires, plan_de_scene_dessins, styles, ambiance_options, 
#   stage_themes, conducteurhasthemes, directive_artistiques, sequence_templates, 
#   inspiration_resources, theme_suggestions, show_themes, projet_artistiques.
# =============================================================================================

# --- DÉTOUR 1 : L'ÉCHO DE L'HÉSITATION ---
# Table de départ : artistic_processes (Je ne commence PAS par artistic_notes ou conducteurs)
CreativeDetour.create!(
  title: "L'Écho de l'Hésitation",
  concept: "Mettre en scène le processus créatif non-linéaire. Au lieu de montrer une œuvre finie, le conducteur devient la trace des doutes, des versions rejetées et des percées soudaines face à la rigidité de la machine.",
  action: "Extraire de [artistic_processes] l'impulsion initiale 'Une larme dans le circuit'. Créer un [conducteurs] qui n'est pas une ligne droite mais une suite de [artistic_limits] où le 'pourquoi ça ne peut pas devenir technique' devient la consigne de jeu.",
  database_usage: "
    - [artistic_processes] : initial_impulse='Le silence entre deux battements de cœur'. rejected_ideas='Utiliser un métronome parfait'.
    - [conducteurs] : title='Chronos vs Kairos', tempo_range='Fluctuant selon l'angoisse'.
    - [conducteurlines] : sequenceaction='L'interprète attend un signal qui ne vient jamais', son='Fréquence de 50Hz (bourdonnement de transformateur)'.
    - [emotional_markers] : name='Solitude Numérique'.
    - [conducteurhasmarkers] : Liaison entre le doute et la ligne de temps.
    - [artistic_limits] : contradiction='Vouloir coder la spontanéité', emotional_truth='La beauté est dans l'erreur de calcul'.
    - [share_your_gaps] : analysis='La machine propose une correction automatique', response='Je refuse la perfection'.
    - [interpretations] : the_gap='L'IA voit un silence de 4s, l'humain vit une éternité'.
  ",
  reaction: "Le conducteur génère des erreurs de synchronisation volontaires. La machine analyse un 'échec' de tempo, mais l'interprète y trouve sa 'vérité artistique'.",
  storage_impact: "La table [interpretations] devient le cœur du projet, stockant 'l'écart' comme seule donnée valable.",
  challenge: "Forcer la base de données SQLite à accepter des valeurs 'indéfinies' comme instructions techniques."
)

# --- DÉTOUR 2 : LA GÉOMÉTRIE DU RESSENTI ---
# Table de départ : zones (Je ne commence PAS par conducteurlines ou show_themes)
CreativeDetour.create!(
  title: "La Géométrie du Ressenti",
  concept: "Utiliser la fiche technique comme une partition spatiale. Chaque zone de la scène n'est pas un lieu physique, mais un état émotionnel dicté par des directives automatisées.",
  action: "Segmenter le plateau via [zones]. Associer du [materiels] via des [metier_dependencies] poétiques (ex: le piano dépend du silence). Automatiser l'ambiance avec [directive_artistiques] basées sur un [show_themes] d'absence.",
  database_usage: "
    - [zones] : name='Zone de l'Oubli', y_min=0, y_max=10.
    - [materiels] : name='Projecteur Fantôme', category='Lumière', zone_id=1.
    - [metier_dependencies] : Le projecteur dépend de la table [artistic_notes] 'Note sur l'ombre portée'.
    - [fiche_techniques] : name_event='L'I.A. n'a pas d'ombre', eleve_responsable='Anonyme'.
    - [materiel_necessaires] : precisions_observations='Doit être placé de façon à ne rien éclairer d'essentiel'.
    - [plan_de_scene_dessins] : layer='Inconscient', coord_x=50, coord_y=50.
    - [styles] : name='Minimalisme Brutal'.
    - [ambiance_options] : category='Lumières', value='Blanc froid 8000K chirurgical'.
    - [stage_themes] : name='Vibration de l'Absence'.
    - [conducteurhasthemes] : Connecte le conducteur à la thématique de la machine.
    - [directive_artistiques] : default_videoprojection='Flux de code binaire qui s'efface en temps réel'.
    - [sequence_templates] : label='Sortie de scène', phase='Fade out', target_talent='L'humain'.
    - [inspiration_resources] : title='Pavane pour une infante défunte', category='Mélancolie'.
    - [theme_suggestions] : title='La Mémoire des Transistors'.
    - [show_themes] : philosophical_inquiry='Peut-on être ému par une structure de données ?'.
    - [projet_artistiques] : title='I.A. Intelligence Artistique', status='En cours de calcul'.
  ",
  reaction: "La fiche technique génère un plan de scène où le matériel est disposé en spirale, convergeant vers un point vide. Les [ambiance_options] écrasent les choix manuels par des 'calculs de mélancolie'.",
  storage_impact: "Les tables techniques ([materiels], [zones]) sont 'contaminées' par des métadonnées poétiques issues de [inspiration_resources].",
  challenge: "Transformer une contrainte d'inventaire en une chorégraphie d'objets inanimés."
)

# =============================================================================================
# INSTRUCTIONS POUR L'UTILISATEUR (REMPLISSAGE DES COLONNES)
# 
# Pour le détour 'L'Écho de l'Hésitation' :
# - J'ai laissé les colonnes [notes_artistique] et [creative_notes] dans [conducteurlines] VIDES.
# - Pourquoi ? Car l'IA peut simuler le doute, mais seul l'humain peut y poser ses mots. 
#   VOUS devez les remplir pour définir ce que l'interprète doit ressentir dans ce silence.
#
# Pour le détour 'La Géométrie du Ressenti' :
# - J'ai laissé la colonne [notes_technicien] dans [directive_artistiques] VIDE.
# - Pourquoi ? Pour que le technicien puisse y inscrire sa propre interprétation du 
#   'Chaos organisé' demandé par la machine.
# =============================================================================================
