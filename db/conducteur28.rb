# seeds.rb - Projet "I.A. Intelligence Artistique"
# Correction de l'erreur NoMethodError sur Hash

# 1. RÉCUPÉRATION DU DÉTOUR CRÉATIF
detour = CreativeDetour.find(46)

# 2. INSPIRATION_RESOURCES
res_grain = InspirationResource.create!(
  title: "Le Manifeste de l'Intelligence Artistique",
  url: "https://ia-art.org/voyage-musical",
  category: "Philosophie de l'IA"
)

# 3. ARTISTIC_NOTES
note_brute = ArtisticNote.create!(
  title: "L'oreille n'est pas un micro",
  content: "L'IA mesure des décibels, l'humain perçoit des souvenirs. Le projet doit montrer cet écart."
)

# 4. SÉLECTION DES 10 STYLES (Utilisation de symboles pour éviter l'erreur NoMethod)
styles_data = [
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
styles_data.each do |s|
  # Correction ici : s[:name] au lieu de s.name
  style = Style.create!(name: s[:name])
  AmbianceOption.create!(style: style, category: "musique", value: s[:song])
  AmbianceOption.create!(style: style, category: "lumieres", value: s[:light])
  AmbianceOption.create!(style: style, category: "machine_brouillard", value: "Densité 15%")
  created_styles << style
end

# 5. SEQUENCE_TEMPLATES
created_styles.each do |style|
  SequenceTemplate.create!(style: style, phase: "intro", target_talent: "Violoniste", label: "Découverte : #{style.name}")
  SequenceTemplate.create!(style: style, phase: "body", target_talent: "Violoniste", label: "Improvisation sur #{style.name}")
  SequenceTemplate.create!(style: style, phase: "outro", target_talent: "Violoniste", label: "Glitch de sortie : #{style.name}")
end

# 6. CRÉATION DU CONDUCTEUR (20 MINUTES)
fiche = FicheTechnique.create!(name_event: "Voyage Musical IA 46", date: "17-04-2026", eleve_responsable: "Gemini", professeur_referent: "L'Âme")
conducteur = Conducteur.create!(fiche_technique_id: fiche.id.to_s, title: "L'Intelligence du Cœur")

ordre_total = 1

# Ligne 1 : Note artistique en vidéo-projection
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s, ordre: ordre_total.to_s, duree: "00:01:00",
  sequenceaction: "Initialisation", videoprojection: "NOTE ARTISTIQUE : " + note_brute.content,
  son: "Bruit de démarrage", lumieres_ambiante: "Noir"
)
ordre_total += 1

# Lignes 2-11 : IA explore les styles
created_styles.each do |st|
  ["intro", "body", "outro"].each do |phase|
    temp = SequenceTemplate.find_by(style: st, phase: phase)
    Conducteurline.create!(
      conducteur_id: conducteur.id.to_s, ordre: ordre_total.to_s,
      sequenceaction: temp.label, interpretes: "Violoniste",
      lumieres_ambiante: st.ambiance_options.find_by(category: "lumieres").value,
      son: st.ambiance_options.find_by(category: "musique").value,
      duree: "00:00:20",
      creative_notes: "Sens : Audition. L'IA analyse le spectre, l'humain ressent le timbre."
    )
    ordre_total += 1
  end
end

# Ligne Spécifique : Plan de la ville
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s, ordre: ordre_total.to_s, duree: "00:01:00",
  sequenceaction: "Transition Urbaine", 
  son: "Forêt tropicale sous la pluie (Son Naturel)",
  videoprojection: "Plan de la ville le jour (École de Musique)",
  creative_notes: "Sens : Thermoception (Chaleur humide)."
)
ordre_total += 1

# Lignes Techniques Violon (Les 23 Sens)
[
  { act: "Vibrato serré", sense: "Kinesthésie (Effort musculaire)" },
  { act: "Harmoniques", sense: "Proprioception (Position spatiale)" },
  { act: "Pizzicato", sense: "Mécanoception (Tactile)" }
].each do |t|
  Conducteurline.create!(
    conducteur_id: conducteur.id.to_s, ordre: ordre_total.to_s, duree: "00:01:00",
    sequenceaction: t[:act], son: "Violon acoustique",
    creative_notes: "L'IA ne possède pas : " + t[:sense]
  )
  ordre_total += 1
end

# Ligne Finale : Son blanc et coupure
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s, ordre: ordre_total.to_s, duree: "00:00:30",
  sequenceaction: "Déménagement", 
  videoprojection: "Post Facebook : 'Je change de vie.'",
  son: "Son blanc violon électrique", notes_artistique: "Coupure finale."
)

# 7. ANALYSE (INTERPRETATIONS & GAPS)
interp = Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Signal 440Hz constant (1).",
  human_judgment: "Une solitude électrique avant le départ.",
  artistic_truth: "L'IA voit du courant, l'humain voit un adieu."
)

gap = ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "L'IA recalcule, l'humain ressent.",
  response: "L'art réside dans l'imperfection."
)

# 8. RELATIONS HABTM (Lien avec le Détour 46)
detour.artistic_notes << note_brute
detour.styles << created_styles
detour.conducteurs << conducteur
detour.interpretations << interp
detour.share_your_gaps << gap
detour.inspiration_resources << res_grain

puts "Seeds 46 terminées : 20 minutes de conducteur générées sans erreur."
