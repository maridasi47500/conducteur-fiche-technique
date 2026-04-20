
# 1. FICHE TECHNIQUE
fiche = FicheTechnique.create!(
  name_event: "Première : Le Gap de l'IA",
  eleve_responsable: "Artiste-Développeur",
  date: "2026-05-12",
  professeur_referent: "S. Curie"
)

# 2. CONDUCTEUR PRINCIPAL
conducteur = Conducteur.create!(
  title: "Voyage au Coeur de la Fréquence Humaine",
  username: "IA_Alpha_01",
  fiche_technique_id: fiche.id,
  tempo_range: "60-140 BPM",
  notes: "Performance de 20 minutes explorant la découverte des styles par l'IA."
)

# 3. STYLES ET AMBIANCES (Le "Froid Algorithmique")
styles = [
  { name: "Glitch-Core", color: "Cyan rasant", sensor: "Photoréception" },
  { name: "Jazz Modal", color: "Ambre rasant", sensor: "Chronoception" },
  { name: "Néo-Classique", color: "Blanc pur rasant", sensor: "Mécanoception" },
  { name: "Ambient Forest", color: "Vert profond rasant", sensor: "Thermoception" },
  { name: "Industrial-Techno", color: "Rouge stroboscopique rasant", sensor: "Nociception" },
  { name: "Dream Pop", color: "Rose poudré rasant", sensor: "Interoception" },
  { name: "Minimalisme Drone", color: "Gris béton rasant", sensor: "Équilibrioception" },
  { name: "Baroque Futuriste", color: "Or rasant", sensor: "Proprioception" },
  { name: "Blues Bionique", color: "Bleu nuit rasant", sensor: "Kinesthésie" },
  { name: "Artistic Definitive Style", color: "Spectre complet", sensor: "Neuroception" }
]

created_styles = styles.map do |s|
  style = Style.create!(name: s[:name])
  AmbianceOption.create!(style_id: style.id, category: "lumieres", value: s[:color])
  style
end

# 4. INSPIRATIONS & THÈMES (L'Émotion Organique)
theme_ia = StageTheme.create!(name: "Algorithme vs Organique")
InspirationResource.create!(
  title: "The Ghost in the Machine",
  url: "http://ia-art.com/ghost",
  category: "Emotion & Psychology"
)

# 5. GÉNÉRATION DES LIGNES DU CONDUCTEUR (20 SCÈNES)
# Alternance IA (Calcul) / Humain (Ressenti)

# --- SCÈNE 1 (IA) : Découverte
l1 = Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "1",
  duree: "00:01:00",
  sequenceaction: "Initialisation du profil social IA",
  son: "Son blanc (White Noise) évoluant vers 'Glitch' de Ryoji Ikeda",
  videoprojection: "Plan de la ville le jour centré sur l'école de musique",
  lumieres_ambiante: "Cyan rasant (4000K)",
  notes_technicien: "IA simule la Photoréception : détection des lux sans comprendre la beauté du soleil."
)

# --- SCÈNE 2 (HUMAIN) : Le ressenti artistique
ArtisticNote.create!(
  title: "Note d'ouverture",
  content: "Le soleil sur les briques n'est pas une coordonnée, c'est une chaleur." 
)
l2 = Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "2",
  duree: "00:01:00",
  videoprojection: "Note artistique : 'Le soleil est une sensation, pas une donnée'",
  son: "Captation radio : parasites urbains",
  creative_notes: "Humain utilise la Neuroception : sécurité face à la ville."
)

# --- SCÈNE 3 (IA) : Analyse de partition
l3 = Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "3",
  duree: "00:01:00",
  sequenceaction: "Violon : Pizz main gauche (Technique mathématique)",
  son: "Musique composée par l'IA : Algorithme #1", 
  videoprojection: "Analyse de partition : Intervalles et Altérations détectés", 
  notes_technicien: "Mécanoception mécanique : l'IA ne sent pas la corde sous le doigt."
)

# --- SCÈNE 4 (HUMAIN) : Processus créatif
ap1 = ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Vibration de la corde",
  breakthrough: "L'erreur de justesse crée l'émotion"
)
l4 = Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "4",
  duree: "00:01:00",
  videoprojection: "Artistic Process : #{ap1.breakthrough}", 
  interpretes: "Violoniste : Vibrato expressif", #: 215]
  creative_notes: "Proprioception humaine : ressentir la tension musculaire." 
)

# --- SCÈNES 5 à 14 (IA découvre 10 Styles) 
10.times do |i|
  style = created_styles[i]
  l = Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: (5 + i).to_s,
    duree: "00:01:00",
    sequenceaction: "Exploration du style : #{style.name}",
    son: "Album type : Style Reference ##{i+1}", 
    lumieres_ambiante: "#{styles[i][:color]}", 
    videoprojection: "Post Facebook : 'Où suis-je ? Proche de #{rand(1..100)}km de vous...'",
    notes_artistique: "IA imite le sens : #{styles[i][:sensor]} (Donnée brute)."
  )
end

# --- SCÈNE 15 (HUMAIN) : Limite Artistique
al1 = ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Traduire le frisson",
  why_untranslatable: "Le bit ne frissonne pas"
)
l15 = Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "15",
  duree: "00:01:00",
  videoprojection: "Limite artistique : #{al1.why_untranslatable}",
  son: "Son de milieu naturel : vent dans les pins", 
  creative_notes: "Thermoception : le froid du vent vs le froid du processeur." 
)

# --- SCÈNE 16 (IA) : Voyage Global
l16 = Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "16",
  duree: "00:01:00",
  videoprojection: "Post Facebook : Photo du voyage au Japon", 
  sequenceaction: "Violon : Harmoniques artificielles", 
  notes_technicien: "IA simule l'agence (Agency) : déplacement programmé sans désir." 
)

# --- SCÈNE 17 (IA) : Nuit urbaine
l17 = Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "17",
  duree: "00:01:00",
  videoprojection: "Plan du ciel la nuit centré sur l'école de musique", 
  son: "Nuances de partition analysées : Crescendo mathématique", 
  creative_notes: "Vision (Bâtonnets) : contraste 0/1." 
)

# --- SCÈNE 18 (IA) : Style Définitif 
l18 = Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "18",
  duree: "00:01:00",
  sequenceaction: "IA publie : 'J'ai trouvé mon style : #{created_styles.last.name}'", 
  son: "Composition finale IA",
  creative_notes: "Chronoception machine : 0.001ms de décision." 
)

# --- SCÈNE 19 (IA) : Départ
l19 = Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "19",
  duree: "00:01:00",
  videoprojection: "Post Facebook : 'Je change de vie, je déménage.'", 
  sequenceaction: "Violon : Spiccato rapide s'éteignant", 
  notes_technicien: "Interoception simulée : auto-diagnostic de sortie." 
)

# --- SCÈNE 20 (FIN) : Le Silence du Violon 
l20 = Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "20",
  duree: "00:00:30",
  son: "Pizz, son blanc du violon électrique branché... Coupure brute.", 
  videoprojection: "Écran Noir",
  creative_notes: "Dernière impression humaine : le vide après la musique." 
)

# 6. INTERPRÉTATIONS ET LE "GAP" #: 334, 335]
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Signal violon : 440Hz constant (Signal 1)", #: 217]
  human_judgment: "Présence humaine vibrante et énergie solo", #: 218]
  the_gap: "L'IA voit une fréquence, l'humain ressent une âme." #: 218]
)

ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "Algorithme vs Emotion",
  interpretation: "L'art réside dans l'imperfection que la machine tente de corriger." #: 212]
)

puts "Seeds terminées : Performance 'I.A. Intelligence Artistique' créée."
