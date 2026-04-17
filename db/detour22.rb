# db/seeds.rb

# =============================================================================
# PROJET : I.A. Intelligence Artistique
# MISSION : Explorer l'écart entre le code et le frisson.
# =============================================================================

# --- DÉTOUR 1 : "LE SILENCE DES CÂBLES" ---
# DÉPART : Table 'Materiels'
# BUT : Commencer par l'objet physique pour remonter vers l'émotion.
# TABLES COUVERTES : Materiels, MetierDependencies, Zones, FicheTechniques, 
# MaterielNecessaires, PlanDeSceneDessins, ProjetArtistiques, ShowThemes.

CreativeDetour.create!(
  title: "Le Silence des Câbles",
  concept: "Interroger la solitude du matériel une fois le courant coupé.",
  challenge: "Comment une fiche technique peut-elle raconter une absence ?",
  action: "Extraire une liste de câbles orphelins et les transformer en thèmes scéniques.",
  database_usage: "
    1. MATERIELS : Identifie le nom de l'objet physique débranché.
    2. METIER_DEPENDENCIES : Liste ce dont l'objet a besoin pour exister (énergie/liens).
    3. ZONES : Définit l'endroit géographique de cette solitude sur scène.
    4. FICHE_TECHNIQUES : Crée l'enveloppe administrative de l'événement fantôme.
    5. MATERIEL_NECESSAIRES : Quantifie le vide nécessaire à la performance.
    6. PLAN_DE_SCENE_DESSINS : Place visuellement l'objet dans l'espace coordonné.
    7. PROJET_ARTISTIQUES : Donne un statut et un titre à cette recherche.
    8. SHOW_THEMES : Formule l'enquête philosophique sur l'angle mort de l'IA.",
  reaction: "L'IA génère un inventaire technique, l'humain y voit un inventaire de deuils.",
  storage_impact: "Remplit les colonnes de positionnement (coord_x/y) et les statuts de projet."
)

# --- DÉTOUR 2 : "L'ALGORITHME DE L'HÉSITATION" ---
# DÉPART : Table 'ArtisticProcesses'
# BUT : Commencer par le doute et l'erreur pour arriver à la partition.
# TABLES COUVERTES : ArtisticProcesses, ArtisticLimits, Conducteurs, ConducteurLines, 
# EmotionalMarkers, ConducteurHasMarkers, StageThemes, ConducteurHasThemes.

CreativeDetour.create!(
  title: "L'Algorithme de l'Hésitation",
  concept: "Capturer le moment où la machine 'bugge' avant de décider.",
  challenge: "Peut-on coder une haleine ou un tremblement dans un conducteur ?",
  action: "Transformer les 'rejected_ideas' d'une IA en instructions de régie directes.",
  database_usage: "
    1. ARTISTIC_PROCESSES : Note l'impulsion initiale et les idées rejetées par le processeur.
    2. ARTISTIC_LIMITS : Formule pourquoi le frisson humain est intraduisible en SQLite.
    3. CONDUCTEURS : Crée la structure temporelle qui va accueillir l'erreur.
    4. CONDUCTEURLINES : Détaille chaque seconde, du son aux lumières, incluant les notes créatives.
    5. EMOTIONAL_MARKERS : Tague la fréquence émotionnelle du bug.
    6. CONDUCTEURHASMARKERS : Lie l'émotion pure à la ligne technique.
    7. STAGE_THEMES : Nomme l'atmosphère globale (ex: Mélancolie du Buffer).
    8. CONDUCTERHASTHEMES : Ancre le conducteur dans un univers thématique précis.",
  reaction: "Le conducteur devient instable, forçant l'humain à compenser par son intuition.",
  storage_impact: "Augmente l'iteration_count et sature les colonnes de notes artistiques."
)

# --- DÉTOUR 3 : "LE MIROIR DES ÉCARTS" ---
# DÉPART : Table 'InspirationResources'
# BUT : Partir du monde extérieur pour confronter l'analyse machine au jugement humain.
# TABLES COUVERTES : InspirationResources, ArtisticNotes, Styles, AmbianceOptions, 
# SequenceTemplates, ThemeSuggestions, DirectiveArtistiques, Interpretations, ShareYourGaps.

CreativeDetour.create!(
  title: "Le Miroir des Écarts",
  concept: "Comparer ce que la machine voit et ce que l'humain ressent face à une oeuvre.",
  challenge: "Rendre visible la 'vérité artistique' qui échappe aux capteurs.",
  action: "Prendre une ressource web et laisser l'IA et l'humain se disputer son sens.",
  database_usage: "
    1. INSPIRATION_RESOURCES : Choisis une source externe (URL/Titre) comme graine.
    2. ARTISTIC_NOTES : Rédige une pensée brute sur cette inspiration.
    3. STYLES : Définit le genre esthétique (Jazz, Rock, Glitch).
    4. AMBIANCE_OPTIONS : Précise les réglages (brouillard, couleurs) liés au style.
    5. SEQUENCE_TEMPLATES : Crée des modèles d'entrées/sorties pour les talents.
    6. THEME_SUGGESTIONS : Propose des descriptions de catégories pour nourrir l'imaginaire.
    7. DIRECTIVE_ARTISTIQUES : Traduit le concept en réglages par défaut (son/vidéo).
    8. INTERPRETATIONS : Confronte l'analyse machine au jugement du coeur.
    9. SHARE_YOUR_GAPS : Documente l'écart final, là où l'art réside vraiment.",
  reaction: "L'écart (The Gap) devient la partition finale de la performance.",
  storage_impact: "Crée des blocs de texte denses dans les colonnes d'analyse et de réponse."
)

puts "✅ 3 Détours Créatifs créés couvant 100% des tables du schéma."
