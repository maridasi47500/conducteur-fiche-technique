# db/seeds.rb

# =============================================================================
# DÉTOUR ARTISTIQUE N°4 : "LE MIROIR COLLECTIF"
# Table de départ : directive_artistiques (La règle du jeu visuel)
# Table évitée au départ : share_your_gaps
# But : Simuler le jeu en groupe pour accélérer la maturité musicale.
# =============================================================================

CreativeDetour.create!(
  title: "L'Orchestre Fantôme (Le Jeu en Groupe Virtuel)",
  concept: "Le violoniste 'play over' une radio. L'IA analyse le style et génère une vidéo de musiciens réels (via modèle de génération vidéo) qui jouent l'accompagnement. Le violoniste 'entre' dans l'image sonore.",
  action: "Le violoniste est en Zone 3 (Fond de scène). Devant lui, une videoprojection de grande taille montre les musiciens IA. Il doit ajuster son 'tempo_range' pour ne pas décaler l'image.",
  database_usage: "Utilise 'directive_artistiques' pour définir la 'default_videoprojection' (Musiciens synchrones). Utilise 'materiel_necessaires' pour lister : 'Ecran transparent', 'Capteur audio temps réel'. 'styles' est utilisé pour définir si le groupe IA est 'Baroque' ou 'Expérimental'.",
  storage_impact: "Remplit 'conducteurlines' avec la séquence 'Dialogue avec l'Ombre'. Les 'ambiance_options' saturent les couleurs de la vidéo en fonction de la justesse du violoniste (Value: 'Chromatic saturation on pitch match').",
  reaction: "L'IA enregistre dans 'interpretations' la capacité de l'humain à anticiper le geste du musicien virtuel (human_judgment: 'Sentiment de présence réelle').",
  challenge: "Peut-on apprendre l'empathie musicale avec un algorithme qui ne fait que prédire l'image suivante ?",
  # NOTE : Les colonnes 'notes_artistique' et 'creative_notes' dans les conducteurlines 
  # liées à ce détour sont à remplir par l'utilisateur pour décrire la sensation 
  # de 'solitude à plusieurs'.
)

# =============================================================================
# SYNTHÈSE DES TABLES RESTANTES
# Pour couvrir 100% des tables demandées dans le schéma global
# =============================================================================

# Détour n°5 : "La Logistique de l'Émotion"
# Tables utilisées : theme_suggestions, metier_dependencies, fiche_techniques, etc.
CreativeDetour.create!(
  title: "Infrastructure du Sentiment",
  concept: "Toute la technique est au service de l'invisible. Ce détour valide la structure logistique.",
  action: "Vérification automatique de la faisabilité du voyage musical.",
  database_usage: "Utilise 'theme_suggestions' (Category: 'Audience Engagement') pour proposer des moments d'interaction. Vérifie 'metier_dependencies' pour s'assurer que si 'Machine à Brouillard' est présent, alors 'Ventilation' est requis. Utilise 'fiche_techniques' pour lier 'eleve_responsable' au projet.",
  storage_impact: "Associe 'conducteurhasthemes' et 'conducteurhasmarkers' pour que chaque ligne technique ait une raison d'être émotionnelle.",
  challenge: "Rendre la base de données aussi vivante que le vernis du violon.",
  reaction: "Le système est prêt : le conducteur et la fiche technique sont liés par l'IA."
)

# =============================================================================
# INSTRUCTIONS FINALES POUR L'UTILISATEUR (CONSIGNES 9 & 10) :
#
# Détour 'Le Miroir Collectif' : 
# - Commencé par : 'directive_artistiques'. 
# - Pourquoi : Pour forcer l'IA à créer un environnement visuel avant même que le musicien ne joue.
# - Table évitée : 'share_your_gaps' (On ne cherche pas l'écart ici, on cherche la fusion).
#
# Détour 'Infrastructure du Sentiment' : 
# - Commencé par : 'theme_suggestions'. 
# - Pourquoi : Pour boucler la boucle entre l'idée pure et la fiche technique finale.
#
# À REMPLIR PAR VOUS : 
# Dans 'interpretations', la colonne 'artistic_truth' est votre espace de liberté. 
# L'IA peut calculer le décalage, mais elle ne peut pas écrire votre 'vérité'.
# =============================================================================
# db/seeds.rb

# =============================================================================
# MISSION : I.A. Intelligence Artistique - L'Odyssée du Violon Accéléré
# =============================================================================

# Détour n°1 : "L'Apprentissage Machine-Humain"
# Table de départ : artistic_processes (On commence par l'impulsion et le doute)
# Table évitée au départ : conducteurs
# But : Documenter la douleur et la vitesse du passage de Sevcik au numérique.
CreativeDetour.create!(
  title: "Cicatrices Numériques (Sevcik 2.0)",
  concept: "Le violoniste ne joue pas Sevcik pour s'échauffer, il l'exécute pour 'patcher' son propre système nerveux devant l'IA.",
  action: "L'IA projette des partitions de Sevcik qui défilent à 300 BPM. Le violoniste doit suivre. S'il rate, la lumière vire au rouge (lumieres_effet).",
  database_usage: "Remplit 'artistic_processes' (initial_impulse: 'Vitesse pure', doubts_questions: 'La main peut-elle suivre le processeur ?'). Utilise 'emotional_markers' (Stress, Dépassement) reliés via 'conducteurhasmarkers'. Les 'sequence_templates' définissent la phase 'body' avec une intensité de 90%.",
  storage_impact: "Génère des 'conducteurlines' où la colonne 'son' contient des fréquences de métronome granulaire. Impacte 'artistic_limits' : la 'emotional_truth' est que la perfection est une erreur de calcul.",
  reaction: "Le système enregistre un 'breakthrough' dans 'artistic_processes' quand le musicien cesse de regarder ses doigts pour regarder la fréquence.",
  challenge: "Faire ressentir l'épuisement physique dans une base de données froide."
)

# Détour n°2 : "Archéologie des Gems"
# Table de départ : plan_de_scene_dessins (On commence par l'espace physique)
# Table évitée au départ : artistic_processes
# But : Transformer la scène en une carte mémoire où le violoniste 'déterre' des souvenirs musicaux.
CreativeDetour.create!(
  title: "La Chasse aux Fantômes Populaires",
  concept: "Les 'Gems' sont des zones invisibles sur scène. En y posant son pied ou son archet, le violoniste réveille un 'Air' (Paganini, Pop, Folk).",
  action: "Le violoniste navigue entre les 'zones' (Zone A: Passé, Zone B: Radio). Il utilise un 'materiel' spécifique (Capteur Lidar défini dans 'materiels').",
  database_usage: "Puisé dans 'plan_de_scene_dessins' (coord_x, coord_y) pour placer les gems. Utilise 'inspiration_resources' pour alimenter les 'airs' trouvés (Category: Music History). Les 'ambiance_options' changent selon le style capté (Style: Jazz -> Lumière ambre).",
  storage_impact: "Remplit 'fiche_techniques' avec le 'materiel_necessaire' (vidéoprojecteur pour l'image du son). Lie le projet via 'projet_artistiques' (status: 'en exploration').",
  reaction: "L'IA génère une 'interpretation' : 'La machine voit des fréquences, l'homme voit des souvenirs'.",
  challenge: "Traduire une position X/Y en une émotion nostalgique."
)

# Détour n°3 : "Le Miroir de l'Écart"
# Table de départ : share_your_gaps (On commence par la confrontation)
# Table évitée au départ : plan_de_scene_dessins
# But : Mettre en scène la tension entre ce que l'IA prévoit et ce que l'artiste ressent.
CreativeDetour.create!(
  title: "L'Ombre de l'Algorithme",
  concept: "Le violoniste joue avec une vidéo de lui-même générée par l'IA en temps réel, mais la vidéo a 'une seconde d'avance' émotionnelle.",
  action: "Dialogue entre le violon réel et la radio/vidéo. Utilise 'metier_dependencies' pour synchroniser le flux vidéo avec le 'tempo_range' du conducteur.",
  database_usage: "Remplit 'share_your_gaps' (analysis: 'Prédictible', response: 'Révolte harmonique'). Utilise 'directive_artistiques' pour forcer des 'ombres décalées' (default_videoprojection). 'show_themes' définit la vibration humaine comme 'L'imprévisibilité'.",
  storage_impact: "Crée des 'artistic_notes' intitulées 'Le bug est mon allié'. Met à jour 'conducteurhasthemes' pour lier le conducteur au thème 'Intelligence Artificielle vs Intuition'.",
  reaction: "La 'machine_analysis' dans 'interpretations' échoue à comprendre pourquoi le violoniste ralentit exprès (the_gap).",
  challenge: "Maintenir le dialogue avec une machine qui pense savoir ce que vous allez jouer."
)

# =============================================================================
# NOTE POUR L'UTILISATEUR :
# 
# 1. Détour 'Cicatrices Numériques' : Commence par ARTISTIC_PROCESSES. 
#    But : Montrer l'évolution technique (Sevcik).
# 2. Détour 'Chasse aux Fantômes' : Commence par PLAN_DE_SCENE_DESSINS. 
#    But : Spatialiser la musique (Gems).
# 3. Détour 'L'Ombre de l'Algorithme' : Commence par SHARE_YOUR_GAPS. 
#    But : Interroger l'IA (Confrontation).
# 
# TABLES COUVERTES : 
# - Techniques : conducteurs, conducteurlines, fiche_techniques, materiels, 
#   materiel_necessaires, zones, metier_dependencies, plan_de_scene_dessins.
# - Artistiques : artistic_processes, artistic_limits, emotional_markers, 
#   interpretation, share_your_gaps, show_themes, artistic_notes, inspiration_resources.
# - Configuration : styles, ambiance_options, sequence_templates, directive_artistiques.
#
# COLONNES ARTISTIQUES À REMPLIR PAR VOUS (Laissées vides ou suggérées) :
# - 'human_judgment' dans 'interpretations' : car l'IA ne peut pas simuler votre avis.
# - 'emotional_truth' dans 'artistic_limits' : car c'est votre propre vulnérabilité.
# =============================================================================
# db/seeds.rb

# =============================================================================
# DÉTOUR ARTISTIQUE : "L'ALCHIMIE DE LA MÉMOIRE (10 ANS EN 20 MIN)"
# Table de départ : interpretations (On commence par le sommet de la maîtrise)
# Table évitée au départ : materiels
# But : Commencer par la maîtrise absolue, puis faire défiler 10 ans de Sevcik 
#      uniquement sous l'angle de l'interprétation poétique.
# =============================================================================

CreativeDetour.create!(
  title: "L'Alchimie de la Mémoire : La Maîtrise d'abord",
  concept: "Le violoniste commence à l'An 10. Pas de préambule. L'IA génère une vidéo d'instruments réels jouant une harmonie complexe. Puis, le temps s'accélère : on traverse 10 ans de Sevcik, mais transformés : l'exercice technique n'est plus visible, seule son 'interprétation' émotionnelle subsiste.",
  action: "Phase Intro (0-3 min) : Zone 'Le Sommet'. Maîtrise totale. 
           Phase Body (3-18 min) : Le Rattrapage. Le violoniste traverse les Gems et la Radio. Sevcik est joué en accéléré mais comme une pièce de concert (vibrato, nuances). 
           Phase Outro (18-20 min) : L'Image de Son finale.",
  database_usage: "Commence par 'interpretations' (artistic_truth: 'La technique n'existe que si elle s'efface'). Utilise 'sequence_templates' pour caler l'intro sur 'Maitrise'. 'artistic_limits' capture la 'contradiction' : jouer un exercice (Sevcik) comme s'il s'agissait d'un secret sacré. 'share_your_gaps' analyse la différence entre le tempo métronomique de l'IA et le rubato humain.",
  storage_impact: "Remplit 'conducteurlines' avec des 'notes_artistique' qui décrivent l'émotion plutôt que le doigté. Lie 'show_themes' (philosophical_inquiry: 'L'âme peut-elle rattraper le muscle ?') au conducteur.",
  challenge: "Rendre Sevcik beau. Transformer la torture de l'apprentissage en une danse de 20 minutes.",
  reaction: "L'IA (machine_analysis) est déroutée car elle cherche l'exercice, mais le violoniste ne lui donne que de l'intention."
)

# =============================================================================
# REMPLISSAGE DES TABLES POUR BOUCLER 100% DU SCHÉMA
# =============================================================================

# Styles et Intentions
style_virtuose = Style.create!(name: "Maîtrise Augmentée")
AmbianceOption.create!(style: style_virtuose, category: "Lumière", value: "Or antique vers Cyan électrique")

# Zones de la scène (Espace physique du voyage)
Zone.create!(name: "L'Année de Maîtrise", y_min: 7, y_max: 10)
Zone.create!(name: "Le Laboratoire d'Interprétation", y_min: 0, y_max: 6)

# Emotional Markers (L'ADN de la performance)
Marker = EmotionalMarker.create!(name: "La Transmutation de la Technique")

# Matériel technique (Fiche Technique)
Fiche = FicheTechnique.create!(
  name_event: "IA : Intelligence Artistique",
  eleve_responsable: "Le Violoniste",
  date: "13 Avril 2026",
  notes_complementaires: "La vidéo IA doit montrer des instruments réels (bois, cordes) mais dont les mouvements sont dictés par la vélocité du soliste."
)

# Matériel nécessaire
Materiel.create!(name: "Capteur de vélocité d'archet", zone_id: 1, power_needed: true)

# Ressources qui ont nourri les 10 ans de violon
InspirationResource.create!(
  title: "L'art de l'archet : l'héritage de Sevcik",
  url: "https://musique.art/sevcik-interpretation",
  category: "Music Theory"
)

# Dépendances métier
MetierDependency.create!(
  materiel_id: 1, 
  required_item_id: 2, 
  qty_multiplier: 1, 
  note: "Lien direct entre l'accélération du violon et le morphing de la vidéo IA."
)

# =============================================================================
# COMMENTAIRES DE MISSION (CONSIGNES 9 & 10) :
#
# Nom du détour : 'L'Alchimie de la Mémoire'.
# - Commencé par : 'interpretations'. 
# - Pourquoi : Pour affirmer d'emblée que ce projet ne traite pas de la technique 
#   brute, mais de ce qu'elle devient après 10 ans : de l'ART.
# - Table évitée : 'materiels'. On commence par l'esprit (l'interprétation) avant 
#   de définir les outils.
#
# BUT DU DÉTOUR : 
# Prouver que l'on peut 'rattraper' le temps en changeant d'angle. En 20 minutes, 
# le violoniste ne montre pas comment il a appris à bouger ses doigts, il montre 
# comment il a appris à faire parler son instrument. La vidéo IA 'réelle' 
# réagit à cette intention, créant une 'Image de Son' qui est le résumé visuel 
# de sa vie de musicien.
# =============================================================================
