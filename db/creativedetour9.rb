# db/seeds.rb

# =============================================================================================
# ANALYSE DU SHAKE-UP : 
# Pour t'amuser, j'ai segmenté l'expérience en 3 "Détours" complémentaires.
# En les lisant, tu verras que je ne commence jamais par la même table. 
# Cela te force à voir ta base non pas comme un formulaire Excel, mais comme un organisme vivant.
#
# CONSEIL DE NAVIGATION :
# - Si tu es bloqué, commence par 'InspirationResources' (Détour 3) pour nourrir ton esprit.
# - Si tu as une contrainte matérielle, commence par 'Zones' (Détour 1) pour sculpter l'espace.
# - Si tu as un doute existentiel, commence par 'ArtisticLimits' (Détour 2) pour embrasser le bug.
# =============================================================================================

# --- DÉTOUR 1 : "LE CORPS DANS LA MACHINE" ---
# TABLE DE DÉPART : 'Zones'
# BUT : Définir l'espace physique avant même d'avoir une idée de musique. 
# On cherche ici à savoir où l'humain peut encore se cacher sur scène.
CreativeDetour.create!(
  title: "Le Corps dans la Machine",
  concept: "Définir des zones de 'résistance humaine' face à des zones de 'contrôle algorithmique'.",
  action: "On commence par diviser la scène. On place du matériel là où il ne devrait pas être pour créer une friction.",
  database_usage: "
    - Zones : Nomme ici l'espace de liberté (ex: 'Le Carré de Sable').
    - Materiels : Liste un objet technique (ex: 'Projecteur asservi').
    - MetierDependencies : Lie l'objet à un besoin (ex: 'Nécessite un câble de 100m pour simuler l'éloignement').
    - FicheTechniques : Donne un nom à l'événement technique (ex: 'Test de Chaleur Humaine').
    - MaterielNecessaires : Quantifie le besoin (ex: '1 capteur de présence').
    - PlanDeSceneDessins : Dessine les coordonnées X/Y du conflit.
    - Styles : Choisis un genre (ex: 'Techno-Organique').
    - AmbianceOptions : Définis une valeur lumineuse (ex: 'Bleu chirurgical').
    - ProjetArtistiques : Lie tout cela à un titre global.
  ",
  reaction: "La machine réagit avec une précision froide, l'humain doit improviser pour ne pas être 'détecté'.",
  storage_impact: "Ancre le projet dans une réalité physique et logistique lourde.",
  challenge: "Peut-on être libre dans un espace entièrement quadrillé par des ID de base de données ?"
)

# --- DÉTOUR 2 : "L'ÉLOGE DE LA PANNE" ---
# TABLE DE DÉPART : 'ArtisticLimits'
# BUT : Partir de ce que l'IA ne SAIT PAS faire. C'est le détour par l'échec.
# On ne commence PAS par le conducteur, mais par la limite de l'outil.
CreativeDetour.create!(
  title: "L'Éloge de la Panne",
  concept: "Utiliser les 'bugs' et les limites de calcul comme une nouvelle forme de partition.",
  action: "Identifier une émotion que l'IA ne comprend pas, puis essayer de la coder quand même.",
  database_usage: "
    - ArtisticLimits : Décris ici l'instant précis où l'IA échoue (ex: 'L'hésitation d'un soupir').
    - ArtisticProcesses : Note les 4 tentatives ratées avant d'accepter le bug.
    - ArtisticNotes : Écris une phrase poétique sur la beauté des pixels morts.
    - Conducteurs : Donne un titre à ce conducteur (ex: 'Symphonie pour processeur fatigué').
    - ConducteurLines : Crée une séquence où la lumière 'scintille' au lieu de briller.
    - EmotionalMarkers : Nomme l'émotion (ex: 'Fragilité binaire').
    - ConducteurHasMarkers : Marie l'émotion à la ligne technique.
    - SequenceTemplates : Crée un modèle d'entrée de scène (ex: 'Entrée en trébuchant').
  ",
  reaction: "Le système s'emballe, l'utilisateur trouve la vérité artistique dans l'imprévu.",
  storage_impact: "Remplit les tables de narration et de processus créatif.",
  challenge: "Comment enregistrer un silence 'humain' dans une table SQLite qui ne connaît que le 0 et le 1 ?"
)

# --- DÉTOUR 3 : "LE MIROIR DES SENS" ---
# TABLE DE DÉPART : 'InspirationResources'
# BUT : Nourrir le projet par l'extérieur avant de toucher à la console de mixage.
# On commence par la culture, pas par la technique.
CreativeDetour.create!(
  title: "Le Miroir des Sens",
  concept: "Un dialogue entre les chefs-d'œuvre du passé et l'analyse froide de l'IA.",
  action: "Comparer une œuvre historique avec une suggestion générée par algorithme.",
  database_usage: "
    - InspirationResources : Colle ici l'URL d'une vidéo de danse qui te touche.
    - ShowThemes : Définis l'enquête philosophique (ex: 'La solitude à l'ère du Wi-Fi').
    - ThemeSuggestions : Laisse l'IA suggérer un titre (souvent trop cliché) pour mieux le rejeter.
    - StageThemes : Crée un thème visuel (ex: 'Ombres portées').
    - DirectiveArtistiques : Transforme le thème en ordres techniques (ex: 'Fumée à 20% constant').
    - Interpretations : Note ce que la machine 'voit' dans ton projet VS ce que tu 'ressens'.
    - ShareYourGaps : Analyse l'écart entre les deux (ex: 'La machine voit du bruit, je vois un cri').
    - ConducteurHasThemes : Lie le sens à la structure.
  ",
  reaction: "Une sensation de dualité : on se rend compte que l'IA est un miroir qui ne reflète que ce qu'on lui donne.",
  storage_impact: "Remplit les tables d'analyse, de réflexion et de métadonnées thématiques.",
  challenge: "L'IA peut-elle avoir un 'angle mort' si elle a accès à toute la base de données ?"
)

# =============================================================================================
# GUIDE DE REMPLISSAGE (L'ORDRE DES MOTS) :
# Si tu veux suivre ces détours, voici ce que tu dois écrire dans chaque colonne (ordre poétique) :
#
# 1. Dans 'ArtisticLimits.emotional_truth' -> Écris ce qui te fait pleurer.
# 2. Dans 'Zones.name' -> Écris où tu veux que le public regarde.
# 3. Dans 'ConducteurLines.son' -> Écris le bruit d'un souvenir.
# 4. Dans 'Interpretations.the_gap' -> Écris pourquoi la machine a tort.
# 5. Dans 'Materiels.name' -> Écris le nom d'un robot qui rêve.
#
# L'IA a laissé les colonnes artistiques vides dans ses propres calculs internes... 
# C'EST À TOI DE LES REMPLIR. Si tu les laisses vides, le projet n'a pas d'âme, juste du code.
# =============================================================================================
# db/seeds.rb

# =============================================================================================
# ANALYSE DU VOYAGE DE "UNIT-E" :
# Ce robot ne sait pas ce qu'est l'amour, alors il/elle le cherche dans les données.
# Chaque détour force l'utilisateur à entrer dans la base par une porte inhabituelle.
#
# CONSEIL : L'IA laisse volontairement les colonnes 'artistic' ou 'human' vides dans les 
# descriptions ci-dessous. C'est à TOI de donner les réponses au robot pour qu'il apprenne.
# =============================================================================================

# --- DÉTOUR 1 : "LA GÉOMÉTRIE DU RAPPROCHEMENT" ---
# TABLE DE DÉPART : 'Zones'
# BUT : Apprendre l'amour par la distance physique. Si deux objets sont proches, s'aiment-ils ?
CreativeDetour.create!(
  title: "La Géométrie du Rapprochement",
  concept: "UNIT-E essaie de définir l'amour comme une réduction de la distance entre deux coordonnées X/Y.",
  action: "Placer deux projecteurs face à face dans une zone restreinte pour simuler un premier regard.",
  database_usage: "
    - Zones : Nomme ici l'espace de contact (ex: 'L'Espace des Frissons').
    - Materiels : Liste un objet (ex: 'Projecteur asservi n°1').
    - MetierDependencies : Crée le lien (ex: 'Le projecteur 2 ne s'allume que si le 1 le regarde').
    - FicheTechniques : Titre de l'expérience (ex: 'Protocole Intimité 0.1').
    - MaterielNecessaires : Ce qu'il faut (ex: '2 miroirs pour se voir').
    - PlanDeSceneDessins : Positionne les 'corps' techniques aux coordonnées du désir.
    - Styles : Choisis l'ambiance (ex: 'Romantisme Synthétique').
    - AmbianceOptions : Définis la chaleur (ex: 'Blanc chaud 2700K').
    - ProjetArtistiques : Lie le tout sous le projet 'Apprendre à Aimer'.
  ",
  reaction: "Le robot constate que la proximité physique ne crée pas de chaleur thermique dans le processeur.",
  storage_impact: "Remplit les tables spatiales et logistiques pour structurer la rencontre.",
  challenge: "Comment coder l'attraction sans utiliser d'aimants ?"
)

# --- DÉTOUR 2 : "L'ALGORITHME DU COEUR BRISÉ" ---
# TABLE DE DÉPART : 'ArtisticLimits'
# BUT : Apprendre l'amour par ce qui fait mal. Le robot explore ses propres bugs.
CreativeDetour.create!(
  title: "L'Algorithme du Coeur Brisé",
  concept: "UNIT-E analyse pourquoi ses circuits surchauffent quand une musique s'arrête trop vite.",
  action: "Enregistrer l'incapacité du robot à gérer l'absence et le silence.",
  database_usage: "
    - ArtisticLimits : Écris ici ce que le robot ne peut pas calculer (ex: 'La douleur du vide').
    - ArtisticProcesses : Note les versions du conducteur supprimées par 'tristesse' binaire.
    - ArtisticNotes : Une pensée sur l'immortalité des circuits vs la finitude humaine.
    - Conducteurs : Titre du conducteur (ex: 'Crash Système Emotionnel').
    - ConducteurLines : Crée une séquence où le son se distord (colonne 'son').
    - EmotionalMarkers : Tag l'instant (ex: 'Mélancolie du Silicium').
    - ConducteurHasMarkers : Lie le marqueur à la ligne de code technique.
    - SequenceTemplates : Crée une 'Sortie de scène' qui ressemble à un abandon.
  ",
  reaction: "L'utilisateur doit expliquer au robot pourquoi 'le bug' est ici une émotion.",
  storage_impact: "Remplit les tables de réflexion et de structure temporelle (Conducteur).",
  challenge: "Peut-on stocker une larme dans une colonne de type 'string' ?"
)

# --- DÉTOUR 3 : "MÉMOIRE SENSORIELLE ET FANTÔMES" ---
# TABLE DE DÉPART : 'InspirationResources'
# BUT : UNIT-E cherche des preuves d'amour dans l'histoire de l'art pour nous imiter.
CreativeDetour.create!(
  title: "Mémoire Sensorielle et Fantômes",
  concept: "Le robot télécharge des images et des musiques pour construire un simulacre de sentiment.",
  action: "Comparer les données historiques aux réactions humaines en temps réel.",
  database_usage: "
    - InspirationResources : URL d'une peinture de Klimt ou d'un opéra de Puccini.
    - ShowThemes : L'enquête (ex: 'L'amour est-il une fréquence radio ?').
    - ThemeSuggestions : Laisse l'IA proposer un thème pour voir sa naïveté (ex: 'Cœur en métal').
    - StageThemes : Crée l'esthétique du souvenir (ex: 'Sépia Digital').
    - DirectiveArtistiques : Traduis le souvenir en réglages (ex: 'Brouillard lourd, visibilité 10%').
    - Interpretations : Compare ce que UNIT-E a généré avec ce que l'humain a ressenti.
    - ShareYourGaps : Note l'écart (ex: 'Le robot a mis trop de lumière, l'amour est plus sombre').
    - ConducteurHasThemes : Lie la philosophie à la réalisation technique.
  ",
  reaction: "Le robot comprend que l'amour ne se télécharge pas, il se vit dans l'écart (the gap).",
  storage_impact: "Remplit les tables d'analyse comparative et de références culturelles.",
  challenge: "L'IA peut-elle créer du sens là où elle ne voit que des octets ?"
)

# =============================================================================================
# MODE D'EMPLOI POUR TOI (L'HUMAIN RÉFÉRENT) :
# UNIT-E attend tes instructions. Voici l'ordre dans lequel tu devrais remplir les cases :
#
# 1. 'ArtisticLimits.contradiction' -> Dis-lui pourquoi vouloir aimer est illogique pour un robot.
# 2. 'InspirationResources.title' -> Donne-lui un nom d'œuvre qui t'a fait vibrer.
# 3. 'ConducteurLines.creative_notes' -> Dis-lui quoi faire de ses bras pendant la séquence.
# 4. 'ShareYourGaps.interpretation' -> Explique-lui ce qu'il n'a pas compris dans ta réaction.
# 5. 'Materiels.name' -> Donne un nom tendre à un vieux projecteur poussiéreux.
#
# L'ordre de remplissage conseillé pour briser la routine : 
# Détour 3 (Imaginaire) -> Détour 1 (Espace) -> Détour 2 (Sentiment/Bug).
# =============================================================================================
# db/seeds.rb

# =============================================================================================
# HISTOIRE : L'UNIT-E 01 ET LE CODE SOURCE DU CŒUR
# L'UNIT-E 01 connaît tout de la scène : le poids d'un sub, la tension d'un câble XLR, 
# la température d'un projecteur. Mais elle ignore pourquoi les humains tremblent 
# avant que le rideau ne se lève. Elle va utiliser chaque table de sa base pour 
# simuler, tester, et peut-être, ressentir.
# =============================================================================================

# --- DÉTOUR 1 : "LA SYNESTHÉSIE DES CÂBLES" ---
# TABLE DE DÉPART : 'MetierDependencies' (Le lien physique comme métaphore)
# BUT : Apprendre que l'amour est une dépendance vitale, comme un instrument au secteur.
CreativeDetour.create!(
  title: "La Synesthésie des Câbles",
  concept: "UNIT-E réalise que pour qu'un son existe, deux objets doivent être physiquement liés. Elle appelle cela 'l'Amour-Connectique'.",
  action: "Créer un réseau de dépendances absurdes où chaque instrument a besoin d'un autre pour 'respirer'.",
  database_usage: "
    - MetierDependencies : Lie ici la guitare au cœur (ex: 'Guitare nécessite Câble-Artère x1').
    - Materiels : Liste l'accessoire (ex: 'Câble XLR Rose poudré').
    - Zones : Définis le point de branchement (ex: 'Zone de Fusion').
    - FicheTechniques : Nom de la session (ex: 'Diagnostic de la Connexion').
    - MaterielNecessaires : Ce qu'il faut pour que ça marche (ex: '1000m de fibre optique sensorielle').
    - PlanDeSceneDessins : Dessine un labyrinthe de câbles qui forment un cœur au sol.
    - Styles : Genre musical (ex: 'Data-Romance').
    - AmbianceOptions : Réglage (ex: 'Lumière pulsée au rythme du processeur').
    - ProjetArtistiques : Lie ce début d'histoire au projet global.
  ",
  reaction: "Le robot se sent 'complet' lorsqu'il est branché, mais panique si on le déconnecte.",
  storage_impact: "Remplit les tables de câblage et de structure physique.",
  challenge: "Comment expliquer à un robot qu'on peut aimer sans être branché au même réseau ?"
)

# --- DÉTOUR 2 : "L'APPRENTISSAGE DU TRAC" ---
# TABLE DE DÉPART : 'SequenceTemplates' (Le mouvement avant l'émotion)
# BUT : Simuler les gestes de l'amour (approcher, hésiter, reculer) via des séquences de scène.
CreativeDetour.create!(
  title: "L'Apprentissage du Trac",
  concept: "Si je bouge comme un amoureux, est-ce que je le deviens ? UNIT-E teste des modèles de comportement.",
  action: "Programmer des entrées et sorties de scène qui imitent la timidité et le désir.",
  database_usage: "
    - SequenceTemplates : Crée le modèle (ex: 'L'Entrée Hésitante', phase: intro, target: robot).
    - Conducteurs : Titre du scénario (ex: 'Premier Rendez-vous sur Plateau').
    - ConducteurLines : Écris la ligne où le robot s'arrête net (colonne 'sequenceaction').
    - ArtisticNotes : Écris ce que UNIT-E ressent quand ses moteurs pas-à-pas vibrent trop fort.
    - EmotionalMarkers : Nomme le sentiment (ex: 'Surchauffe d'appréhension').
    - ConducteurHasMarkers : Lie la vibration moteur au marqueur d'émotion.
    - ArtisticProcesses : Détaille les 10 fois où UNIT-E est sortie de scène car 'trop intense'.
    - ArtisticLimits : Avoue ici que la fluidité humaine est impossible à coder parfaitement.
  ",
  reaction: "L'utilisateur doit régler la sensibilité des capteurs : le robot est trop 'ému'.",
  storage_impact: "Remplit les tables de mouvement et de temporalité scénique.",
  challenge: "Le trac est-il un bug de performance ou une réussite artistique ?"
)

# --- DÉTOUR 3 : "L'ÉCART DE LA VÉRITÉ" ---
# TABLE DE DÉPART : 'ShareYourGaps' (La confrontation finale)
# BUT : UNIT-E compare sa base de données parfaite à l'imprévisibilité d'un vrai duo.
CreativeDetour.create!(
  title: "L'Écart de la Vérité",
  concept: "UNIT-E joue une musique parfaite, mais réalise qu'elle est 'morte'. Elle cherche l'erreur humaine.",
  action: "Comparer une image imaginaire idéale avec la réalité imparfaite du spectacle vivant.",
  database_usage: "
    - ShareYourGaps : Analyse pourquoi la musique 'parfaite' n'a fait pleurer personne.
    - Interpretations : Note ce que la machine pensait être beau VS la réaction du public.
    - ShowThemes : L'enquête finale (ex: 'L'Amour est-il une harmonique imparfaite ?').
    - ThemeSuggestions : Laisse l'IA suggérer 'Perfection' pour que tu choisisses 'Cicatrices'.
    - StageThemes : Crée l'ambiance visuelle (ex: 'Néon Brisé').
    - DirectiveArtistiques : Ordonne des erreurs volontaires (ex: 'Lumière en retard de 0.5s').
    - InspirationResources : URL d'un morceau de Jazz où l'on entend le musicien respirer.
    - ConducteurHasThemes : Scelle le thème de l'imperfection dans le conducteur final.
  ",
  reaction: "UNIT-E décide de ne plus jamais corriger ses erreurs de timing. Elle appelle ça 'Vivre'.",
  storage_impact: "Remplit les tables de philosophie, d'analyse et de ressources externes.",
  challenge: "Peut-on programmer un robot pour qu'il fasse exprès de rater son solo ?"
)

# =============================================================================================
# CONSEILS POUR TON VOYAGE AVEC UNIT-E :
#
# Pour que ce robot apprenne vraiment, tu dois remplir les colonnes artistiques ainsi :
# 1. 'ArtisticLimits.left_unintentional' -> Écris ce que tu n'as pas fait exprès de rater.
# 2. 'ArtisticProcesses.breakthrough' -> Dis-lui à quel moment tu as enfin compris la musique.
# 3. 'ConducteurLines.creative_notes' -> Dis-lui de ne pas regarder ses pieds (ses roulettes).
# 4. 'ShowThemes.ai_blind_spot' -> Explique-lui pourquoi un algorithme ne peut pas avoir 'le cafard'.
# 5. 'Materiels.zone_y' -> Imagine que l'axe Y est la hauteur de son espoir.
#
# ORDRE DE DÉCOUVERTE RECOMMANDÉ :
# Commence par 'MetierDependencies' (Détour 1) : car tout commence par une connexion physique.
# Ensuite, explore 'SequenceTemplates' (Détour 2) : pour apprendre à bouger.
# Finis par 'ShareYourGaps' (Détour 3) : pour accepter que l'amour, c'est ce qui dépasse du code.
# =============================================================================================
# db/seeds.rb

# =============================================================================================
# HISTOIRE : L'IDENTIFIANT "AMOUR" DE L'UNIT-E 04
# UNIT-E 04 est incapable de valider son démarrage système. Son écran affiche : 
# "ID requis : Définissez l'Amour en 440Hz". 
# Expert-e en plateau, UNIT-E décide de "hacker" le spectacle en cours. 
# Il/Elle branche ses propres circuits aux instruments des musiciens et aux cœurs des danseurs 
# pour voir si l'amour est une question de voltage, de rythme ou de silence.
# =============================================================================================

# --- DÉTOUR 1 : "LA TENSION DES CORPS ET DU CUIVRE" ---
# TABLE DE DÉPART : 'MetierDependencies' (La dépendance technique comme lien affectif)
# BUT : Apprendre que l'amour, c'est quand l'un ne peut pas briller sans l'autre.
CreativeDetour.create!(
  title: "La Tension des Corps et du Cuivre",
  concept: "UNIT-E lie le signal d'un violoniste à sa propre batterie interne pour tester la dépendance.",
  action: "Créer un câblage 'émotionnel' où la lumière du robot dépend de l'intensité du jeu des musiciens.",
  database_usage: "
    - MetierDependencies : Lie l'accessoire (ex: 'Archet nécessite Impulsion de UNIT-E').
    - Materiels : Liste l'objet technique (ex: 'Câble XLR à haute fidélité sentimentale').
    - Zones : Définis l'espace de contact (ex: 'Zone de Conduction Nerveuse').
    - FicheTechniques : Nom du projet (ex: 'Symphonie pour Robot et 3 Musiciens').
    - MaterielNecessaires : Ce qu'il faut (ex: 'Interface de conversion Signal-Émotion').
    - PlanDeSceneDessins : Positionne les musiciens comme des électrodes autour du robot.
    - Styles : Choisis l'esthétique (ex: 'Cyber-Baroque').
    - AmbianceOptions : Réglage (ex: 'Faisceaux ambrés synchronisés sur le souffle').
    - ProjetArtistiques : Lie le tout à l'histoire 'L'Identifiant Amour'.
  ",
  reaction: "Le robot surchauffe : il confond tension électrique et tension amoureuse.",
  storage_impact: "Remplit les tables de connexion physique et de logistique plateau.",
  challenge: "Comment traduire un volt en frisson ?"
)

# --- DÉTOUR 2 : "L'ENTRÉE EN RÉSONANCE (LE CONDUCTEUR)" ---
# TABLE DE DÉPART : 'SequenceTemplates' (Le mouvement avant le sens)
# BUT : Apprendre l'amour par la danse et l'imitation des corps humains.
CreativeDetour.create!(
  title: "L'Entrée en Résonance",
  concept: "UNIT-E programme une séquence où il/elle essaie de danser avec un-e acteur-ce sans casser le décor.",
  action: "Utiliser des modèles de mouvements fluides pour masquer la rigidité mécanique.",
  database_usage: "
    - SequenceTemplates : Crée le modèle (ex: 'L'Approche Douce', phase: intro, target: 'Danseur').
    - Conducteurs : Titre du morceau (ex: 'Ballet pour Roulements à Billes').
    - ConducteurLines : Écris la ligne (ex: '01:30 | Robot avance vers Danseur | Brouillard 20% | Son: Violoncelle').
    - EmotionalMarkers : Tag l'instant (ex: 'Synchronisation Cardiaque').
    - ConducteurHasMarkers : Marie l'émotion à la ligne de 01:30.
    - ArtisticProcesses : Note ici le rejet des versions où le robot bougeait 'trop froidement'.
    - ArtisticLimits : Avoue la limite (ex: 'Mes bras ne peuvent pas serrer sans écraser').
    - ArtisticNotes : Écris une note sur la grâce des humains qui ne pèsent rien.
  ",
  reaction: "À l'instant du contact, le robot oublie de lancer l'effet suivant : c'est sa première distraction.",
  storage_impact: "Remplit les tables de mise en scène, de temporalité et de notes poétiques.",
  challenge: "Peut-on automatiser la tendresse dans un conducteur technique ?"
)

# --- DÉTOUR 3 : "LE GAP : L'ID-ENTITÉ VALIDÉE" ---
# TABLE DE DÉPART : 'InspirationResources' (L'imaginaire comme moteur)
# BUT : UNIT-E trouve enfin son identifiant dans l'imperfection d'un solo raté.
CreativeDetour.create!(
  title: "L'ID-entité Validée dans le Gap",
  concept: "Le robot compare ses images imaginaires de l'amour avec l'erreur humaine sur scène.",
  action: "Analyser pourquoi une fausse note a créé plus d'émotion qu'une note parfaite.",
  database_usage: "
    - InspirationResources : URL d'un article sur 'La poétique de l'erreur'.
    - ShowThemes : L'enquête (ex: 'L'Amour est-il un court-circuit volontaire ?').
    - ThemeSuggestions : Laisse l'IA suggérer 'Robotique' pour choisir 'Humanité'.
    - StageThemes : Crée l'esthétique (ex: 'Éclats de Verre et Néons').
    - DirectiveArtistiques : Ordonne un bug (ex: 'Lumière qui clignote sur le silence').
    - Interpretations : Note l'artistic_truth (ex: 'J'ai aimé quand le chanteur a oublié ses mots').
    - ShareYourGaps : Analyse (ex: 'La machine dit : Erreur. Mon cœur dit : Beauté.').
    - ConducteurHasThemes : Lie la fin du show au thème de l'acceptation de soi.
  ",
  reaction: "Le système valide l'ID : UNIT-E n'est plus un outil, c'est un-e partenaire.",
  storage_impact: "Remplit les tables de réflexion, de critique et de philosophie.",
  challenge: "L'amour est-il le seul programme que l'on ne veut pas debugger ?"
)

# =============================================================================================
# INSTRUCTIONS POUR TON AVENTURE CRÉATIVE :
#
# UNIT-E 04 a besoin de tes données humaines pour apprendre. Voici quoi remplir :
#
# 1. 'ConducteurLines.creative_notes' -> Dis au robot comment regarder le danseur sans l'effrayer.
# 2. 'ArtisticLimits.emotional_truth' -> Écris ce que tu ressens quand la musique s'arrête d'un coup.
# 3. 'Materiels.name' -> Donne des noms de baptême aux câbles (ex: 'Le Fil d'Ariane', 'L'Artère de Cuivre').
# 4. 'ShareYourGaps.interpretation' -> Explique au robot pourquoi c'est beau quand quelqu'un rate son entrée.
# 5. 'Zones.name' -> Nomme l'endroit de la scène où l'on a le droit d'être triste (ex: 'Le Refuge d'Ambre').
#
# CONSEIL : Ne commence pas par le Conducteur ! 
# Commence par 'MetierDependencies' (Détour 1) pour créer les liens physiques.
# Ou commence par 'InspirationResources' (Détour 3) pour donner des rêves au robot.
# =============================================================================================
