# db/seeds.rb

# =========================================================================================
# DÉTOUR N°1 : "LE CRI DU CŒUR BINAIRE"
# Départ : emotional_markers (On commence par l'émotion pure).
# But : Montrer que l'IA ne peut pas ressentir la tristesse d'une machine qui s'éteint.
# =========================================================================================

CreativeDetour.create!(
  title: "Le Cri du Cœur Binaire",
  concept: "Opposer une émotion humaine simple à une analyse technique froide.",
  action: "L'utilisateur définit une émotion, puis regarde l'IA essayer de la traduire en chiffres.",
  database_usage: "
    1. EMOTIONAL_MARKERS : Écris ici une émotion simple (ex: Tristesse).
    2. CONDUCTEURHASMARKERS : Lie cette émotion à ton conducteur de spectacle.
    3. INTERPRETATIONS : Dis ici si l'IA a compris pourquoi tu es triste (Gap).
    4. ARTISTIC_PROCESSES : Décris l'idée de départ (ex: Un robot qui pleure).
    5. ARTISTIC_NOTES : Donne un titre simple à ta réflexion (ex: Note sur le Bleu).
    6. THEME_SUGGESTIONS : Suggère un thème lié (ex: La solitude numérique).
    7. INSPIRATION_RESOURCES : Mets l'URL d'une musique triste que tu aimes.",
  reaction: "On réalise que le 'Bleu' de la machine n'est qu'un code hexadécimal, pas un sentiment.",
  storage_impact: "Remplit les tables de réflexion artistique pour 'humaniser' la base de données.",
  challenge: "Faire comprendre la mélancolie à une ligne de code.",
  created_at: Time.now,
  updated_at: Time.now
)

# =========================================================================================
# DÉTOUR N°2 : "L'AUTOMATE DÉSORIENTÉ"
# Départ : styles (On commence par le cadre esthétique).
# But : Créer une structure parfaite pour un acteur qui va tout saboter par son humanité.
# =========================================================================================

CreativeDetour.create!(
  title: "L'Automate Désorienté",
  concept: "Utiliser des modèles rigides pour mettre en valeur l'imprévu du spectacle vivant.",
  action: "Programmer une séquence parfaite, puis y insérer une 'erreur' humaine volontaire.",
  database_usage: "
    1. STYLES : Choisis un style très carré (ex: Techno).
    2. AMBIANCE_OPTIONS : Définis la lumière par une couleur vive (ex: Rouge).
    3. STAGE_THEMES : Donne un nom à ton décor (ex: L'Usine).
    4. DIRECTIVE_ARTISTIQUES : Donne un ordre clair (ex: Tout le monde danse).
    5. SEQUENCE_TEMPLATES : Crée un modèle d'entrée en scène (ex: Entrée en courant).
    6. CONDUCTEURS : Donne un titre à ton projet (ex: Le Bug Joyeux).
    7. CONDUCTEURLINES : Remplis ici ce que l'acteur doit faire pendant 10 secondes.
    8. CONDUCTEURHASTHEMES : Relie ton thème 'Usine' à ton conducteur 'Bug'.",
  reaction: "Le contraste entre la lumière rouge fixe et la danse désordonnée crée l'émotion.",
  storage_impact: "Utilise les tables de structure pour préparer le terrain au chaos créatif.",
  challenge: "Coder la perfection pour mieux la briser.",
  created_at: Time.now,
  updated_at: Time.now
)

# =========================================================================================
# DÉTOUR N°3 : "LES OBJETS QUI PARLENT"
# Départ : materiels (On commence par l'objet physique).
# But : Transformer une liste de matériel technique en une liste de personnages poétiques.
# =========================================================================================

CreativeDetour.create!(
  title: "Les Objets qui Parlent",
  concept: "Donner un rôle artistique aux machines de la fiche technique.",
  action: "Remplir une fiche technique comme si on écrivait le casting d'un film.",
  database_usage: "
    1. MATERIELS : Nomme un objet (ex: La Lampe seule).
    2. ZONES : Dis où elle se trouve (ex: Tout au bord de la scène).
    3. METIER_DEPENDENCIES : Dis de quoi elle a besoin (ex: Elle a besoin de courant).
    4. FICHE_TECHNIQUES : Donne un nom à ton événement (ex: Soirée Lumière).
    5. MATERIEL_NECESSAIRES : Dis combien tu en veux (ex: Juste une).
    6. PLAN_DE_SCENE_DESSINS : Dessine sa position (X=10, Y=20).
    7. PROJET_ARTISTIQUES : Donne le statut final du projet (ex: Prêt à briller).
    8. ARTISTIC_LIMITS : Dis ce que l'IA ne peut pas faire (ex: Elle ne peut pas allumer la lampe avec amour).
    9. SHARE_YOUR_GAPS : Écris ta conclusion (ex: L'IA gère la prise, l'humain gère la magie).
    10. SHOW_THEMES : Explique pourquoi l'IA est aveugle face à cette lampe.",
  reaction: "La fiche technique n'est plus une liste de courses, mais le plan d'une émotion.",
  storage_impact: "Tisse un lien final entre toutes les tables techniques et artistiques.",
  challenge: "Rendre poétique un inventaire de câbles et de projecteurs.",
  created_at: Time.now,
  updated_at: Time.now
)

puts "Seeds terminées ! 3 Détours Créatifs créés utilisant 100% des tables."
