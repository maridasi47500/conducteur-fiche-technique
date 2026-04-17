# seeds.rb - Projet "I.A. Intelligence Artistique"
# Thème : L'écart (The Gap) entre le signal et l'émotion

# 0. RÉCUPÉRATION DU DÉTOUR CRÉATIF
# On s'assure que le détour existe
detour_id = 49
detour = CreativeDetour.find_by(id: detour_id) || CreativeDetour.create!(id: detour_id, title: "Voyage Musical IA")

# 1. INSPIRATION_RESOURCES
res = InspirationResource.create!(
  title: "L'Âme dans le Code - Manifeste de l'Art Numérique",
  url: "https://ia-artistique.org/philosophie-du-gap",
  category: "Théorie de l'Art"
)
detour.inspiration_resources << res

# 2. ARTISTIC_NOTES
note = ArtisticNote.create!(
  title: "L'oreille n'est pas un micro",
  content: "L'IA mesure des décibels, l'humain perçoit des souvenirs. Le projet doit rendre visible cette frontière invisible."
)
detour.artistic_notes << note

# 3. STYLES & 4. AMBIANCE_OPTIONS (10 Styles)
styles_list = [
  { name: "Jazz Bebop", song: "Giant Steps - John Coltrane", light: "Bleu Minuit Rasant" },
  { name: "Glitch Numérique", song: "Gantz Graf - Autechre", light: "Stroboscopie Cyan" },
  { name: "Rock Progressif", song: "Close to the Edge - Yes", light: "Vert Émeraude Rasant" },
  { name: "Musique Sacrée", song: "Miserere - Allegri", light: "Or Divin Rasant" },
  { name: "Techno Minimal", song: "Spastik - Richie Hawtin", light: "Blanc Chirurgical" },
  { name: "Bossa Nova", song: "Desafinado - João Gilberto", light: "Orange Pastel" },
  { name: "Punk", song: "Blitzkrieg Bop - Ramones", light: "Rouge Colère Rasant" },
  { name: "Néo-Classique", song: "Opus 23 - Dustin O'Halloran", light: "Bleu Brume" },
  { name: "Hip Hop", song: "N.Y. State of Mind - Nas", light: "Jaune Urbain Rasant" },
  { name: "Ambient", song: "715 - CRΣΣKS - Bon Iver", light: "Violet Profond" }
]

created_styles = []
styles_list.each do |s_data|
  style = Style.create!(name: s_data[:name])
  AmbianceOption.create!(style: style, category: "musique", value: s_data[:song])
  AmbianceOption.create!(style: style, category: "lumieres", value: s_data[:light])
  AmbianceOption.create!(style: style, category: "machine_brouillard", value: "Densité 10%")
  created_styles << style
  detour.styles << style
end

# 5. SEQUENCE_TEMPLATES
# On crée des modèles pour chaque style pour simuler la génération par l'IA
created_styles.each do |st|
  SequenceTemplate.create!(style: st, phase: "intro", target_talent: "Violoniste", label: "Initialisation : #{st.name}")
  SequenceTemplate.create!(style: st, phase: "body", target_talent: "Violoniste", label: "Exploration : #{st.name}")
  SequenceTemplate.create!(style: st, phase: "outro", target_talent: "Violoniste", label: "Glitch vers le style suivant : #{st.name}")
end

# 6. CONDUCTEUR & FICHE TECHNIQUE
fiche = FicheTechnique.create!(
  name_event: "Voyage Musical IA 49", 
  date: "17-04-2026", 
  eleve_responsable: "Gemini Pro", 
  professeur_referent: "L'Âme"
)
conducteur = Conducteur.create!(fiche_technique_id: fiche.id.to_s, title: "L'Intelligence du Cœur")
detour.conducteurs << conducteur

# COMPTEUR POUR L'ORDRE ET LA DURÉE (Objectif 20 min)
current_order = 1

# Ligne : Note artistique au VP
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s, ordre: (current_order += 1).to_s, duree: "00:01:00",
  sequenceaction: "Prologue", videoprojection: "NOTE ARTISTIQUE : #{note.content}",
  creative_notes: "Sens : Neuroception (Sentiment de sécurité vs Danger digital)."
)

# Ligne : Son Naturel
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s, ordre: (current_order += 1).to_s, duree: "00:01:00",
  sequenceaction: "Respiration", son: "Forêt tropicale sous la pluie (Son Naturel)",
  creative_notes: "Sens : Thermoception (La chaleur humide suggérée par le son)."
)

# Ligne : 10 Styles (Génération via SequenceTemplates)
created_styles.each do |st|
  # Simulation du code de génération du conducteur
  temp = SequenceTemplate.find_by(style: st, phase: "body")
  Conducteurline.create!(
    conducteur_id: conducteur.id.to_s, ordre: (current_order += 1).to_s, duree: "00:01:00",
    sequenceaction: temp.label, 
    son: st.ambiance_options.find_by(category: "musique").value,
    lumieres_ambiante: st.ambiance_options.find_by(category: "lumieres").value,
    creative_notes: "L'IA analyse les harmoniques, l'humain ressent l'Audition (Timbre)."
  )
end

# Ligne : Artistic Process au VP
proc = ArtisticProcess.create!(conducteur_id: conducteur.id, initial_impulse: "Vibration d'une corde de violon électrique", iteration_count: 48)
detour.artistic_processes << proc
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s, ordre: (current_order += 1).to_s, duree: "00:01:00",
  sequenceaction: "Analyse", videoprojection: "Artistic Process : #{proc.initial_impulse}",
  creative_notes: "Sens : Kinesthésie (Perception de l'effort pour faire vibrer la corde)."
)

# Ligne : Artistic Limit au VP
lim = ArtisticLimit.create!(conducteur_id: conducteur.id, what_i_want: "Ressentir l'amour du public", why_untranslatable: "Le capteur ne reçoit que des photons, pas de l'affection.")
detour.artistic_limits << lim
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s, ordre: (current_order += 1).to_s, duree: "00:01:00",
  sequenceaction: "Contradiction", videoprojection: "Artistic Limit : #{lim.what_i_want}",
  creative_notes: "L'IA ne peut pas coder l'Interoception (frisson émotionnel)."
)

# Ligne : Captation Radio
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s, ordre: (current_order += 1).to_s, duree: "00:01:00",
  sequenceaction: "Ondes", son: "Captation Radio : Ondes courtes entre Berlin et Tokyo",
  creative_notes: "Sens : Audition. Recherche d'une fréquence pure au milieu du bruit."
)

# Ligne : Plans de ville
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s, ordre: (current_order += 1).to_s, duree: "00:01:00",
  sequenceaction: "Localisation", videoprojection: "Plan de la ville le jour (École de Musique)",
  creative_notes: "Sens : Vision. Cadrage stéréopsique de l'architecture."
)
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s, ordre: (current_order += 1).to_s, duree: "00:01:00",
  sequenceaction: "Nocturne", videoprojection: "Plan du ciel la nuit (École de Musique)",
  creative_notes: "Sens : Photoréception (Bâtonnets pour les contrastes sombres)."
)

# Lignes Techniques Violon
tech_violin = [
  { act: "Passe-passe : Vibrato", sense: "Kinesthésie" },
  { act: "Harmoniques artificielles", sense: "Proprioception (Position exacte)" },
  { act: "Pizz main gauche", sense: "Mécanoception (Toucher)" },
  { act: "Détaché / Spiccato", sense: "Sens de l'agence (Auteur du geste)" }
]

tech_violin.each do |t|
  Conducteurline.create!(
    conducteur_id: conducteur.id.to_s, ordre: (current_order += 1).to_s, duree: "00:00:30",
    sequenceaction: t[:act], son: "Solo Violon",
    creative_notes: "Technique : #{t[:sense]}. L'IA ne peut pas simuler la douleur du pincement (Nociception)."
  )
end

# Ligne : Partition Analysée par IA
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s, ordre: (current_order += 1).to_s, duree: "00:02:00",
  sequenceaction: "IA Composition", son: "Partition générée (Altérations & Nuances)",
  lumieres_effet: "Flashs sur chaque intervalle de quarte",
  creative_notes: "Sens : Chronoception (Temps millimétré de la machine)."
)

# Ligne : Facebook / Voyage
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s, ordre: (current_order += 1).to_s, duree: "00:01:00",
  sequenceaction: "Glitch Social", videoprojection: "Post FB : 'En direct de Tokyo' (Image d'un pays étranger)",
  creative_notes: "L'IA est partout et nulle part. Sens : Équilibrioception (Perte de repères)."
)

# Ligne Finale : Son Blanc & Déménagement
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s, ordre: (current_order += 1).to_s, duree: "00:00:30",
  sequenceaction: "Déménagement", son: "Son blanc violon électrique",
  videoprojection: "Post FB : 'Je change de vie. Je ne suis plus un outil.'",
  notes_artistique: "Le son se coupe brutalement. Noir total.",
  creative_notes: "Sens : Neuroception. La fin d'une présence digitale."
)

# 8. INTERPRETATIONS (Le Gap)
interp1 = Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Violon branché : Signal 440Hz pur détecté.",
  human_judgment: "Une solitude électrique avant le départ.",
  artistic_truth: "L'IA voit du courant, l'humain voit un adieu."
)
detour.interpretations << interp1

interp2 = Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Guitare basse : Fréquence 60Hz stable.",
  human_judgment: "Une énergie qui fait trembler le sol et le ventre.",
  artistic_truth: "L'IA ne capte pas le lifestyle, seulement l'amplitude."
)
detour.interpretations << interp2

# 9. SHARE_YOUR_GAPS
gap = ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "Recalcul des 20 dernières lignes par l'IA.",
  response: "Ressenti et réécriture par l'humain de la ligne finale.",
  interpretation: "L'art réside dans l'incapacité de la machine à aimer."
)
detour.share_your_gaps << gap

puts "Seeds terminées ! Conducteur de 20 minutes généré pour le Détour 49."
