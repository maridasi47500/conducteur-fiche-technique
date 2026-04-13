# db/seeds.rb

# =============================================================================================
# ANALYSE ET STRATÉGIE DE GÉNÉRATION DES DÉTOURS CRÉATIFS
# Projet : I.A. Intelligence Artistique
#
# OBJECTIF : Couvrir 100% des tables (sauf creative_detours) via des scénarios poétiques.
# CHAQUE DÉTOUR commence par une table différente pour explorer une facette du thème :
# "La place de l'humain face à la machine".
# =============================================================================================

# --- DÉTOUR 1 : "LE SOUFFLE DANS LA MÉMOIRE VIVE" ---
# Table de départ : inspiration_resources (On commence par l'influence culturelle externe)
# Table ignorée pour le départ : conducteurs (Trop central)
# BUT : Utiliser l'histoire de l'art pour infecter la logique binaire.
CreativeDetour.create!(
  title: "Le Souffle dans la Mémoire Vive",
  concept: "Transformer une archive de l'histoire de la musique en une configuration technique automatisée par l'IA.",
  action: "1. Puiser dans [inspiration_resources] (Pavane pour une infante défunte). 
           2. Générer des [theme_suggestions] sur la mélancolie. 
           3. Créer un [projet_artistiques] lié à une [fiche_techniques] et un [conducteurs].",
  database_usage: "
    - [inspiration_resources] : Title: 'Pavane pour une infante défunte', Category: 'Music History'.
    - [theme_suggestions] : Category: 'Emotional', Title: 'La nostalgie des circuits'.
    - [projet_artistiques] : Title: 'I.A. Intelligence Artistique', Status: 'En germination'.
    - [fiche_techniques] : Name: 'Scénographie du Vide', Date: '2026-04-13'.
    - [conducteurs] : Title: 'Partition Numérique #1', Tempo range: 'Lent - 60 BPM'.
    - [show_themes] : Philosophical inquiry: 'L'IA peut-elle pleurer ce qu'elle n'a pas vécu ?'.
  ",
  reaction: "La machine génère une atmosphère froide, mais l'humain y injecte une intention de 'ralentissement organique' dans le tempo.",
  storage_impact: "Initialise les métadonnées poétiques du projet avant la mise en œuvre technique.",
  challenge: "Faire comprendre à l'IA que le silence n'est pas une absence de données, mais une présence émotionnelle."
)

# --- DÉTOUR 2 : "L'ANATOMIE DU FANTÔME" ---
# Table de départ : zones (On commence par l'architecture physique de l'espace)
# Table ignorée pour le départ : inspiration_resources (Déjà utilisée)
# BUT : Matérialiser la présence de l'IA sur scène via le matériel et l'espace.
CreativeDetour.create!(
  title: "L'Anatomie du Fantôme",
  concept: "Définir le corps de l'IA à travers la disposition géométrique des machines sur le plateau.",
  action: "1. Segmenter l'espace en [zones]. 
           2. Disposer le [materiels] avec des [metier_dependencies] complexes. 
           3. Dessiner le [plan_de_scene_dessins] et lister le [materiel_necessaires].",
  database_usage: "
    - [zones] : Name: 'Zone de l'Inconscient', y_min: 0, y_max: 50.
    - [materiels] : Name: 'Scanner Laser 5W', Zone_id: 1, Category: 'Projection & Video'.
    - [metier_dependencies] : Le Laser nécessite un 'Miroir brisé' pour disperser la logique binaire.
    - [plan_de_scene_dessins] : Disposition: 'Radiale autour du néant', coord_x: 50, coord_y: 50.
    - [materiel_necessaires] : 12 PAR LED pour simuler un battement cardiaque électrique.
    - [styles] : Name: 'Minimalisme Digital'.
    - [ambiance_options] : Style: 'Minimalisme Digital', Category: 'Lumières', Value: 'Blanc chirurgical'.
  ",
  reaction: "Le plateau devient une prison de lumière où chaque mouvement de l'interprète déclenche une réaction du système.",
  storage_impact: "Établit les contraintes physiques du spectacle (Fiche Technique finale).",
  challenge: "Utiliser la 'Zone de l'Inconscient' pour forcer l'IA à projeter des images hors de sa zone de confort algorithmique."
)

# --- DÉTOUR 3 : "LE DIALOGUE DES CASSURES" ---
# Table de départ : artistic_limits (On commence par ce que l'IA ne peut pas coder)
# Table ignorée pour le départ : zones (Déjà utilisée)
# BUT : Mettre en scène l'échec technique comme une vérité artistique.
CreativeDetour.create!(
  title: "Le Dialogue des Cassures",
  concept: "Un face-à-face entre l'analyse binaire et le jugement humain sur le 'gap' émotionnel.",
  action: "1. Documenter les [artistic_limits] et le [artistic_processes]. 
           2. Créer des [conducteurlines] marquées par des [emotional_markers]. 
           3. Confronter les visions dans [share_your_gaps] et [interpretations].",
  database_usage: "
    - [artistic_limits] : Emotional truth: 'La beauté réside dans le bug'. Contradiction: 'Vouloir fixer l'éphémère dans SQLite'.
    - [artistic_processes] : Initial impulse: 'Un cri de pixel', Breakthrough: 'Le bug devient la mélodie'.
    - [conducteurlines] : sequenceaction: 'L'acteur se fige face au crash système', son: 'Bruit blanc 100dB'.
    - [emotional_markers] : Name: 'Désespoir Algorithmique'.
    - [conducteurhasmarkers] : Liaison entre la ligne de temps et le marqueur émotionnel.
    - [share_your_gaps] : Analysis: 'Perte de signal', Response: 'C'est ici que je me sens enfin vivant'.
    - [interpretations] : The gap: 'L'IA voit une erreur, l'humain voit une naissance'.
    - [artistic_notes] : Content: 'Note sur l'imperfection du geste'.
  ",
  reaction: "Le système s'arrête de calculer, laissant place à une improvisation pure de l'acteur.",
  storage_impact: "Remplit les colonnes artistiques du conducteur avec des données non-structurées et poétiques.",
  challenge: "Accepter que la 'VÉRITÉ ARTISTIQUE' dans la table Interpretation ne soit pas confirmée par l'algorithme."
)

# --- DÉTOUR 4 : "LA CHORÉGRAPHIE DES DIRECTIVES" ---
# Table de départ : sequence_templates (On commence par les modèles de mouvement automatisés)
# Table ignorée pour le départ : artistic_limits (Déjà utilisée)
# BUT : Automatiser la mise en scène tout en interrogeant la perte de contrôle de l'artiste.
CreativeDetour.create!(
  title: "La Chorégraphie des Directives",
  concept: "Laisser l'application devenir le metteur en scène souverain via des automates.",
  action: "1. Appliquer des [sequence_templates] (Intro/Body/Outro). 
           2. Déclencher des [directive_artistiques] basées sur des [stage_themes]. 
           3. Lier le tout au [conducteurhasthemes].",
  database_usage: "
    - [sequence_templates] : Label: 'Entrée IA', Phase: 'intro', Target talent: 'Danseur/se', light: 'Rasant', intensity: '50%'.
    - [directive_artistiques] : Name: 'Ombres Décalées', default_videoprojection: 'Flux de code source'.
    - [stage_themes] : Name: 'L'Effacement de l'Individu'.
    - [conducteurhasthemes] : Connecte le conducteur à la thématique de l'effacement.
    - [conducteurlines] : notes_artistique: '[VIDE - À REMPLIR PAR L'UTILISATEUR : Comment vous sentez-vous d'être dirigé par un template ?]'.
  ",
  reaction: "Le spectacle tourne en boucle parfaite, sans fatigue, sans émotion, jusqu'à ce que l'humain coupe le courant.",
  storage_impact: "Usage final de toutes les tables pour un conducteur et une fiche technique liés.",
  challenge: "Interroger le 'target_talent' : est-ce l'humain ou l'algorithme qui exécute la phase 'outro' ?"
)

# =============================================================================================
# NOTES POUR L'UTILISATEUR (CONSIGNES REMPLISSAGE) :
# - J'ai laissé les colonnes [notes_artistique] et [creative_notes] dans [conducteurlines] VIDES
#   dans le dernier détour. 
# - POURQUOI ? Pour souligner le DÉFI : l'IA peut suggérer la technique, mais l'intelligence 
#   artistique humaine DOIT remplir ces espaces pour donner du sens à la performance. 
#   VOUS devez y inscrire vos ressentis face à la machine.
# =============================================================================================
