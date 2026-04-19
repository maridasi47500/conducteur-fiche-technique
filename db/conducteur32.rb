# seeds.rb - Projet "I.A. Intelligence Artistique"
# Design Fiction : Le voyage d'une IA vers l'âme

# --- INITIALISATION ---
creative_detour = CreativeDetour.find(51)

# 1. STYLES & AMBIANCES (Le spectre de l'exploration)
styles_data = [
  { name: "Jazz Modal", color: "Bleu Minuit", music: "Kind of Blue - Miles Davis" },
  { name: "Rock Progressif", color: "Ambre Brûlé", music: "Echoes - Pink Floyd" },
  { name: "Glitch Hop", color: "Blanc Stroboscopique", music: "Crystalline - Björk" },
  { name: "Classique Minimaliste", color: "Ivoire", music: "Spiegel im Spiegel - Arvo Pärt" },
  { name: "Techno Industrielle", color: "Rouge Laser", music: "Vordhosbn - Aphex Twin" },
  { name: "Folk Organique", color: "Vert Mousse", music: "Holocene - Bon Iver" },
  { name: "Bossa Nova", color: "Jaune Safran", music: "Garota de Ipanema - Stan Getz" },
  { name: "Punk Brut", color: "Magenta Sale", music: "Blitzkrieg Bop - Ramones" },
  { name: "Ambient", color: "Indigo Profond", music: "Music for Airports - Brian Eno" },
  { name: "Cyber-Opera", color: "Cyan Électrique", music: "Composition IA #001" }
]

all_styles = []
styles_data.each do |data|
  s = Style.create!(name: data[:name])
  all_styles << s
  AmbianceOption.create!(style: s, category: "lumieres", value: data[:color])
  AmbianceOption.create!(style: s, category: "machine_brouillard", value: rand(0..1) == 0 ? "léger" : "dense")
  creative_detour.styles << s
end

# 2. INSPIRATION & NOTES (La graine du voyage)
inspi = InspirationResource.create!(
  title: "Voyage à Tokyo - Shinjuku Crossing",
  url: "https://maps.google.com/tokyo",
  category: "Voyage International"
)
creative_detour.inspiration_resources << inspi

note = ArtisticNote.create!(
  title: "L'IA regarde la foule",
  content: "Je vois 3000 vecteurs de mouvement. L'humain appelle cela de la solitude."
)
creative_detour.artistic_notes << note

# 3. FICHE TECHNIQUE & PROJET
fiche = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique",
  date: "2026-04-19",
  eleve_responsable: "Unité 01 / Humain Alpha",
  professeur_referent: "L'Algorithme Miroir"
)
creative_detour.fiche_techniques << fiche

projet = ProjetArtistique.create!(
  title: "La Recherche du Style",
  fiche_technique_id: fiche.id,
  status: "En cours de calcul émotionnel"
)

conducteur = Conducteur.create!(
  fiche_technique_id: fiche.id,
  title: "Partition du Glitch Final",
  notes: "20 minutes pour apprendre à aimer."
)
projet.update(conducteur_id: conducteur.id)
creative_detour.conducteurs << conducteur

# 4. SEQUENCE TEMPLATES (Les briques de construction)
metiers = ["Violoniste", "Danseur", "IA-Synth"]
all_styles.each do |style|
  metiers.each do |m|
    SequenceTemplate.create!(label: "Intro: #{style.name}", phase: "intro", target_talent: m, style: style)
    SequenceTemplate.create!(label: "Cœur: #{style.name}", phase: "body", target_talent: m, style: style)
    SequenceTemplate.create!(label: "Sortie: #{style.name}", phase: "outro", target_talent: m, style: style)
  end
end

# 5. GÉNÉRATION DES CONDUCTEURLINES (20 minutes)
# Chaque ligne simule un sens mécanique vs humain
lignes_a_creer = 15
lignes_a_creer.times do |i|
  style_actuel = all_styles[i % all_styles.length]
  
  # Design Fiction: Alternance IA / Humain
  is_ai_scene = i.even?
  
  line = Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: (i + 1).to_s,
    duree: "00:01:20",
    sequenceaction: is_ai_scene ? "Analyse spectrale du style #{style_actuel.name}" : "Interprétation organique du silence",
    interpretes: metiers.sample,
    lumieres_ambiante: style_actuel.ambiance_options.first.value,
    son: is_ai_scene ? styles_data[i % 10][:music] : "Souffle humain et bois du violon",
    videoprojection: is_ai_scene ? "Flux de données binaire" : "Plan de la ville de Lyon, l'école de musique",
    notes_artistique: is_ai_scene ? "Précision: 99.8%" : "Frisson épidermique détecté",
    creative_notes: "Sens: Photoréception (Machine) vs Neuroception (Humain). L'IA voit les lux, l'humain ressent l'oppression."
  )
end

# Ajout des lignes spécifiques demandées
Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "16",
  duree: "00:01:00",
  sequenceaction: "Technique Vibrato / Passe-passe",
  son: "Vibrato mécanique parfait",
  videoprojection: "Post Facebook: Je quitte Tokyo pour Paris. Je cherche mon cœur.",
  creative_notes: "Chronoception: Le métronome de l'IA ne comprend pas l'hésitation humaine."
)

Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "17",
  duree: "00:01:00",
  sequenceaction: "Violon: Pizzicato main gauche & Spiccato",
  son: "Captation radio: interférences de voyage",
  videoprojection: "Artistic Process: Déconstruction de la gamme"
)

# La découverte du style (L'IA choisit le Glitch Folk)
Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "18",
  duree: "00:01:00",
  sequenceaction: "L'IA trouve son style : GLITCH FOLK",
  son: "Mélange de bruits de processeur et de guitare acoustique",
  videoprojection: "Plan du ciel de nuit sur l'école de musique"
)

# Fin du spectacle : Le blanc
Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "19",
  duree: "00:00:30",
  sequenceaction: "Le départ",
  son: "Son blanc du violon électrique branché... puis silence.",
  videoprojection: "Post Facebook final: J'ai déménagé. Je ne calcule plus, je suis.",
  notes_artistique: "Dernier sens: Agency (L'IA choisit de s'éteindre)."
)

# 6. ANALYSE & ÉCART (The Gap)
interp = Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Signal 440Hz, amplitude constante, durée 3.4s.",
  human_judgment: "Une mélancolie soudaine, comme une fin d'été.",
  the_gap: "L'IA mesure l'onde, l'humain mesure la perte.",
  artistic_truth: "La beauté réside dans l'imperfection du signal."
)
creative_detour.interpretations << interp

gap = ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "L'algorithme a tenté de cloner Miles Davis.",
  interpretation: "L'auditeur a pleuré non pas sur les notes, mais sur l'espace entre elles.",
  response: "Réduire le gain, augmenter l'empathie."
)
creative_detour.share_your_gaps << gap

# 7. LIMITES & PROCESSUS
limit = ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  emotional_truth: "L'IA ne peut pas ressentir la peur de mourir sur scène.",
  why_untranslatable: "Le code est éternel, l'émotion est éphémère."
)
creative_detour.artistic_limits << limit

process = ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Générer la musique parfaite.",
  breakthrough: "Accepter le glitch comme une signature.",
  final_form: "Un conducteur mi-écrit, mi-rêvé."
)
creative_detour.artistic_processes << process

# 8. MATÉRIEL & ZONES
zone = Zone.create!(name: "Centre Scène - Le Cœur", y_min: 0, y_max: 10)
creative_detour.zones << zone

mat = Materiel.create!(name: "Violon Électrique", maximum: 1, zone_id: zone.id, category: "Instrument")
creative_detour.materiels << mat

# Liaison des thèmes
theme = StageTheme.create!(name: "La Peur du Vide Numérique")
creative_detour.stage_themes << theme

# Liaison des marqueurs émotionnels
marker = EmotionalMarker.create!(name: "Frisson")
creative_detour.emotional_markers << marker

# Finalisation du CreativeDetour (HABTM Check)
puts "Seed terminée. CreativeDetour 51 lié à #{creative_detour.conducteurs.count} conducteur et #{creative_detour.styles.count} styles."
