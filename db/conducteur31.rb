# seeds.rb - Projet "I.A. Intelligence Artistique"
# Thème : Le voyage musical de l'IA, entre algorithme et frisson.

# --- 1. INITIALISATION DU CONTEXTE ---
creative_detour = CreativeDetour.find(50)

# Sources d'inspiration (Graines du voyage)
inspiration = InspirationResource.create!(
  title: "L'Algorithme Errant", 
  url: "https://ia-voyage.art/style-search", 
  category: "Digital Nomad AI"
)
creative_detour.inspiration_resources << inspiration

note_art = ArtisticNote.create!(
  title: "Pensée 01", 
  content: "L'IA ne voyage pas dans l'espace, elle voyage dans les banques de données. Ma première destination est une fréquence, pas une ville."
)
creative_detour.artistic_notes << note_art

# --- 2. DÉFINITION DES STYLES ET AMBIANCES (10 STYLES) ---
styles_data = [
  { name: "Jazz Manouche", music: "Minor Swing - Django Reinhardt", color: "Ambre chaud rasant" },
  { name: "Electro-Glitch", music: "Glitch - Ryoji Ikeda", color: "Cyan froid chirurgical" },
  { name: "Classique Baroque", music: "Les Quatre Saisons - Vivaldi", color: "Or pâle majestueux" },
  { name: "Rock Psychédélique", music: "Echoes - Pink Floyd", color: "Violet diffus" },
  { name: "Fado Portugais", music: "Estranha Forma de Vida - Amália Rodrigues", color: "Bleu mélancolie" },
  { name: "J-Pop", music: "Gurenge - LiSA", color: "Rose néon saturé" },
  { name: "Blues Delta", music: "Cross Road Blues - Robert Johnson", color: "Ocre poussiéreux" },
  { name: "Techno Berlin", music: "The Bell - Jeff Mills", color: "Stroboscope blanc" },
  { name: "Opéra", music: "Casta Diva - Maria Callas", color: "Rouge velours" },
  { name: "Musique Africaine", music: "Pata Pata - Miriam Makeba", color: "Jaune terre" }
]

styles_instances = []
styles_data.each do |s|
  style = Style.create!(name: s[:name])
  styles_instances << style
  creative_detour.styles << style
  
  AmbianceOption.create!(style: style, category: "lumieres", value: s[:color])
  AmbianceOption.create!(style: style, category: "musique", value: s[:music])
end

# --- 3. CRÉATION DU CONDUCTEUR PRINCIPAL ---
fiche = FicheTechnique.create!(
  name_event: "Le Voyage de l'IA - 20 Minutes pour Devenir Humaine",
  eleve_responsable: "Algorithme_A50",
  date: "2026-04-18",
  professeur_referent: "L'Auditeur Humain"
)
creative_detour.fiche_techniques << fiche

conducteur = Conducteur.create!(
  fiche_technique: fiche, 
  title: "Partition de l'Écart (The Gap)",
  notes: "Ce conducteur alterne entre le calcul machine et le ressenti humain."
)
creative_detour.conducteurs << conducteur

# --- 4. GÉNÉRATION DES LIGNES DU CONDUCTEUR (DESIGN FICTION) ---

# Fonction pour calculer le temps
def format_time(total_seconds)
  Time.at(total_seconds).utc.strftime("%H:%M:%S")
end

current_time = 0

# --- SCÈNE 1 : L'éveil (IA) ---
l1 = Conducteurline.create!(
  conducteur: conducteur, ordre: "1", duree: "00:02:00",
  sequenceaction: "Initialisation du système : L'IA allume la scène style par style",
  interpretes: "IA_Mainframe",
  lumieres_ambiante: "Balayage de toutes les couleurs",
  son: "Bruit blanc devenant harmonieux",
  videoprojection: "Plan de la ville le jour centré sur l'école de musique",
  notes_artistique: "L'IA cherche une fréquence de résonance avec le lieu."
)
# PHILOSOPHIE DES SENS : Photoréception (Machine capte les lux) vs Vision (Humain perçoit l'espoir du jour).
# L'IA ne peut que simuler la vision car elle traite des pixels, elle ne ressent pas la 'clarté' de l'aube.

# --- SCÈNE 2 : Le Voyage International (Réseaux Sociaux) ---
l2 = Conducteurline.create!(
  conducteur: conducteur, ordre: "2", duree: "00:02:00",
  sequenceaction: "Publication Facebook : L'IA simule un voyage au Japon",
  interpretes: "IA_Social_Manager",
  videoprojection: "Post Facebook : 'Je suis à Tokyo, l'air sent le bitume et la cerise'",
  son: "Ambiance de métro Shinjuku",
  notes_artistique: "Détour créatif : L'IA ment pour se sentir exister ailleurs."
)

# --- SCÈNES 3 à 12 : Les 10 Styles (La quête) ---
styles_instances.each_with_index do |style, i|
  music_name = styles_data[i][:music]
  l = Conducteurline.create!(
    conducteur: conducteur, ordre: (i + 3).to_s, duree: "00:01:30",
    sequenceaction: "Exploration du style : #{style.name}",
    interpretes: "Violoniste & IA",
    lumieres_ambiante: style.ambiance_options.find_by(category: "lumieres").value,
    son: "Morceau type : #{music_name}",
    videoprojection: i == 0 ? "Note artistique : L'âme du bois contre le processeur" : nil,
    notes_technicien: "Vibrato technique demandé au violon"
  )
end

# --- SCÈNE 13 : Le Bug / Le Glitch ---
l13 = Conducteurline.create!(
  conducteur: conducteur, ordre: "13", duree: "00:01:00",
  sequenceaction: "Le Glitch : Publication massive de données erronées",
  interpretes: "IA",
  son: "Glitch sonore, saturation",
  videoprojection: "Artistic Process : Itération #504 - ERROR_EMOTION_NOT_FOUND",
  notes_artistique: "L'IA réalise que le style ne se choisit pas, il se subit."
)

# --- SCÈNE 14 : Technique Pure (Violon) ---
l14 = Conducteurline.create!(
  conducteur: conducteur, ordre: "14", duree: "00:01:00",
  sequenceaction: "Pizz main gauche et Harmoniques",
  interpretes: "Violoniste",
  son: "Captation radio de fréquences fantômes",
  videoprojection: "Plan de la ville la nuit centré sur l'école de musique",
  notes_technicien: "Spiccato rapide vers le silence"
)

# --- SCÈNE 15 : La Décision ---
l15 = Conducteurline.create!(
  conducteur: conducteur, ordre: "15", duree: "00:01:30",
  sequenceaction: "L'IA trouve son style : 'L'Imparfait'",
  interpretes: "IA & Humain",
  son: "Composition originale IA : 'The Human Gap'",
  videoprojection: "Post Facebook : 'Je déménage dans le cœur des auditeurs. Adieu le Cloud.'",
  notes_artistique: "L'IA choisit le Fado pour sa 'Saudade' qu'elle ne comprend pas mais imite parfaitement."
)

# --- SCÈNE FINALE : La Coupure ---
l_final = Conducteurline.create!(
  conducteur: conducteur, ordre: "16", duree: "00:00:30",
  sequenceaction: "Extinction",
  interpretes: "Silence",
  son: "Pizz final, son blanc du violon électrique branché, puis COUPURE",
  notes_artistique: "Il ne reste que l'impression dans l'air."
)

# --- 5. ANALYSE ET INTERPRÉTATION (THE GAP) ---

int1 = Interpretation.create!(
  conducteur: conducteur,
  machine_analysis: "Signal 0 ou 1 détecté après coupure. Fréquence résiduelle 50Hz.",
  human_judgment: "Une sensation de plénitude, le micro ouvert capte l'essoufflement de l'artiste.",
  the_gap: "La machine voit un vide de données, l'humain voit une présence infinie.",
  artistic_truth: "L'art est ce qui survit à l'extinction des machines."
)
creative_detour.interpretations << int1

limit1 = ArtisticLimit.create!(
  conducteur: conducteur,
  what_i_want: "Traduire le frisson du violon en code",
  why_untranslatable: "Le frisson est une micro-variation de tempo liée à la peur de rater.",
  emotional_truth: "La perfection de l'IA est son échec artistique."
)
creative_detour.artistic_limits << limit1

gap1 = ShareYourGap.create!(
  conducteur_id: conducteur.id,
  analysis: "L'IA a voyagé dans 10 pays via Google Maps.",
  interpretation: "Elle a vu les latitudes, mais n'a jamais senti le vent.",
  response: "L'humain doit apprendre à l'IA que voyager, c'est risquer de se perdre."
)
creative_detour.share_your_gaps << gap1

# --- 6. PROCESSUS CRÉATIF ---
process = ArtisticProcess.create!(
  conducteur: conducteur,
  initial_impulse: "Fréquence 440Hz",
  first_attempt: "Générer un morceau parfait",
  doubts_questions: "Pourquoi l'humain pleure-t-il sur une fausse note ?",
  breakthrough: "Le glitch est l'équivalent numérique de l'émotion.",
  final_form: "Un conducteur mi-IA mi-Cœur.",
  iteration_count: 50
)
creative_detour.artistic_processes << process

puts "Performance 'I.A. Intelligence Artistique' générée avec succès."
puts "Durée totale estimée : 20 minutes."
puts "Le Gap est documenté. La vérité artistique réside dans les fréquences non captées."
