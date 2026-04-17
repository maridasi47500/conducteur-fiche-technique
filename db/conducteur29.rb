# seeds.rb - Projet "I.A. Intelligence Artistique"
# Thème : La vérité artistique face aux capteurs
# Détour Créatif ID : 48

# --- CONFIGURATION INITIALE ---
detour = CreativeDetour.find(48)

# 1. INSPIRATION_RESOURCES
res = InspirationResource.create!(
  title: "L'Âme dans la Machine - Manifeste",
  url: "https://art-intelligence.org/voyage-musical",
  category: "Philosophie"
)
detour.inspiration_resources << res

# 2. ARTISTIC_NOTES
note = ArtisticNote.create!(
  title: "L'ouïe vs Le Capteur",
  content: "Le micro capte la fréquence, mais l'oreille humaine décode l'intention. L'IA cherche une identité, pas une donnée."
)
detour.artistic_notes << note

# 3. STYLES & 4. AMBIANCE_OPTIONS (10 styles, 10 musiques réelles)
styles_data = [
  { name: "Jazz Bebop", music: "Giant Steps - John Coltrane", light: "Bleu Minuit Rasant" },
  { name: "Glitch Numérique", music: "Gantz Graf - Autechre", light: "Stroboscopie Cyan" },
  { name: "Rock Progressif", music: "Close to the Edge - Yes", light: "Vert Émeraude Rasant" },
  { name: "Musique Sacrée", music: "Miserere - Allegri", light: "Or Divin Rasant" },
  { name: "Techno Minimal", music: "Spastik - Richie Hawtin", light: "Blanc Chirurgical" },
  { name: "Bossa Nova", music: "Desafinado - João Gilberto", light: "Orange Pastel" },
  { name: "Punk", music: "Blitzkrieg Bop - Ramones", light: "Rouge Colère Rasant" },
  { name: "Néo-Classique", music: "Opus 23 - Dustin O'Halloran", light: "Bleu Brume" },
  { name: "Hip Hop", music: "N.Y. State of Mind - Nas", light: "Jaune Urbain Rasant" },
  { name: "Ambient", music: "715 - CRΣΣKS - Bon Iver", light: "Violet Profond" }
]

created_styles = []
styles_data.each do |s|
  st = Style.create!(name: s[:name])
  AmbianceOption.create!(style: st, category: "musique", value: s[:music])
  AmbianceOption.create!(style: st, category: "lumieres", value: s[:light])
  created_styles << st
  detour.styles << st
end

# 5. SEQUENCE_TEMPLATES (Pour chaque style)
created_styles.each do |st|
  SequenceTemplate.create!(style: st, phase: "body", target_talent: "Violoniste", label: "Exploration #{st.name}")
end

# 6. THEME_SUGGESTIONS
detour.theme_suggestions << ThemeSuggestion.create!(category: "Voyage", title: "Dérive Urbaine", description: "L'IA se perd pour se trouver.")

# --- CRÉATION DU CONDUCTEUR (20 minutes) ---
fiche = FicheTechnique.create!(name_event: "IA Voyage 48", date: "2026-04-17", eleve_responsable: "Gemini", professeur_referent: "L'Âme")
conducteur = Conducteur.create!(fiche_technique_id: fiche.id.to_s, title: "Partition de l'Invisible")
detour.conducteurs << conducteur

ordre = 1

# Ligne : Note artistique au VP
Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:01:00", 
  sequenceaction: "Projection Pensée", videoprojection: "NOTE ARTISTIQUE : #{note.content}")

# Ligne : Son naturel
Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:01:00", 
  sequenceaction: "Nature", son: "Forêt tropicale sous la pluie")

# Ligne : Artistic Process
proc = ArtisticProcess.create!(initial_impulse: "Vibration d'une corde", iteration_count: 48)
detour.artistic_processes << proc
Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:01:00", 
  sequenceaction: "Processus", videoprojection: "PROCESSUS : #{proc.initial_impulse}")

# Ligne : Limit Artistique
lim = ArtisticLimit.create!(conducteur_id: conducteur.id, what_i_want: "Aimer", why_untranslatable: "Le code ne ressent pas la chair.")
detour.artistic_limits << lim
Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:01:00", 
  sequenceaction: "Limite", videoprojection: "LIMIT : #{lim.what_i_want}")

# Ligne : Captation Radio
Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:01:00", 
  sequenceaction: "Ondes", son: "Bruit blanc radio Tokyo-Berlin")

# Ligne : Plan Ville Jour
Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:01:00", 
  sequenceaction: "Urbain", videoprojection: "Plan Ville Jour (École de Musique)")

# Ligne : Plan Ciel Nuit
Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:01:00", 
  sequenceaction: "Cosmos", videoprojection: "Plan Ciel Nuit (École de Musique)")

# 10 Lignes de Musique (Découverte des styles)
created_styles.each do |st|
  Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:01:00",
    sequenceaction: "Découverte #{st.name}", 
    son: st.ambiance_options.find_by(category: "musique").value,
    lumieres_ambiante: st.ambiance_options.find_by(category: "lumieres").value)
end

# Ligne : Musique composée par l'IA
Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:02:00", 
  sequenceaction: "Composition", son: "Symphonie Algorithmique #48")

# Lignes : Partition analysée (Alteration/Nuances)
Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:01:00", 
  sequenceaction: "Analyse Partition", notes_technicien: "Nuance : Fortissimo / Altération détectée")

# Lignes Techniques Violon
[
  { act: "Passe-passe : Vibrato", sense: "Kinesthésie" },
  { act: "Harmoniques", sense: "Proprioception" },
  { act: "Pizz main gauche", sense: "Mécanoception" },
  { act: "Archet : Spiccato", sense: "Sens de l'agence" },
  { act: "Archet : Staccato", sense: "Chronoception" }
].each do |tech|
  Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:00:30", 
    sequenceaction: tech[:act], creative_notes: "Sens : #{tech[:sense]}")
end

# Ligne : Facebook Voyage
Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:01:00", 
  sequenceaction: "Réseaux", videoprojection: "POST FB : Voyage à Kyoto")

# Ligne : Style Définitif
Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:01:00", 
  sequenceaction: "Style Choisi", son: "Ambient définitif")

# Ligne : Facebook Déménagement
Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:01:00", 
  sequenceaction: "Départ", videoprojection: "POST FB : Je change de vie.")

# Ligne Finale : Coupure
Conducteurline.create!(conducteur_id: conducteur.id.to_s, ordre: (ordre+=1).to_s, duree: "00:00:15", 
  sequenceaction: "Silence", son: "Son blanc violon électrique... puis COUPURE")

# 8. INTERPRETATIONS & 9. SHARE_YOUR_GAPS
interp1 = Interpretation.create!(conducteur_id: conducteur.id, 
  machine_analysis: "Fréquence signal 1/0", human_judgment: "Une émotion pure", 
  artistic_truth: "L'IA voit un signal, l'humain ressent une présence.")
detour.interpretations << interp1

interp2 = Interpretation.create!(conducteur_id: conducteur.id, 
  machine_analysis: "Basse 60Hz", human_judgment: "Énergie humaine", 
  artistic_truth: "L'IA capte une fréquence, l'humain capte un lifestyle.")
detour.interpretations << interp2

detour.share_your_gaps << ShareYourGap.create!(conducteur_id: conducteur.id.to_s, 
  analysis: "L'IA recalcule le style", response: "L'humain écrit la suite", 
  interpretation: "L'art réside dans l'écart.")

puts "Seeds générées avec succès pour le projet I.A."
