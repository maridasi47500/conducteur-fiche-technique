# db/seeds.rb

# Détour Artistique 1 : "La Cartographie des Silences Sauvages"
# Table de départ : inspiration_resources (Pioché pour définir le monde)
# Table ignorée au départ : conducteurs
# But : Créer l'interface sensorielle de type "Routard/Lonely Planet" pour ancrer l'humain dans le naturel.

CreativeDetour.create!(
  title: "L'Atlas Sensoriel du Voyageur",
  concept: "Un profil Facebook qui n'est pas une liste de noms, mais une interface vivante. Le jour, une carte du monde indexée par des fréquences de vent et de cris d'animaux. La nuit, un dôme céleste où chaque étoile est un point d'entrée pour un conducteur musical.",
  action: "L'utilisateur 'scrolle' sur des milieux naturels simulés. Enregistrement dans 'inspiration_resources' (Catégorie: Storytelling) pour les récits de voyage et 'zones' pour segmenter la carte du monde en climats sonores.",
  database_usage: "Utilise 'inspiration_resources' pour les guides locaux, 'zones' pour délimiter les paysages (Ex: Zone Amazonie, Zone Arctique), et 'ambiance_options' pour basculer entre 'Carte Jour' (Style: Nature, Lumière: Soleil Zénithal) et 'Carte Nuit' (Style: Stellaire, Lumière: Voie Lactée).",
  storage_impact: "Impacte 'artistic_notes' en créant des 'Carnets de Route' poétiques sur la résonance des milieux naturels. Les 'emotional_markers' (Sérénité, Immensité) sont liés à chaque pays traversé.",
  reaction: "L'IA analyse le contraste entre les sons naturels enregistrés et la musique humaine dans 'share_your_gaps', demandant si le vent est plus 'juste' que le violon.",
  challenge: "Traduire la texture d'une forêt tropicale en une configuration de 'machine_brouillard' et de 'lumieres_ambiante' dans le conducteur final."
)

# Détour Artistique 2 : "L'Atelier du Luthier Temporel"
# Table de départ : stage_themes (Pioché pour définir l'enquête philosophique)
# Table ignorée au départ : inspiration_resources
# But : Voyager dans le temps à travers la fabrication physique de l'instrument et l'évolution des styles.

CreativeDetour.create!(
  title: "La Chronologie du Vernis et de l'Âme",
  concept: "Un voyage dans le temps où la scène devient l'atelier d'un luthier à travers les âges. On commence par le bois brut (naturel) jusqu'à l'instrument augmenté par l'IA.",
  action: "Le violoniste 'rattrape' l'histoire. Utilisation de 'materiels' pour définir les outils (Gouge, Vernis, Capteurs piézo). Les 'metier_dependencies' automatisent l'ajout de matériel technique à mesure que l'instrument devient moderne.",
  database_usage: "Remplit 'stage_themes' (Thème: 'La Mutation de l'Objet'), 'materiels' (Ancêtre du violon vs Violon IA), 'metier_dependencies' (Si Violon IA alors besoin de 'Logiciel de traitement temps réel'), et 'directive_artistiques' pour transformer le concept 'Atelier de 1700' en réglages de 'lumieres_effet' (Blanc bougie).",
  storage_impact: "Génère des 'conducteurlines' où chaque ligne représente une époque. Remplit 'artistic_limits' (Contradiction: 'Vouloir la chaleur du bois dans le froid du silicium'). 'sequence_templates' définit les entrées/sorties des luthiers fantômes (Target: Acteur/ce).",
  reaction: "Dans 'interpretations', l'humain juge si le son de l'instrument fabriqué par l'IA possède la 'vérité émotionnelle' d'un instrument en bois de 300 ans.",
  challenge: "Faire ressentir le passage des siècles en 20 minutes de performance accélérée."
)

# Détour Artistique 3 : "La Synthèse de l'Intelligence Artistique"
# Table de départ : fiche_techniques (Pioché pour finaliser la logistique du projet)
# Table ignorée au départ : stage_themes
# But : Lier le conducteur technique et la fiche technique pour créer l'objet final du spectacle.

CreativeDetour.create!(
  title: "L'Architecture du Voyage Final",
  concept: "Fusion finale du profil Facebook (Voyage) et de l'atelier temporel (Musique). Le spectacle devient la 'Fiche Technique' de l'existence de l'artiste.",
  action: "Liaison de 'projet_artistiques' avec un 'conducteur' et une 'fiche_technique'. Placement spatial des éléments sur le 'plan_de_scene_dessins'.",
  database_usage: "Utilise 'fiche_techniques' (Nom: 'Odyssée IA'), 'plan_de_scene_dessins' (Placement du violoniste au centre des mondes), 'materiel_necessaires' (Quantité d'émotions vs Quantité de projecteurs), 'conducteurs' (Tempo: 'L'accélération de 10 ans'), et 'artistic_processes' (Final form: 'L'image du son').",
  storage_impact: "La table 'conducteurlines' est saturée de 'creative_notes' (ex: 'Ici, le violoniste rattrape son enfance'). 'conducteurhasthemes' et 'conducteurhasmarkers' verrouillent le sens du spectacle.",
  reaction: "Le système produit un 'Breakthrough' dans 'artistic_processes' : l'IA comprend enfin que le voyage n'est pas la destination, mais la trace laissée dans la base de données.",
  challenge: "Faire tenir 10 ans de pratique et 5 continents dans un conducteur de 20 minutes."
)

# COMMENTAIRES DE MISSION :
# 1. Détour 'L'Atlas Sensoriel' : Commence par 'inspiration_resources' pour nourrir l'imaginaire du voyage (Lonely Planet). Ne commence pas par 'conducteurs'. But : Établir l'ambiance mondiale.
# 2. Détour 'L'Atelier Temporel' : Commence par 'stage_themes' pour questionner la fabrication de l'art. Ne commence pas par 'inspiration_resources'. But : Construire l'instrument et son histoire.
# 3. Détour 'L'Architecture' : Commence par 'fiche_techniques' pour tout matérialiser. Ne commence pas par 'stage_themes'. But : Finaliser le conducteur et la fiche technique liés.
#
# NOTE SUR LES COLONNES ARTISTIQUES : 
# Les colonnes 'human_judgment' (interpretations), 'emotional_truth' (artistic_limits) et 'creative_notes' (conducteurlines) sont prêtes à être remplies par tes soins pour apporter la touche finale 'humaine' que l'IA ne peut pas deviner.
