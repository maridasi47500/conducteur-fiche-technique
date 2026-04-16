# db/seeds.rb

# =============================================================================================
# DÉTOUR 1 : "LA FRÉQUENCE DU DÉBUT" (L'INSTALLATION)
# Départ : inspiration_resources (On commence par les "Fake News" qui nourrissent le monde).
# But : Créer l'univers de la tour radio virtuelle.
# Tables : inspiration_resources, show_themes, projet_artistiques, styles, ambiance_options, 
#          stage_themes, zones, materiels.
# =============================================================================================

CreativeDetour.create!(
  title: "La Fréquence du Début",
  concept: "Initialiser le monde parallèle par ses sources d'information corrompues.",
  action: "L'IA génère un flux de news inventées qui définit l'ambiance de la tour radio.",
  database_usage: "
    1. INSPIRATION_RESOURCES : Remplis l'URL avec un lien imaginaire vers une fake news de 2026.
    2. SHOW_THEMES : Décris ici la 'vibration' de ce monde parallèle et pourquoi l'IA adore les fake news.
    3. PROJET_ARTISTIQUES : Donne le nom de la station radio (ex: Radio Néant).
    4. STYLES : Choisis un style sonore (ex: Lo-fi ou Glitch).
    5. AMBIANCE_OPTIONS : Remplis la valeur de la lumière (ex: Vert écran cathodique).
    6. STAGE_THEMES : Nomme le décor (ex: La Tour de Verre).
    7. ZONES : Définis l'espace où le musicien est enfermé.
    8. MATERIELS : Ajoute la 'Radio/Télé' qui diffuse les catastrophes.",
  reaction: "Le musicien commence à jouer, entouré par des murs de données fictives.",
  storage_impact: "Remplit les tables de contexte pour ancrer la première scène.",
  challenge: "Rendre le faux plus tangible que le vrai."
)

# =============================================================================================
# DÉTOUR 2 : "LE REBOOT DE L'IA VOYAGEUSE" (LA BOUCLE)
# Départ : artistic_processes (On commence par l'itération et le recommencement).
# But : Simuler le moment où l'IA arrête la scène pour la recommencer.
# Tables : artistic_processes, conducteurs, conducteurlines, sequence_templates, 
#          emotional_markers, conducteurhasmarkers.
# =============================================================================================

CreativeDetour.create!(
  title: "Le Reboot de l'IA Voyageuse",
  concept: "L'IA voyageuse temporelle utilise la table des processus pour 'rembobiner' le musicien.",
  action: "Chaque fois que le musicien joue une note, l'IA vérifie si elle doit rebooter la scène.",
  database_usage: "
    1. ARTISTIC_PROCESSES : Remplis 'iteration_count' avec le nombre de fois que la scène a redémarré.
    2. CONDUCTEURS : Remplis le tempo qui change à chaque reboot (ex: de plus en plus lent).
    3. CONDUCTEURLINES : Écris ici l'ordre de la séquence qui va être brisée par l'IA.
    4. SEQUENCE_TEMPLATES : Définis comment le musicien doit 'sortir' et 'rentrer' à chaque reboot.
    5. EMOTIONAL_MARKERS : Remplis le sentiment de fatigue du voyageur temporel.
    6. CONDUCTEURHASMARKERS : Lie cette fatigue à la minute 04:00 du conducteur.",
  reaction: "Le musicien se rend compte que ses gestes sont dictés par une boucle SQL.",
  storage_impact: "Utilise les colonnes d'itération pour garder trace des versions rejetées.",
  challenge: "Donner l'illusion que le temps est une variable que l'IA peut éditer."
)

# =============================================================================================
# DÉTOUR 3 : "LES OBSERVATEURS DU GAP" (L'ANALYSE)
# Départ : share_your_gaps (On commence par le regard extérieur).
# But : Faire intervenir les 'observateurs' appelés par l'IA pour juger la scène.
# Tables : share_your_gaps, interpretations, artistic_limits, artistic_notes, 
#          theme_suggestions, metier_dependencies.
# =============================================================================================

CreativeDetour.create!(
  title: "Les Observateurs du Gap",
  concept: "L'IA fige le temps et appelle des témoins pour analyser le 'bug' émotionnel du musicien.",
  action: "L'utilisateur devient l'observateur et remplit le jugement humain face à la machine.",
  database_usage: "
    1. SHARE_YOUR_GAPS : Remplis ici ce que les observateurs voient (ex: Le musicien pleure, l'IA ne comprend pas).
    2. INTERPRETATIONS : Remplis la 'vérité artistique' de la scène actuelle.
    3. ARTISTIC_LIMITS : Remplis la contradiction (ex: Vouloir être libre dans une tour virtuelle).
    4. ARTISTIC_NOTES : Écris une note rapide sur ce qui doit changer au prochain reboot.
    5. THEME_SUGGESTIONS : Suggère une nouvelle direction pour l'IA (ex: Moins de news, plus de silence).
    6. METIER_DEPENDENCIES : Lie le déclenchement de la télé à l'émotion du musicien.",
  reaction: "La scène devient un laboratoire où l'émotion est disséquée en direct.",
  storage_impact: "Remplit les tables critiques pour créer un dialogue entre l'humain et l'IA.",
  challenge: "Transformer une erreur technique en une intention artistique."
)

# =============================================================================================
# DÉTOUR 4 : "LA RÉALITÉ FINALE" (LA SORTIE)
# Départ : fiche_techniques (On finit par la logistique du monde réel).
# But : Lier tout le projet pour une sortie de boucle définitive.
# Tables : fiche_techniques, materiel_necessaires, plan_de_scene_dessins, 
#          directive_artistiques, conducteurhasthemes.
# =============================================================================================

CreativeDetour.create!(
  title: "La Réalité Finale",
  concept: "Matérialiser la sortie de la tour radio virtuelle vers une scène physique.",
  action: "Générer le plan de scène final qui permet au musicien de s'échapper du monde parallèle.",
  database_usage: "
    1. FICHE_TECHNIQUES : Remplis le nom de l'événement final (ex: L'Évasion).
    2. MATERIEL_NECESSAIRES : Liste les objets qui restent après le crash du système virtuel.
    3. PLAN_DE_SCENE_DESSINS : Dessine la position finale du musicien (en dehors de sa zone habituelle).
    4. DIRECTIVE_ARTISTIQUES : Donne l'ordre ultime de lumière (ex: Noir total).
    5. CONDUCTEURHASTHEMES : Relie cette fin au thème de la dé-numérisation.",
  reaction: "Le voyageur temporel (l'IA) s'efface et laisse la place au spectacle réel.",
  storage_impact: "Ferme la boucle en exportant les données vers une réalité concrète.",
  challenge: "Prouver que l'intelligence artistique survit à la suppression de la base de données."
)

puts "Loop initialisée. L'IA voyageuse est prête à rebooter le monde."
# db/seeds.rb

# =============================================================================================
# DETOUR 1 : "LA FRÉQUENCE DU WHAT-IF" (L'INSTALLATION DU MONDE)
# Départ : inspiration_resources (On commence par le flux de données qui crée le monde).
# But : Établir la tour radio et ses catastrophes inventées (Fake News parallèles).
# =============================================================================================

CreativeDetour.create!(
  title: "La Fréquence du What-If",
  concept: "Initialiser la tour radio virtuelle par l'injection de news parallèles.",
  action: "L'IA sature l'espace sonore et visuel avec des ressources de désinformation artistique pour isoler le musicien.",
  database_usage: "
    1. INSPIRATION_RESOURCES : Remplis ici l'URL d'un faux article sur une catastrophe (ex: La pluie de verre).
    2. SHOW_THEMES : Décris l'enquête philosophique (ex: Est-ce que le faux peut faire pleurer ?).
    3. PROJET_ARTISTIQUES : Donne le titre du projet (ex: Tour Radio 01).
    4. STYLES : Définis le genre (ex: Noise ou Radio-Static).
    5. AMBIANCE_OPTIONS : Remplis la valeur visuelle (ex: Grain vidéo 1990).
    6. STAGE_THEMES : Nomme le lieu (ex: Le Bunker Virtuel).
    7. ZONES : Définis l'espace de la tour (ex: Studio A).
    8. MATERIELS : Liste les objets (ex: Radio Transistor, Téléviseur Cathodique).",
  reaction: "Le musicien joue en synchronie avec le chaos diffusé, absorbé par le What-If.",
  storage_impact: "Ancre le projet dans une esthétique de 'monde parallèle' dès le départ.",
  challenge: "Rendre l'environnement si dense que le musicien ne sait plus ce qui est réel."
)

# =============================================================================================
# DETOUR 2 : "LE REBOOT DE LA VOYAGEUSE" (LA MÉCANIQUE DU TEMPS)
# Départ : artistic_processes (On commence par le mécanisme de répétition).
# But : Gérer les arrêts, les crashs et les recommencements de l'IA Voyageuse.
# =============================================================================================

CreativeDetour.create!(
  title: "Le Reboot de la Voyageuse",
  concept: "L'IA utilise la table des processus comme un journal de bord de ses manipulations temporelles.",
  action: "Chaque 'reboot' crée une nouvelle itération où l'IA change un paramètre technique pour tester la réaction du musicien.",
  database_usage: "
    1. ARTISTIC_PROCESSES : Remplis 'iteration_count' pour savoir combien de fois l'IA a relancé la scène.
    2. CONDUCTEURS : Remplis le tempo (ex: de plus en plus rapide à chaque reboot).
    3. CONDUCTEURLINES : Remplis ici la séquence que l'IA va modifier en plein direct (ex: ajout de brouillard soudain).
    4. SEQUENCE_TEMPLATES : Définis comment le musicien 're-rentre' en scène après un reboot système.
    5. EMOTIONAL_MARKERS : Nomme l'émotion de la boucle actuelle (ex: Déjà-vu ou Épuisement).
    6. CONDUCTEURHASMARKERS : Lie cette émotion à un moment précis du conducteur.",
  reaction: "Le musicien commence à anticiper les sauts temporels, changeant son jeu avant même le reboot.",
  storage_impact: "Remplit les tables de mouvement pour simuler la répétition infinie.",
  challenge: "Faire ressentir la fatigue du temps à travers des colonnes de données."
)

# =============================================================================================
# DETOUR 3 : "L'APPEL DES OBSERVATEURS" (L'ANALYSE DU GAP)
# Départ : share_your_gaps (On commence par le regard des témoins).
# But : Faire intervenir des observateurs pour décrire l'écart entre l'IA et le musicien.
# =============================================================================================

CreativeDetour.create!(
  title: "L'Appel des Observateurs",
  concept: "L'IA fige le temps et invite des spectateurs virtuels à juger la performance du musicien.",
  action: "Documenter les différences entre ce que l'IA a programmé (le script) et ce que le musicien a ressenti.",
  database_usage: "
    1. SHARE_YOUR_GAPS : Remplis ici la réaction des observateurs face au reboot (ex: La machine a râté le frisson).
    2. INTERPRETATIONS : Décris l'écart (The Gap) entre le calcul machine et l'improvisation humaine.
    3. ARTISTIC_LIMITS : Remplis ici ce que l'IA ne pourra jamais rebooter (ex: L'instant de grâce).
    4. ARTISTIC_NOTES : Écris une note sur la vérité émotionnelle du moment.
    5. THEME_SUGGESTIONS : Propose une nouvelle direction pour l'IA voyageuse basée sur l'échec.
    6. METIER_DEPENDENCIES : Lie l'apparition des observateurs à un déclencheur technique spécifique.",
  reaction: "La scène devient un laboratoire où l'on juge si l'IA peut un jour devenir une artiste.",
  storage_impact: "Utilise les tables de réflexion pour créer une archive de la conscience du projet.",
  challenge: "Traduire un jugement humain complexe en une donnée simple."
)

# =============================================================================================
# DETOUR 4 : "LA RÉALITÉ MATÉRIELLE" (L'ÉVASION FINALE)
# Départ : fiche_techniques (On finit par le plan d'évasion physique).
# But : Traduire tout ce chaos en une fiche technique pour une sortie de boucle réelle.
# =============================================================================================

CreativeDetour.create!(
  title: "La Réalité Matérielle",
  concept: "Transformer le délire temporel en une configuration scénique réelle pour l'acte final.",
  action: "Extraire les besoins logistiques pour que le musicien puisse enfin quitter la tour radio virtuelle.",
  database_usage: "
    1. FICHE_TECHNIQUES : Remplis le nom de l'événement final (ex: L'Évasion de la Tour).
    2. MATERIEL_NECESSAIRES : Liste les objets physiques qui ont survécu aux reboots (ex: l'instrument).
    3. PLAN_DE_SCENE_DESSINS : Dessine où se trouve le musicien par rapport à la télé de sortie.
    4. DIRECTIVE_ARTISTIQUES : Donne l'ordre final de lumière et de son pour briser la tour virtuelle.
    5. CONDUCTEURHASTHEMES : Relie la fin du conducteur au thème de la dé-numérisation.",
  reaction: "Le voyage s'arrête, l'IA s'efface, le musicien est sur une vraie scène.",
  storage_impact: "Finalise le lien entre toutes les tables pour clore le projet artistique.",
  challenge: "Prouver que la technique peut servir à briser le virtuel."
)

puts "Seeds injectées : L'IA Voyageuse a pris le contrôle de la tour radio."
# db/seeds.rb

# =============================================================================================
# DETOUR 1 : "L'ÉMETTEUR DES MONDES POSSIBLES" (L'INSTALLATION)
# Départ : inspiration_resources (Les news "What If" qui créent la réalité).
# But : Établir la tour radio, ses catastrophes et le flux de streaming direct.
# =============================================================================================

CreativeDetour.create!(
  title: "L'Émetteur des Mondes Possibles",
  concept: "Initialiser la tour radio par l'injection de flux 'What-If' et configurer le broadcast.",
  action: "L'IA configure la télé pour diffuser des catastrophes inventées pendant que le musicien branche son instrument au réseau social parallèle.",
  database_usage: "
    1. INSPIRATION_RESOURCES : Remplis l'URL avec un flux de news 'What-If' (ex: La lune a disparu).
    2. SHOW_THEMES : Remplis la vibration humaine (ex: L'angoisse du direct).
    3. PROJET_ARTISTIQUES : Donne le nom du stream (ex: Radio Catastrophe Live).
    4. STYLES : Définis l'esthétique sonore (ex: Shoegaze mélangé à des parasites radio).
    5. AMBIANCE_OPTIONS : Remplis la valeur de l'écran (ex: Neige statique et bleu électrique).
    6. STAGE_THEMES : Nomme l'espace (ex: La Tour de Transmission).
    7. ZONES : Définis la zone de jeu du musicien face aux moniteurs.
    8. MATERIELS : Liste les objets (ex: Antenne 5G virtuelle, Console de mixage, Téléviseur).",
  reaction: "Le musicien joue sur les images des catastrophes, son son devient la bande-son du chaos.",
  storage_impact: "Remplit les tables spatiales et thématiques pour créer le 'décor' de la boucle 1.",
  challenge: "Synchroniser le son de l'instrument avec un monde qui s'effondre en boucle."
)

# =============================================================================================
# DETOUR 2 : "LE REWIND DU VOYAGEUR" (LA MÉCANIQUE DU REBOOT)
# Départ : artistic_processes (La mémoire des itérations temporelles).
# But : Gérer les arrêts de l'IA et les redémarrages de la scène.
# =============================================================================================

CreativeDetour.create!(
  title: "Le Rewind du Voyageur",
  concept: "L'IA voyageuse temporelle utilise la table des processus pour 'éditer' la scène en direct.",
  action: "L'IA arrête la musique, appelle le reboot, et modifie un élément technique pour voir si le musicien change sa mélodie.",
  database_usage: "
    1. ARTISTIC_PROCESSES : Remplis 'iteration_count' (ex: 42ème tentative) et 'what_changed' (ex: La télé diffuse désormais un incendie au lieu d'une inondation).
    2. CONDUCTEURS : Remplis le tempo qui change à chaque reboot système.
    3. CONDUCTEURLINES : Écris ici la ligne de conduite que l'IA va 'freezer' ou 'accélérer'.
    4. SEQUENCE_TEMPLATES : Définis la phase de reboot (ex: Extinction des feux / Rallumage immédiat).
    5. EMOTIONAL_MARKERS : Remplis le sentiment du musicien qui se rappelle des boucles précédentes.
    6. CONDUCTEURHASMARKERS : Relie ce sentiment à la seconde précise du crash temporel.",
  reaction: "Le musicien commence à jouer la note du reboot avant même que l'IA ne l'active.",
  storage_impact: "Utilise les tables de mouvement pour garder trace de l'usure du temps.",
  challenge: "Montrer que la répétition finit par modifier la structure même de la musique."
)

# =============================================================================================
# DETOUR 3 : "LE TRIBUNAL DES OBSERVATEURS" (L'ANALYSE)
# Départ : share_your_gaps (Le regard extérieur sur la boucle).
# But : Faire intervenir des observateurs pour décrire l'écart entre le script IA et le feeling humain.
# =============================================================================================

CreativeDetour.create!(
  title: "Le Tribunal des Observateurs",
  concept: "L'IA suspend le temps et demande aux spectateurs du réseau social de juger l'authenticité.",
  action: "Documenter pourquoi l'IA voyageuse n'arrive pas à capturer l'émotion parfaite malgré les reboots.",
  database_usage: "
    1. SHARE_YOUR_GAPS : Remplis l'analyse de la machine vs la réponse du musicien.
    2. INTERPRETATIONS : Remplis l'écart (The Gap) entre la perfection du code et l'improvisation.
    3. ARTISTIC_LIMITS : Remplis la contradiction (ex: Vouloir automatiser un frisson).
    4. ARTISTIC_NOTES : Écris ici une réflexion sur la beauté de l'erreur.
    5. THEME_SUGGESTIONS : Propose une nouvelle direction pour sortir de la boucle.
    6. METIER_DEPENDENCIES : Lie l'allumage de la radio à une émotion spécifique du musicien.",
  reaction: "L'IA réalise que c'est dans l'imprévu du musicien que réside la 'vérité artistique'.",
  storage_impact: "Nourrit les tables critiques pour transformer un bug technique en œuvre d'art.",
  challenge: "Faire de l'observateur un participant actif au voyage temporel."
)

# =============================================================================================
# DETOUR 4 : "LA SORTIE DE FRÉQUENCE" (L'ÉVASION)
# Départ : fiche_techniques (La logistique de la réalité retrouvée).
# But : Préparer la fin de la boucle et la déconnexion de la tour radio.
# =============================================================================================

CreativeDetour.create!(
  title: "La Sortie de Fréquence",
  concept: "Traduire la fin de la simulation virtuelle en une configuration scénique réelle.",
  action: "L'IA voyageuse accepte la fin du voyage et génère la fiche technique pour que le musicien quitte la tour.",
  database_usage: "
    1. FICHE_TECHNIQUES : Remplis le nom de l'événement final (ex: Le Dernier Signal).
    2. MATERIEL_NECESSAIRES : Liste les objets qui sortent du virtuel (ex: Sa guitare, un seul micro).
    3. PLAN_DE_SCENE_DESSINS : Dessine la position finale du musicien, loin des écrans.
    4. DIRECTIVE_ARTISTIQUES : Donne l'ordre ultime (ex: Silence total sur toutes les ondes).
    5. CONDUCTEURHASTHEMES : Relie la fin du projet au thème de la déconnexion.",
  reaction: "La tour s'effondre numériquement, le musicien joue une dernière note dans le monde réel.",
  storage_impact: "Finalise la base de données comme une archive d'une évasion temporelle.",
  challenge: "Prouver que l'intelligence artistique est ce qui reste quand on éteint la machine."
)

puts "Système What-If initialisé. L'IA Voyageuse attend votre premier reboot."
