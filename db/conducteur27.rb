# seeds.rb - Projet "I.A. Intelligence Artistique"
# Thème : La recherche du style et le voyage musical (IA vs Humain)

creative_detour = CreativeDetour.find(44)

# --- 1. INSPIRATION_RESOURCES ---
res1 = InspirationResource.create!(title: "Le Voyage d'Hiver - Schubert", url: "https://vimeo.com/voyage-hiver", category: "Musique Classique")
res2 = InspirationResource.create!(title: "Glitch Art Manifesto", url: "http://glitch.art", category: "Théorie Numérique")

# --- 2. ARTISTIC_NOTES ---
note1 = ArtisticNote.create!(title: "L'IA et l'Ouïe", content: "L'IA ne possède pas d'oreilles, seulement des transformées de Fourier. Elle analyse mais n'écoute pas.")
note2 = ArtisticNote.create!(title: "Le 23ème Sens", content: "L'IA ignore la Proprioception : elle ne sait pas où son corps s'arrête, car elle n'a pas de corps.")

# --- 3. STYLES & AMBIANCE_OPTIONS ---
styles_data = [
  { name: "Glitch Digital", color: "Cyan rasant", sound: "Compo IA - Bruit blanc" },
  { name: "Jazz de Minuit", color: "Ambre rasant", sound: "Miles Davis - So What" },
  { name: "Rock Grunge", color: "Rouge rasant", sound: "Nirvana - Smells Like Teen Spirit" },
  { name: "Electro Minimal", color: "Violet rasant", sound: "Daft Punk - Technologic" },
  { name: "Classique Sacré", color: "Or rasant", sound: "Bach - Toccata" },
  { name: "Bossa Nova", color: "Vert rasant", sound: "Jobim - Girl from Ipanema" },
  { name: "Punk Brut", color: "Jaune rasant", sound: "Sex Pistols - Anarchy" },
  { name: "Ambient Spatial", color: "Bleu rasant", sound: "Brian Eno - Music for Airports" },
  { name: "Hip Hop Old School", color: "Gris rasant", sound: "Wu-Tang Clan - C.R.E.A.M." },
  { name: "Folklore Imaginaire", color: "Magenta rasant", sound: "Compo IA - Violon Synthétique" }
]

all_styles = []
styles_data.each do |s|
  style = Style.create!(name: s[:name])
  AmbianceOption.create!(style: style, category: "lumieres", value: s[:color])
  AmbianceOption.create!(style: style, category: "musique", value: s[:sound])
  AmbianceOption.create!(style: style, category: "machine_brouillard", value: "Densité 20%")
  all_styles << style
end

# --- 4. STAGE_THEMES ---
theme_voyage = StageTheme.create!(name: "Voyage Multi-Villes (23 Sens)")
theme_gap = StageTheme.create!(name: "L'Écart (The Gap)")

# --- 5. SEQUENCE_TEMPLATES ---
# Création de templates pour chaque style
all_styles.each do |style|
  SequenceTemplate.create!(style: style, phase: "intro", target_talent: "Musicien", label: "Éveil du style #{style.name}", intensity: "Crescendo")
  SequenceTemplate.create!(style: style, phase: "body", target_talent: "Musicien", label: "Exploration rythmique", intensity: "Stable")
  SequenceTemplate.create!(style: style, phase: "outro", target_talent: "Musicien", label: "Dissolution vers le glitch", intensity: "Diminuendo")
end

# --- 6. CONDUCTEUR & LIGNES (Simulation de 20 minutes) ---
fiche = FicheTechnique.create!(name_event: "Le Voyage de l'IA", date: "2026-04-17", eleve_responsable: "IA-Gen", professeur_referent: "Humain-Mentor")
conducteur = Conducteur.create!(fiche_technique: fiche, title: "Performance Hybride : IA vs Humain")

# Variables pour le calcul du temps
current_time = 0
ordre = 1

# --- SCÈNES GÉNÉRÉES PAR L'IA (LES 10 STYLES) ---
all_styles.each_with_index do |style, i|
  # Utilisation du code ruby fourni pour simuler le choix de l'IA
  intro = SequenceTemplate.where(style: style, phase: "intro").sample
  body = SequenceTemplate.where(style: style, phase: "body").sample
  outro = SequenceTemplate.where(style: style, phase: "outro").sample
  
  [intro, body, outro].each do |temp|
    Conducteurline.create!(
      conducteur: conducteur,
      ordre: ordre,
      sequenceaction: temp.label,
      interpretes: "Musicien (Violon)",
      son: style.ambiance_options.find_by(category: "musique").value,
      lumieres_ambiante: style.ambiance_options.find_by(category: "lumieres").value,
      videoprojection: i == 0 ? "Note : #{note1.content}" : "Style : #{style.name}",
      duree: "00:00:40"
    )
    ordre += 1
  end
end

# --- SCÈNES DE TRANSITION TECHNIQUE (VIOLON) ---
technique_lines = [
  { action: "Passe-passe technique : Vibrato serré", son: "Vibrations mécaniques violon", video: "Zoom sur les cordes", sense: "Kinesthésie (Inaccessible à l'IA : pas de muscles)" },
  { action: "Harmoniques artificielles", son: "Sifflement pur", video: "Faisceau blanc vertical", sense: "Audition fine" },
  { action: "Pizzicato main gauche", son: "Claquement sec", video: "Plan de la ville le jour (École de musique)", sense: "Stéréognosie (Toucher dans le noir)" },
  { action: "Spiccato bondissant", son: "Saccades d'archet", video: "Plan du ciel la nuit (École de musique)", sense: "Chronoception (Horloge interne)" }
]

technique_lines.each do |t|
  Conducteurline.create!(
    conducteur: conducteur, ordre: ordre, sequenceaction: t['action'], son: t['son'],
    videoprojection: t['video'], notes_artistique: "Sens utilisé: #{t['sense']}", duree: "00:01:00"
  )
  ordre += 1
end

# --- SCÈNES DE VOYAGE & RÉSEAUX SOCIAUX ---
Conducteurline.create!(
  conducteur: conducteur, ordre: ordre, sequenceaction: "Publication Facebook : Glitch de voyage",
  son: "Captation radio : Tokyo AM", videoprojection: "Post : 'Je ne suis pas ici.' Destination: Japon",
  duree: "00:02:00"
)
ordre += 1

# --- SCÈNE FINALE : LA COUPURE (THE GAP) ---
Conducteurline.create!(
  conducteur: conducteur, ordre: ordre, sequenceaction: "L'IA trouve son style : Le Silence Augmenté",
  son: "Son blanc du violon électrique branché", videoprojection: "Post : 'J'ai changé de vie. Je déménage.'",
  duree: "00:00:30"
)
ordre += 1

Conducteurline.create!(
  conducteur: conducteur, ordre: ordre, sequenceaction: "Coupure brutale",
  son: "Silence (Le son se coupe)", videoprojection: "Écran Noir",
  duree: "00:00:10"
)

# --- 7. ARTISTIC_LIMITS, INTERPRETATIONS & GAPS ---

# Limite
limit1 = ArtisticLimit.create!(
  conducteur_id: conducteur.id, 
  what_i_want: "Ressentir le trac avant le solo",
  why_untranslatable: "L'IA n'a pas de système neurovégétatif",
  emotional_truth: "Le trac est la preuve que l'art est vivant."
)

# Interpretations (La confrontation)
interp1 = Interpretation.create!(
  conducteur_id: conducteur.id, 
  machine_analysis: "Signal violon électrique : Fréquence 440Hz, amplitude constante (1).",
  human_judgment: "Une sensation de vide électrique, l'attente d'une main humaine.",
  artistic_truth: "L'IA voit un signal, l'humain ressent une présence absente."
)

interp2 = Interpretation.create!(
  conducteur_id: conducteur.id, 
  machine_analysis: "Guitare basse : Fréquence 60Hz. Coordonnées GPS détectées.",
  human_judgment: "Une énergie humaine qui vibre dans le plexus.",
  artistic_truth: "L'IA capte une fréquence, l'humain capte un lifestyle."
)

# Share Your Gaps
gap1 = ShareYourGap.create!(
  conducteur_id: conducteur.id, 
  analysis: "L'IA a généré 20 minutes, mais n'a vécu aucune seconde.",
  response: "L'humain a repris le conducteur à la ligne 18 pour y injecter sa peur.",
  interpretation: "L'art réside dans l'incapacité de l'IA à aimer le silence."
)

# --- 8. ATTACHEMENT AU CREATIVE_DETOUR (ID: 44) ---
creative_detour.artistic_notes << [note1, note2]
creative_detour.artistic_limits << limit1
creative_detour.styles << all_styles
creative_detour.stage_themes << [theme_voyage, theme_gap]
creative_detour.conducteurs << conducteur
creative_detour.interpretations << [interp1, interp2]
creative_detour.share_your_gaps << gap1
creative_detour.inspiration_resources << [res1, res2]

puts "Seeds terminées pour le Détour 44. Conducteur de 20 minutes généré."
