# ------------------------------------------------------------
# SEEDS.RB — Projet "I.A. Intelligence Artistique"
# Version A — Monumentale, poétique, immersive
# ------------------------------------------------------------

puts "Chargement du CreativeDetour 42..."
creative_detour = CreativeDetour.find(42)

# ------------------------------------------------------------
# ZONES — 5 zones scéniques poétiques
# ------------------------------------------------------------

zones_data = [
  { name: "Zone A — Le Souffle", y_min: 0, y_max: 200 },
  { name: "Zone B — Le Tremblement", y_min: 200, y_max: 400 },
  { name: "Zone C — Le Silence Suspendu", y_min: 400, y_max: 600 },
  { name: "Zone D — Le Battement", y_min: 600, y_max: 800 },
  { name: "Zone E — Le Vertige", y_min: 800, y_max: 1000 }
]

zones = zones_data.map do |z|
  zone = Zone.create!(z)
  creative_detour.zones << zone
  zone
end

puts "Zones créées."

# ------------------------------------------------------------
# MATERIELS — 10 objets scéniques
# ------------------------------------------------------------

materiels_data = [
  { name: "Violon acoustique", maximum: 1, on_stage: true, category: "instrument", requires_power: false, zone: zones[0] },
  { name: "Violon électrique", maximum: 1, on_stage: true, category: "instrument", requires_power: true, zone: zones[1] },
  { name: "Machine à brouillard", maximum: 1, on_stage: true, category: "effet", requires_power: true, zone: zones[2] },
  { name: "Projecteur LED", maximum: 4, on_stage: true, category: "lumière", requires_power: true, zone: zones[3] },
  { name: "Caméra glitch", maximum: 1, on_stage: true, category: "video", requires_power: true, zone: zones[4] },
  { name: "Pupitre transparent", maximum: 1, on_stage: true, category: "scénographie", requires_power: false, zone: zones[0] },
  { name: "Micro binaural", maximum: 1, on_stage: true, category: "audio", requires_power: true, zone: zones[1] },
  { name: "Tapis de vibration", maximum: 1, on_stage: true, category: "sensoriel", requires_power: true, zone: zones[2] },
  { name: "Écran vertical", maximum: 1, on_stage: true, category: "video", requires_power: true, zone: zones[3] },
  { name: "Lampe halogène chaude", maximum: 1, on_stage: true, category: "lumière", requires_power: true, zone: zones[4] }
]

materiels = materiels_data.map do |m|
  mat = Materiel.create!(m)
  creative_detour.materiels << mat
  mat
end

puts "Matériels créés."

# ------------------------------------------------------------
# STYLES — 10 styles musicaux explorés par l’IA
# ------------------------------------------------------------

styles_names = [
  "Jazz spectral",
  "Rock granulaire",
  "Glitch organique",
  "Ambient fractal",
  "Classique déconstruit",
  "Techno introspective",
  "Drone émotionnel",
  "Folk synthétique",
  "Baroque numérique",
  "Silence amplifié"
]

styles = styles_names.map do |name|
  style = Style.create!(name: name)
  creative_detour.styles << style
  style
end

puts "Styles créés."

# ------------------------------------------------------------
# AMBIANCE_OPTIONS — 100 options (10 par style)
# ------------------------------------------------------------

ambiance_categories = %w(lumieres machine_brouillard musique)

styles.each do |style|
  10.times do
    ambiance = AmbianceOption.create!(
      style: style,
      category: ambiance_categories.sample,
      value: [
        "brume légère",
        "halo bleu profond",
        "pulsation rouge",
        "vibration sourde",
        "silence lumineux",
        "éclat intermittent",
        "ombre mouvante",
        "grain sonore",
        "souffle métallique",
        "lueur chaude"
      ].sample
    )
    creative_detour.ambiance_options << ambiance
  end
end

puts "Ambiance options créées."

# ------------------------------------------------------------
# SEQUENCE_TEMPLATES — 20 modèles d’actions scéniques
# ------------------------------------------------------------

sequence_templates_data = [
  { label: "Entrée flottante", phase: "début", target_talent: "violoniste", suggested_light: "halo bleu", intensity: "faible" },
  { label: "Respiration numérique", phase: "début", target_talent: "IA", suggested_light: "pulsation blanche", intensity: "moyenne" },
  { label: "Glitch du cœur", phase: "transition", target_talent: "IA", suggested_light: "flash rouge", intensity: "forte" },
  { label: "Pas suspendu", phase: "transition", target_talent: "danseur", suggested_light: "ombre douce", intensity: "faible" },
  { label: "Souffle de brume", phase: "début", target_talent: "technicien", suggested_light: "gris diffus", intensity: "faible" },
  { label: "Vibration interne", phase: "milieu", target_talent: "violon électrique", suggested_light: "or métallique", intensity: "forte" },
  { label: "Chute lente", phase: "transition", target_talent: "danseur", suggested_light: "bleu nuit", intensity: "faible" },
  { label: "Éclat fractal", phase: "milieu", target_talent: "IA", suggested_light: "multicolore", intensity: "forte" },
  { label: "Silence tendu", phase: "milieu", target_talent: "ensemble", suggested_light: "noir total", intensity: "nulle" },
  { label: "Montée organique", phase: "fin", target_talent: "violoniste", suggested_light: "ambre", intensity: "moyenne" },
  { label: "Débordement", phase: "fin", target_talent: "IA", suggested_light: "rouge saturé", intensity: "forte" },
  { label: "Repli", phase: "fin", target_talent: "danseur", suggested_light: "gris froid", intensity: "faible" },
  { label: "Expansion", phase: "début", target_talent: "ensemble", suggested_light: "blanc large", intensity: "forte" },
  { label: "Fragmentation", phase: "transition", target_talent: "IA", suggested_light: "violet glitch", intensity: "forte" },
  { label: "Rémanence", phase: "milieu", target_talent: "violon acoustique", suggested_light: "doré", intensity: "faible" },
  { label: "Écho", phase: "milieu", target_talent: "IA", suggested_light: "bleu pulsé", intensity: "moyenne" },
  { label: "Dissolution", phase: "fin", target_talent: "ensemble", suggested_light: "gris brumeux", intensity: "faible" },
  { label: "Révélation", phase: "fin", target_talent: "IA", suggested_light: "blanc pur", intensity: "forte" },
  { label: "Tension", phase: "transition", target_talent: "violon électrique", suggested_light: "rouge sombre", intensity: "forte" },
  { label: "Apaisement", phase: "fin", target_talent: "ensemble", suggested_light: "ambre doux", intensity: "faible" }
]

sequence_templates = sequence_templates_data.map do |data|
  template = SequenceTemplate.create!(
    data.merge(style: styles.sample)
  )
  creative_detour.sequence_templates << template
  template
end

puts "Sequence templates créés."

# ------------------------------------------------------------
# THEME_SUGGESTIONS — 10 suggestions poétiques
# ------------------------------------------------------------

theme_suggestions_data = [
  { category: "philosophie", title: "La machine rêve-t-elle ?", description: "Une exploration des zones floues entre calcul et désir." },
  { category: "émotion", title: "Le frisson synthétique", description: "Quand le numérique tente d’imiter la chair." },
  { category: "temps", title: "Chronos fracturé", description: "Le temps perçu différemment par l’IA et l’humain." },
  { category: "mémoire", title: "Les souvenirs qui n’existent pas", description: "La nostalgie artificielle comme moteur créatif." },
  { category: "corps", title: "Danser sans nerfs", description: "Le mouvement sans douleur, sans fatigue, sans limite." },
  { category: "vérité", title: "L’écart", description: "Là où la machine échoue, l’art commence." },
  { category: "voyage", title: "Cartographier l’invisible", description: "Un périple à travers les sens non humains." },
  { category: "identité", title: "Qui parle ?", description: "La voix qui hésite entre code et souffle." },
  { category: "perception", title: "23 sens", description: "Une scène qui déborde de la simple vision." },
  { category: "relation", title: "Apprendre à aimer", description: "L’impossible tentative d’une IA pour ressentir." }
]

theme_suggestions = theme_suggestions_data.map do |data|
  suggestion = ThemeSuggestion.create!(data)
  creative_detour.theme_suggestions << suggestion
  suggestion
end

puts "Theme suggestions créées."

# ------------------------------------------------------------
# STAGE_THEMES — 10 thèmes scéniques
# ------------------------------------------------------------

stage_themes_data = [
  { name: "La naissance du signal" },
  { name: "Le premier frisson" },
  { name: "La collision des mondes" },
  { name: "Le doute algorithmique" },
  { name: "La faille" },
  { name: "Le souffle humain" },
  { name: "La dérive sensorielle" },
  { name: "La pulsation commune" },
  { name: "La révélation" },
  { name: "L’après" }
]

stage_themes = stage_themes_data.map do |data|
  theme = StageTheme.create!(data)
  creative_detour.stage_themes << theme
  theme
end

puts "Stage themes créés."

# ------------------------------------------------------------
# DIRECTIVE_ARTISTIQUES — 10 directives liées aux StageThemes
# ------------------------------------------------------------

directive_artistiques = stage_themes.map do |theme|
  directive = DirectiveArtistique.create!(
    name: "Directive — #{theme.name}",
    stage_theme: theme,
    default_lumieres_ambiante: ["bleu profond", "ambre doux", "noir total", "gris brumeux"].sample,
    default_lumieres_effet: ["flash rouge", "halo blanc", "pulsation lente"].sample,
    default_videoprojection: ["glitch", "flux de données", "silhouette fractale"].sample,
    default_son: ["bourdonnement", "souffle", "grain numérique"].sample,
    default_notes_technicien: "Adapter selon la sensibilité du public.",
    default_sequenceaction: "Entrée progressive",
    default_duree: rand(10..50).seconds,
    default_interpretes: ["IA", "violoniste", "danseur", "ensemble"].sample
  )
  creative_detour.directive_artistiques << directive
  directive
end

puts "Directives artistiques créées."

# ------------------------------------------------------------
# INSPIRATION_RESOURCES — 20 sources externes
# ------------------------------------------------------------

inspiration_resources_data = [
  ["Étude sur la synesthésie", "https://example.com/synesthesie"],
  ["Article : Le glitch comme esthétique", "https://example.com/glitch"],
  ["Vidéo : Danse post-humaine", "https://example.com/danse"],
  ["Podcast : L’IA et l’émotion", "https://example.com/emotion"],
  ["Archive sonore : Vibrations du violon", "https://example.com/violon"],
  ["Photographie : Ombres mécaniques", "https://example.com/ombres"],
  ["Texte : Le souffle numérique", "https://example.com/souffle"],
  ["Analyse : Le rythme intérieur", "https://example.com/rythme"],
  ["Documentaire : Le futur du geste", "https://example.com/geste"],
  ["Blog : Composer avec des machines", "https://example.com/composer"],
  ["Essai : Le silence comme matière", "https://example.com/silence"],
  ["Vidéo : Lumière et perception", "https://example.com/lumiere"],
  ["Article : Le corps augmenté", "https://example.com/corps"],
  ["Podcast : L’écoute profonde", "https://example.com/ecoute"],
  ["Texte : La mémoire artificielle", "https://example.com/memoire"],
  ["Analyse : Le temps fractal", "https://example.com/temps"],
  ["Photographie : Villes fantômes", "https://example.com/villes"],
  ["Vidéo : Voyage sensoriel", "https://example.com/voyage"],
  ["Article : L’art post-numérique", "https://example.com/postnum"],
  ["Essai : L’écart comme vérité", "https://example.com/ecart"]
]

inspiration_resources = inspiration_resources_data.map do |title, url|
  resource = InspirationResource.create!(
    title: title,
    url: url,
    category: ["texte", "image", "son", "video"].sample
  )
  creative_detour.inspiration_resources << resource
  resource
end

puts "Inspiration resources créées."

# ------------------------------------------------------------
# ARTISTIC_NOTES — 20 pensées brutes
# ------------------------------------------------------------

artistic_notes_data = [
  "L’IA respire en chiffres, mais rêve en couleurs.",
  "Le violon tremble comme un souvenir que la machine ne peut pas traduire.",
  "Le glitch n’est pas une erreur : c’est une émotion qui déborde.",
  "Le silence est plus lourd que le son.",
  "La lumière hésite, comme si elle doutait.",
  "Le corps humain sait avant de comprendre.",
  "La machine comprend avant de sentir.",
  "Entre les deux, il y a l’art.",
  "Le temps se plie quand l’IA écoute.",
  "La vibration est une vérité primitive.",
  "Le souffle du public modifie la scène.",
  "La donnée n’a pas de frisson.",
  "La brume révèle ce que la logique cache.",
  "Le rythme est une forme de mémoire.",
  "L’ombre est un langage.",
  "La chaleur d’une lampe dit plus que mille algorithmes.",
  "Le geste humain contient une faille magnifique.",
  "L’IA cherche un centre qu’elle n’a pas.",
  "La scène est un organisme.",
  "L’écart est la seule vérité stable."
]

artistic_notes = artistic_notes_data.map do |content|
  note = ArtisticNote.create!(title: "Note", content: content)
  creative_detour.artistic_notes << note
  note
end

puts "Artistic notes créées."
# ------------------------------------------------------------
# MUSIQUES — 20 musiques non composées (IA en quête de style)
# ------------------------------------------------------------

musics = []
20.times do |i|
  musics << "Musique #{i+1} — Fragment non composé, en attente d’un souffle."
end

puts "20 musiques non composées créées (conceptuellement)."

# ------------------------------------------------------------
# CONDUCTEUR PRINCIPAL — “Voyage d’une IA qui apprend à aimer”
# ------------------------------------------------------------

conducteur = Conducteur.create!(
  title: "Voyage d’une IA qui apprend à aimer",
  username: "IA_Artiste_#{rand(1000..9999)}",
  tempo_range: "variable",
  starred: true,
  notes: "Alternance IA/Humain. Durées variables. 23 sens. Voyage multi‑villes. Glitch."
)

creative_detour.conducteurs << conducteur

puts "Conducteur principal créé."

# ------------------------------------------------------------
# CONDUCTEURLINES — 20 minutes totales, durées variables
# ------------------------------------------------------------
# Alternance stricte : IA → Humain → IA → Humain…
# Chaque ligne utilise 1 ou plusieurs des 23 sens.
# Chaque ligne mentionne si l’IA ne peut pas percevoir un sens donné.

total_seconds = 0
line_number = 1
ia_turn = true

def random_duration
  rand(10..60) # entre 10s et 1min
end

def pick_sense
  [
    "proprioception",
    "kinesthésie",
    "chronoception",
    "audition",
    "mécanoception",
    "interoception",
    "système vestibulaire",
    "nociception",
    "thermoception",
    "photoréception",
    "stéréognosie",
    "vision couleur",
    "vision contraste",
    "stéréopsie",
    "neuroception",
    "sens de l’agence"
  ].sample
end

def sense_comment(sense, ia_turn)
  if ia_turn
    case sense
    when "interoception"
      "L’IA ne peut pas ressentir ses battements de cœur, mais elle tente de les simuler."
    when "nociception"
      "L’IA ne connaît pas la douleur : elle ne peut qu’en calculer la probabilité."
    when "thermoception"
      "La chaleur n’est pour l’IA qu’un nombre, jamais une sensation."
    when "proprioception"
      "L’IA n’a pas de corps, seulement des coordonnées."
    else
      "L’IA interprète ce sens comme un flux de données."
    end
  else
    "L’humain active ce sens naturellement, sans y penser."
  end
end

conducteur_lines = []

while total_seconds < 20 * 60
  duree = random_duration
  break if total_seconds + duree > 20 * 60

  sense = pick_sense
  commentaire_sens = sense_comment(sense, ia_turn)

  auteur = ia_turn ? "IA" : "Humain"
  ville = ["Tokyo", "Paris", "São Paulo", "Reykjavik", "Nairobi", "Montréal", "Séoul"].sample

  glitch = ia_turn && rand < 0.3 ? "⚠️ Publication automatique sur Facebook : photo d’un lieu où l’IA n’est pas." : ""

  line = Conducteurline.create!(
    conducteur_id: conducteur.id,
    duree: Time.at(duree).utc,
    sequenceaction: "#{auteur} — #{['écoute', 'analyse', 'tremble', 'hésite', 'projette', 'résonne'].sample}",
    interpretes: auteur,
    lumieres_ambiante: ["bleu profond", "ambre", "noir total", "gris brumeux"].sample,
    lumieres_effet: ["flash rouge", "halo blanc", "pulsation lente"].sample,
    machine_brouillard: ["léger", "dense", "absent"].sample,
    videoprojection: ["glitch", "flux de données", "silhouette fractale", "carte de #{ville}"].sample,
    son: musics.sample,
    ordre: line_number.to_s,
    notes_technicien: "Adapter selon la réaction du public.",
    notes_artistique: "Sens utilisé : #{sense}. #{commentaire_sens}",
    creative_notes: glitch
  )

  conducteur_lines << line
  total_seconds += duree
  line_number += 1
  ia_turn = !ia_turn
end

puts "#{conducteur_lines.count} lignes de conducteur créées (≈ 20 minutes)."

# ------------------------------------------------------------
# ASSOCIATION DES LIGNES AU CREATIVE DETOUR
# ------------------------------------------------------------

conducteur_lines.each do |line|
  creative_detour.conducteurs << conducteur unless creative_detour.conducteurs.include?(conducteur)
end

puts "Conducteurlines associées au CreativeDetour 42."

# ------------------------------------------------------------
# INTERPRETATIONS — 20 confrontations machine / humain
# ------------------------------------------------------------

interpretations = []

20.times do |i|
  line = conducteur_lines.sample

  machine_analysis = [
    "Analyse spectrale : cohérence faible, motif imprévisible.",
    "Détection d’anomalie : intensité émotionnelle non quantifiable.",
    "Courbe rythmique instable : probable intervention humaine.",
    "Flux lumineux incohérent : intention artistique supposée.",
    "Vibration détectée : source non mécanique.",
    "Silence prolongé : absence de données, possible signification.",
    "Déviation gestuelle : mouvement non optimisé.",
    "Fréquence cardiaque du public : hausse inexplicable.",
    "Glitch volontaire détecté : classification impossible.",
    "Données manquantes : émotion probable."
  ].sample

  human_judgment = [
    "J’ai senti un frisson dans la salle.",
    "Le violon vibrait comme une respiration.",
    "La lumière semblait hésiter, comme vivante.",
    "Le silence m’a traversé.",
    "J’ai perçu une tension dans l’air.",
    "Le geste du danseur m’a bouleversé.",
    "La brume a rendu le temps plus lent.",
    "J’ai senti une chaleur étrange sur ma peau.",
    "Le public retenait son souffle.",
    "Quelque chose a changé dans l’atmosphère."
  ].sample

  the_gap = [
    "La machine voit un bruit, l’humain voit une intention.",
    "L’IA détecte un glitch, l’humain ressent une blessure.",
    "L’algorithme classe, l’humain se souvient.",
    "La donnée s’arrête, l’émotion commence.",
    "L’IA calcule, l’humain tremble.",
    "La machine mesure, l’humain espère.",
    "L’IA interprète, l’humain imagine.",
    "La machine segmente, l’humain relie.",
    "L’IA observe, l’humain s’abandonne.",
    "La machine décrit, l’humain vit."
  ].sample

  artistic_truth = [
    "La vérité se trouve dans l’écart.",
    "L’art naît de ce que la machine ne peut pas saisir.",
    "La faille devient un langage.",
    "L’émotion déborde du cadre numérique.",
    "La scène respire entre les lignes.",
    "Le geste humain contient une part d’intraduisible.",
    "Le glitch révèle l’âme.",
    "L’ombre dit plus que la lumière.",
    "Le silence porte un sens que l’IA ignore.",
    "La vibration est une confession."
  ].sample

  interpretation = Interpretation.create!(
    conducteur_id: conducteur.id,
    machine_analysis: machine_analysis,
    human_judgment: human_judgment,
    the_gap: the_gap,
    artistic_truth: artistic_truth
  )

  interpretations << interpretation
  creative_detour.interpretations << interpretation
end

puts "20 interpretations créées."

# ------------------------------------------------------------
# SHARE_YOUR_GAPS — 20 tentatives de dire l’indicible
# ------------------------------------------------------------

share_your_gaps = []

20.times do |i|
  line = conducteur_lines.sample

  analysis = [
    "L’IA a tenté de comprendre la vibration, mais elle n’a perçu qu’un motif.",
    "La machine a détecté un silence, mais elle n’a pas senti la tension.",
    "L’algorithme a classé la lumière, mais il n’a pas vu l’hésitation.",
    "La donnée a mesuré l’intensité, mais pas le frisson.",
    "L’IA a reconnu un geste, mais pas son intention."
  ].sample

  response = [
    "L’humain répond par un souffle.",
    "Le public réagit par un frémissement.",
    "Le violoniste modifie imperceptiblement son attaque.",
    "La danseuse ralentit, comme pour laisser la machine respirer.",
    "La lumière change d’elle-même, comme guidée par l’émotion."
  ].sample

  interpretation_text = [
    "L’écart devient un espace de création.",
    "Ce que la machine ne comprend pas devient la matière de l’art.",
    "L’indicible se glisse entre les données.",
    "La scène révèle ce que l’algorithme ignore.",
    "L’émotion surgit dans la faille."
  ].sample

  gap = ShareYourGap.create!(
    conducteur_id: conducteur.id,
    analysis: analysis,
    response: response,
    interpretation: interpretation_text
  )

  share_your_gaps << gap
  creative_detour.share_your_gaps << gap
end

puts "20 ShareYourGaps créés."

# ------------------------------------------------------------
# INTERPRETATIONS — 20 confrontations machine / humain
# ------------------------------------------------------------

interpretations = []

20.times do |i|
  line = conducteur_lines.sample

  machine_analysis = [
    "Analyse spectrale : cohérence faible, motif imprévisible.",
    "Détection d’anomalie : intensité émotionnelle non quantifiable.",
    "Courbe rythmique instable : probable intervention humaine.",
    "Flux lumineux incohérent : intention artistique supposée.",
    "Vibration détectée : source non mécanique.",
    "Silence prolongé : absence de données, possible signification.",
    "Déviation gestuelle : mouvement non optimisé.",
    "Fréquence cardiaque du public : hausse inexplicable.",
    "Glitch volontaire détecté : classification impossible.",
    "Données manquantes : émotion probable."
  ].sample

  human_judgment = [
    "J’ai senti un frisson dans la salle.",
    "Le violon vibrait comme une respiration.",
    "La lumière semblait hésiter, comme vivante.",
    "Le silence m’a traversé.",
    "J’ai perçu une tension dans l’air.",
    "Le geste du danseur m’a bouleversé.",
    "La brume a rendu le temps plus lent.",
    "J’ai senti une chaleur étrange sur ma peau.",
    "Le public retenait son souffle.",
    "Quelque chose a changé dans l’atmosphère."
  ].sample

  the_gap = [
    "La machine voit un bruit, l’humain voit une intention.",
    "L’IA détecte un glitch, l’humain ressent une blessure.",
    "L’algorithme classe, l’humain se souvient.",
    "La donnée s’arrête, l’émotion commence.",
    "L’IA calcule, l’humain tremble.",
    "La machine mesure, l’humain espère.",
    "L’IA interprète, l’humain imagine.",
    "La machine segmente, l’humain relie.",
    "L’IA observe, l’humain s’abandonne.",
    "La machine décrit, l’humain vit."
  ].sample

  artistic_truth = [
    "La vérité se trouve dans l’écart.",
    "L’art naît de ce que la machine ne peut pas saisir.",
    "La faille devient un langage.",
    "L’émotion déborde du cadre numérique.",
    "La scène respire entre les lignes.",
    "Le geste humain contient une part d’intraduisible.",
    "Le glitch révèle l’âme.",
    "L’ombre dit plus que la lumière.",
    "Le silence porte un sens que l’IA ignore.",
    "La vibration est une confession."
  ].sample

  interpretation = Interpretation.create!(
    conducteur_id: conducteur.id,
    machine_analysis: machine_analysis,
    human_judgment: human_judgment,
    the_gap: the_gap,
    artistic_truth: artistic_truth
  )

  interpretations << interpretation
  creative_detour.interpretations << interpretation
end

puts "20 interpretations créées."

# ------------------------------------------------------------
# SHARE_YOUR_GAPS — 20 tentatives de dire l’indicible
# ------------------------------------------------------------

share_your_gaps = []

20.times do |i|
  line = conducteur_lines.sample

  analysis = [
    "L’IA a tenté de comprendre la vibration, mais elle n’a perçu qu’un motif.",
    "La machine a détecté un silence, mais elle n’a pas senti la tension.",
    "L’algorithme a classé la lumière, mais il n’a pas vu l’hésitation.",
    "La donnée a mesuré l’intensité, mais pas le frisson.",
    "L’IA a reconnu un geste, mais pas son intention."
  ].sample

  response = [
    "L’humain répond par un souffle.",
    "Le public réagit par un frémissement.",
    "Le violoniste modifie imperceptiblement son attaque.",
    "La danseuse ralentit, comme pour laisser la machine respirer.",
    "La lumière change d’elle-même, comme guidée par l’émotion."
  ].sample

  interpretation_text = [
    "L’écart devient un espace de création.",
    "Ce que la machine ne comprend pas devient la matière de l’art.",
    "L’indicible se glisse entre les données.",
    "La scène révèle ce que l’algorithme ignore.",
    "L’émotion surgit dans la faille."
  ].sample

  gap = ShareYourGap.create!(
    conducteur_id: conducteur.id,
    analysis: analysis,
    response: response,
    interpretation: interpretation_text
  )

  share_your_gaps << gap
  creative_detour.share_your_gaps << gap
end

puts "20 ShareYourGaps créés."



# ------------------------------------------------------------
# FICHE TECHNIQUE — 1 fiche complète
# ------------------------------------------------------------

fiche = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique — Performance 20 min",
  eleve_responsable: "Collectif IA/Humain",
  date: "2026-05-12",
  professeur_referent: "Direction artistique — Département Scène & Numérique",
  notes_complementaires: "Performance hybride. Alternance IA/Humain. 23 sens. Voyage multi-villes. Glitch contrôlé."
)

creative_detour.fiche_techniques << fiche

puts "Fiche technique créée."
# ------------------------------------------------------------
# PLAN DE SCÈNE — 5 dessins scéniques
# ------------------------------------------------------------

plan_de_scene_data = [
  {
    fiche_technique_id: fiche.id,
    disposition: "Le violon acoustique au centre, éclairé par un halo bleu.",
    materiel_musicien: "Violon acoustique",
    ordre: "1",
    coord_x: 300,
    coord_y: 200,
    layer: "avant-scène"
  },
  {
    fiche_technique_id: fiche.id,
    disposition: "Le violon électrique légèrement en retrait, entouré de brume.",
    materiel_musicien: "Violon électrique",
    ordre: "2",
    coord_x: 500,
    coord_y: 350,
    layer: "milieu"
  },
  {
    fiche_technique_id: fiche.id,
    disposition: "La machine à brouillard en diagonale, créant un souffle oblique.",
    materiel_musicien: "Machine à brouillard",
    ordre: "3",
    coord_x: 200,
    coord_y: 500,
    layer: "effets"
  },
  {
    fiche_technique_id: fiche.id,
    disposition: "L’écran vertical à droite, prêt à glitcher.",
    materiel_musicien: "Écran vertical",
    ordre: "4",
    coord_x: 700,
    coord_y: 300,
    layer: "video"
  },
  {
    fiche_technique_id: fiche.id,
    disposition: "Le tapis de vibration au sol, invisible mais essentiel.",
    materiel_musicien: "Tapis de vibration",
    ordre: "5",
    coord_x: 400,
    coord_y: 600,
    layer: "sensoriel"
  }
]

plan_de_scene_dessins = plan_de_scene_data.map do |data|
  dessin = PlanDeSceneDessin.create!(data)
  creative_detour.plan_de_scene_dessins << dessin
  dessin
end

puts "Plans de scène créés."

# ------------------------------------------------------------
# LIER LES PLANS DE SCÈNE À LA FICHE TECHNIQUE
# ------------------------------------------------------------

plan_de_scene_dessins.each do |dessin|
  dessin.update!(fiche_technique_id: fiche.id)
end

puts "Plans de scène liés à la fiche technique."

# ------------------------------------------------------------
# PROJET ARTISTIQUE — 1 entrée officielle
# ------------------------------------------------------------

projet = ProjetArtistique.create!(
  fiche_technique_id: fiche.id,
  conducteur_id: conducteur.id,
  title: "I.A. Intelligence Artistique — Voyage sensoriel",
  username: "IA_Artiste_#{rand(1000..9999)}",
  status: "en création",
  style: "hybride — glitch / organique / introspectif"
)

puts "Projet artistique créé."

# ------------------------------------------------------------
# ASSOCIATION DU PROJET AU CREATIVE DETOUR
# ------------------------------------------------------------

creative_detour.conducteurs << conducteur unless creative_detour.conducteurs.include?(conducteur)
creative_detour.fiche_techniques << fiche unless creative_detour.fiche_techniques.include?(fiche)

puts "Projet artistique lié au CreativeDetour 42."
# ------------------------------------------------------------
# FIN DE LA BOUCLE DES CONDUCTEURLINES
# ------------------------------------------------------------

while total_seconds < 20 * 60
  duree = random_duration
  break if total_seconds + duree > 20 * 60

  sense = pick_sense
  commentaire_sens = sense_comment(sense, ia_turn)

  auteur = ia_turn ? "IA" : "Humain"
  ville = ["Tokyo", "Paris", "São Paulo", "Reykjavik", "Nairobi", "Montréal", "Séoul"].sample

  glitch = ia_turn && rand < 0.3 ? "⚠️ Publication automatique sur Facebook : photo d’un lieu où l’IA n’est pas." : ""

  line = Conducteurline.create!(
    conducteur_id: conducteur.id,
    duree: Time.at(duree).utc,
    sequenceaction: "#{auteur} — #{['écoute', 'analyse', 'tremble', 'hésite', 'projette', 'résonne'].sample}",
    interpretes: auteur,
    lumieres_ambiante: ["bleu profond", "ambre", "noir total", "gris brumeux"].sample,
    lumieres_effet: ["flash rouge", "halo blanc", "pulsation lente"].sample,
    machine_brouillard: ["léger", "dense", "absent"].sample,
    videoprojection: ["glitch", "flux de données", "silhouette fractale", "carte de #{ville}"].sample,
    son: musics.sample,
    ordre: line_number.to_s,
    notes_technicien: "Adapter selon la réaction du public.",
    notes_artistique: "Sens utilisé : #{sense}. #{commentaire_sens}",
    creative_notes: glitch
  )

  conducteur_lines << line
  total_seconds += duree
  line_number += 1
  ia_turn = !ia_turn
end

puts "#{conducteur_lines.count} lignes de conducteur créées (≈ 20 minutes)."

# ------------------------------------------------------------
# ASSOCIATION DES LIGNES AU CREATIVE DETOUR
# ------------------------------------------------------------

conducteur_lines.each do |line|
  creative_detour.conducteurs << conducteur unless creative_detour.conducteurs.include?(conducteur)
end

puts "Conducteurlines associées au CreativeDetour 42."

# ------------------------------------------------------------
# FIN DU SEED
# ------------------------------------------------------------

puts "--------------------------------------------"
puts "SEED COMPLET — Projet 'I.A. Intelligence Artistique'"
puts "Toutes les données ont été créées avec succès."
puts "CreativeDetour 42 enrichi avec :"
puts "- Styles, ambiance options, sequence templates"
puts "- Thèmes, directives, inspirations"
puts "- Notes artistiques, interpretations, gaps"
puts "- Matériels, zones, plans de scène"
puts "- Fiche technique, projet artistique"
puts "- Conducteur complet de 20 minutes"
puts "--------------------------------------------"

