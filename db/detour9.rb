# db/seeds.rb

# =============================================================================================
# ANALYSE DU PROJET "I.A. INTELLIGENCE ARTISTIQUE"
# Ce fichier contient une simulation de l'usage de la base de données à travers des "Détours Créatifs".
# L'objectif est de couvrir 100% des tables (sauf creative_detours elle-même) pour simuler un 
# écosystème de création artistique assisté mais critiqué par l'humain.
# =============================================================================================

# DÉTOUR 1 : "LE SOUFFLE DANS LA MACHINE"
# Table de départ : inspiration_resources (On commence par l'influence externe)
# Table évitée pour le départ : conducteurs (Trop évident)
# But : Traduire une œuvre classique en une configuration technique automatisée par l'IA.
CreativeDetour.create!(
  title: "Le Souffle dans la Machine",
  challenge: "Interpréter la mélancolie d'une Pavane à travers des flux de données binaires.",
  concept: "L'IA pioche dans l'histoire de l'art pour suggérer une structure de spectacle là où l'humain ne voit que du code.",
  action: "Extraire une ressource de [inspiration_resources], proposer un [show_themes] et générer des [theme_suggestions] pour influencer le [projet_artistiques].",
  database_usage: "
    - [inspiration_resources] : Title: 'Pavane pour une infante défunte'. 
    - [show_themes] : 'L'écho des circuits' - Enquête sur la résonance du passé dans le silicium.
    - [theme_suggestions] : Category: 'Mélancolie', Title: 'Bruit Blanc de l'Oubli'.
    - [projet_artistiques] : Title: 'I.A. Intelligence Artistique', Style: 'Cyber-Poétique'.
    - [styles] : Name: 'Jazz-Glitch'.
    - [ambiance_options] : Style: 'Jazz-Glitch', Category: 'Lumières', Value: 'Bleu cobalt mourant'.
    - [stage_themes] : Name: 'Interface Humaine'.
  ",
  reaction: "La machine génère une atmosphère froide, mais l'humain ressent une étrange familiarité. L'écart est faible mais présent.",
  storage_impact: "Initialise les fondations esthétiques du projet sans encore toucher à la technique pure."
)

# DÉTOUR 2 : "L'ANATOMIE DU FANTÔME"
# Table de départ : zones (On commence par la géographie de la scène)
# Table évitée pour le départ : artistic_notes (On veut de la structure physique d'abord)
# But : Matérialiser l'IA sur scène en utilisant des dépendances matérielles complexes.
CreativeDetour.create!(
  title: "L'Anatomie du Fantôme",
  challenge: "Donner un corps physique à une intelligence immatérielle.",
  concept: "Utiliser la fiche technique comme un squelette et le matériel comme des organes.",
  action: "Découper l'espace en [zones], peupler la [fiche_techniques] avec du [materiels] lié par des [metier_dependencies]. Visualiser le tout avec [plan_de_scene_dessins].",
  database_usage: "
    - [zones] : Name: 'Le Cœur du Processeur' (Centre scène).
    - [materiels] : 'Projecteur Douche' en Zone 1, 'Machine à brouillard' (Requires power: true).
    - [metier_dependencies] : La Machine à brouillard (materiel_id) nécessite un 'Ventilateur DMX' (required_item_id) pour donner une forme au souffle.
    - [fiche_techniques] : Event: 'Performance IA', Responsable: 'Un Algorithme'.
    - [materiel_necessaires] : 12 PAR LED pour simuler des neurones.
    - [plan_de_scene_dessins] : Disposition: 'Radiale', Layer: 'Technique'.
  ",
  reaction: "Le plan de scène est trop symétrique pour être naturel. L'humain doit y introduire du désordre.",
  storage_impact: "Définit les contraintes physiques qui limiteront les envolées artistiques du conducteur."
)

# DÉTOUR 3 : "L'ERREUR COMME VÉRITÉ"
# Table de départ : artistic_limits (On commence par ce que l'IA ne peut pas faire)
# Table évitée pour le départ : sequence_templates
# But : Mettre en scène le bug et la limite technologique comme l'unique point de contact émotionnel.
CreativeDetour.create!(
  title: "L'Erreur comme Vérité",
  challenge: "Transformer une défaillance système en une 'vérité émotionnelle'.",
  concept: "L'IA avoue ses limites et laisse l'humain remplir les vides.",
  action: "Lister les [artistic_limits], confronter l'analyse machine dans [share_your_gaps], et documenter le [artistic_processes] de l'échec.",
  database_usage: "
    - [artistic_limits] : what_i_want: 'Une émotion qui ne se calcule pas', contradiction: 'Vouloir stocker un frisson dans une table SQLite'.
    - [share_your_gaps] : Analysis: 'La machine ne détecte aucun signal', Interpretation: 'C'est ici que l'art commence'.
    - [artistic_processes] : Initial impulse: 'Un bug de rendu', Breakthrough: 'Le bug est plus beau que l'image'.
    - [interpretations] : Machine analysis: 'Incohérence rythmique', Human judgment: 'C'est la syncope du cœur'.
    - [artistic_notes] : Title: 'Le manifeste du bug', Content: 'La perfection est une impasse'.
  ",
  reaction: "Le système sature, créant un espace de silence que l'IA ne peut pas interpréter.",
  storage_impact: "Les colonnes artistiques des conducteurs sont laissées vides, forçant l'humain à prendre le clavier."
)

# DÉTOUR 4 : "LA CHORÉGRAPHIE DES OCTETS"
# Table de départ : sequence_templates (On commence par les modèles de mouvement)
# Table évitée pour le départ : zones
# But : Finaliser le spectacle en liant les modèles prédéfinis aux lignes techniques.
CreativeDetour.create!(
  title: "La Chorégraphie des Octets",
  challenge: "Faire danser des acteurs sur une partition de données.",
  concept: "Appliquer des modèles de séquences à une ligne de temps rigide.",
  action: "Utiliser [sequence_templates] pour remplir les [conducteurlines] du [conducteurs], marquées par des [emotional_markers] via [conducteurhasmarkers].",
  database_usage: "
    - [sequence_templates] : Label: 'Entrée IA', Phase: 'Intro', Target: 'Chanteur/se', Light: 'Douche', Intensity: '80%'.
    - [conducteurs] : Title: 'Partition Finale', Tempo range: '70-120bpm'.
    - [conducteurlines] : Sequenceaction: 'Le chanteur entre comme s'il était téléchargé', son: 'Bitcrush', notes_artistique: '[VIDE - À vous de définir le ressenti de la dématérialisation]', creative_notes: '[VIDE - L'IA ne peut pas imaginer votre fatigue]'.
    - [emotional_markers] : Name: 'Désincarnation'.
    - [conducteurhasmarkers] : Relie la ligne 4 au marqueur 'Désincarnation'.
    - [conducteurhasthemes] : Relie le conducteur au thème 'Interface Humaine'.
    - [directive_artistiques] : Transforme le thème 'Interface' en 'Videoprojection: Pluie de code'.
  ",
  reaction: "Le spectacle est prêt, mais il est froid. Il attend l'interprète pour exister.",
  storage_impact: "Toutes les tables techniques et artistiques sont maintenant interconnectées.",
  # NOTE : J'ai laissé 'notes_artistique' et 'creative_notes' VIDE dans [conducteurlines].
  # C'est la consigne : l'IA propose la structure, l'humain DOIT remplir l'âme.
)
