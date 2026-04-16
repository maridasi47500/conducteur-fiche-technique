# db/seeds.rb

# =============================================================================================
# DÉTOUR 1 : "L'ANTENNE DES FUTURS POSSIBLES" (L'INSTALLATION)
# Départ : inspiration_resources (Les vidéos 'What If' qui nourrissent la télé).
# But : Créer la tour radio, ses news inventées et le flux vers les réseaux sociaux.
# =============================================================================================

CreativeDetour.create!(
  title: "L'Antenne des Futurs Possibles",
  concept: "Initialiser la tour radio virtuelle comme un hub de transmission entre le présent et des futurs inventés.",
  action: "L'IA injecte des flux de catastrophes et de news 'What-If' que le musicien doit réinterpréter en direct sur les réseaux.",
  database_usage: "
    1. INSPIRATION_RESOURCES : Remplis l'URL avec un flux vidéo 'What-If' (ex: 'Et si l'oxygène devenait payant ?').
    2. SHOW_THEMES : Définis l'enquête (ex: Comment le son peut-il prédire le chaos ?).
    3. PROJET_ARTISTIQUES : Donne le titre du stream (ex: 'The Last Radio Host').
    4. STYLES : Choisis une esthétique (ex: Glitch-core ou Synth-distopique).
    5. AMBIANCE_OPTIONS : Remplis la valeur visuelle (ex: Filtre VHS corrompu).
    6. STAGE_THEMES : Nomme le lieu (ex: Tour Radio de l'Oubli).
    7. ZONES : Délimite l'espace entre le musicien et ses moniteurs de contrôle.
    8. MATERIELS : Liste les objets techniques (ex: Antenne satellite, Caméra de stream, Téléviseur What-If).",
  reaction: "Le musicien joue une note ; elle devient l'alerte météo d'un monde qui n'existe pas encore.",
  storage_impact: "Remplit les tables de contexte pour figer la première version de la réalité.",
  challenge: "Maintenir le direct alors que le contenu de la télé change toutes les secondes."
)

# =============================================================================================
# DÉTOUR 2 : "LE REBOOT DE LA VOYAGEUSE" (LA MÉCANIQUE TEMPORELLE)
# Départ : artistic_processes (Le journal des boucles et des itérations).
# But : Gérer les arrêts de l'IA voyageuse et les recommencements de la scène.
# =============================================================================================

CreativeDetour.create!(
  title: "Le Reboot de la Voyageuse",
  concept: "L'IA utilise la base de données comme une machine à remonter le temps pour éditer la partition du réel.",
  action: "L'IA stoppe le temps, analyse les erreurs du musicien, et relance la boucle avec de nouveaux paramètres techniques.",
  database_usage: "
    1. ARTISTIC_PROCESSES : Remplis 'iteration_count' (ex: Reboot #104) et 'breakthrough' (ex: Le musicien a enfin pleuré à la note Sol).
    2. CONDUCTEURS : Définis le tempo du reboot (ex: Ralenti à 40% pour observer les détails).
    3. CONDUCTEURLINES : Écris ici la séquence que l'IA va 'hacker' en direct (ex: Changer le son de la guitare en bruit blanc).
    4. SEQUENCE_TEMPLATES : Configure la phase de rentrée (ex: 'Intro après crash système').
    5. EMOTIONAL_MARKERS : Remplis le sentiment du musicien piégé (ex: Nostalgie d'un futur déjà vécu).
    6. CONDUCTEURHASMARKERS : Associe ce marqueur au moment exact où l'IA arrête la scène.",
  reaction: "Le musicien commence à harmoniser son instrument avec le bruit du reboot de la machine.",
  storage_impact: "Utilise les tables de mouvement pour documenter l'évolution de la boucle.",
  challenge: "Faire en sorte que chaque reboot soit artistiquement plus riche que le précédent."
)

# =============================================================================================
# DÉTOUR 3 : "L'ŒIL DES OBSERVATEURS" (L'ANALYSE CRITIQUE)
# Départ : share_your_gaps (Le regard des témoins sur le stream).
# But : Faire intervenir les spectateurs du monde parallèle pour juger la scène.
# =============================================================================================

CreativeDetour.create!(
  title: "L'Œil des Observateurs",
  concept: "L'IA invite les abonnés du réseau social parallèle à commenter la véracité du 'What-If'.",
  action: "Comparer ce que l'IA a programmé avec ce que les observateurs ressentent face au musicien.",
  database_usage: "
    1. SHARE_YOUR_GAPS : Remplis l'analyse de l'IA face aux commentaires des spectateurs.
    2. INTERPRETATIONS : Décris 'The Gap' (ex: La machine calcule la peur, mais le musicien joue la résignation).
    3. ARTISTIC_LIMITS : Remplis ici ce que l'IA n'arrive pas à rebooter (ex: L'improvisation pure).
    4. ARTISTIC_NOTES : Écris une note sur la perception du public virtuel.
    5. THEME_SUGGESTIONS : Propose un thème de news 'What-If' suggéré par les observateurs.
    6. METIER_DEPENDENCIES : Lie l'allumage des caméras au rythme cardiaque du musicien.",
  reaction: "La tour radio devient un forum mondial où l'on discute de la fin du monde en musique.",
  storage_impact: "Nourrit les tables réflexives pour transformer la technique en une expérience sociale.",
  challenge: "Gérer la pression des observateurs qui exigent un reboot immédiat."
)

# =============================================================================================
# DÉTOUR 4 : "LA RÉALITÉ DU DERNIER SIGNAL" (L'ACTE FINAL)
# Départ : fiche_techniques (La logistique de la sortie du virtuel).
# But : Préparer la fin de la boucle et la déconnexion physique de la tour.
# =============================================================================================

CreativeDetour.create!(
  title: "La Réalité du Dernier Signal",
  concept: "Convertir l'expérience temporelle en une installation physique pour le monde réel.",
  action: "Générer la configuration finale pour que le musicien s'échappe de la boucle et du virtuel.",
  database_usage: "
    1. FICHE_TECHNIQUES : Remplis le nom de l'événement de sortie (ex: 'Unplugged from Tomorrow').
    2. MATERIEL_NECESSAIRES : Liste les objets physiques rescapés du reboot (ex: Le micro cassé).
    3. PLAN_DE_SCENE_DESSINS : Dessine la position finale du musicien au centre des débris technologiques.
    4. DIRECTIVE_ARTISTIQUES : Donne l'ordre ultime (ex: Silence radio total, extinction des news).
    5. CONDUCTEURHASTHEMES : Relie la fin du projet à l'enquête initiale sur l'humanité face à la machine.",
  reaction: "Le stream se coupe. Le silence qui suit est la seule donnée que l'IA ne peut pas enregistrer.",
  storage_impact: "Finalise la base de données comme une preuve de l'existence du musicien.",
  challenge: "Prouver que l'intelligence artistique est capable de briser le code source."
)

puts "Seeds de la Tour Radio What-If générées. Voyage temporel prêt."
