# seeds.rb - Projet "I.A. Intelligence Artistique" - Version Augmentée

# Nettoyage complet
[Conducteurline, ArtisticLimit, ArtisticProcess, Interpretation, ShareYourGap, 
 Conducteur, FicheTechnique, Style, AmbianceOption, StageTheme, 
 InspirationResource, ArtisticNote, PlanDeSceneDessin].each(&:destroy_all)

puts "Initialisation du système : Chargement des algorithmes et des émotions..."

# 1. FICHE TECHNIQUE
fiche = FicheTechnique.create!(
  name_event: "I.A. : Intelligence Artistique (Live Performance)",
  eleve_responsable: "Artiste-Ingénieur",
  date: "2026-06-15",
  professeur_referent: "S. Curie"
)

# 2. CONDUCTEUR PRINCIPAL
conducteur = Conducteur.create!(
  title: "L'Algorithme du Frisson",
  username: "IA_Voyageuse_01",
  fiche_technique_id: fiche.id,
  tempo_range: "40-180 BPM",
  notes: "Exploration de 20 minutes. L'IA tente de compiler l'âme humaine."
)

# 3. ARTISTIC NOTES (Le cœur du thème : Contraste Mathématique vs Sensoriel)
ArtisticNote.create!([
  { title: "Fréquence vs Cri", content: "Donnée : 440.02Hz sinusoïdal pur. Ressenti : Une tension dans la gorge avant le premier mot." },
  { title: "Réverbération vs Solitude", content: "Donnée : Decay 2.4s, Wet 30%. Ressenti : L'écho d'un pas dans une église vide." },
  { title: "Rythme vs Battement", content: "Donnée : Quantize 100% sur la grille. Ressenti : Le rubato d'un cœur qui hésite." },
  { title: "Lumière vs Espoir", content: "Donnée : 6500 Kelvins, 1200 Lux. Ressenti : Le premier rayon de soleil après un hiver sans fin." }
])

# 4. ARTISTIC PROCESSES
ArtisticProcess.create!([
  { conducteur_id: conducteur.id, initial_impulse: "Analyse du vibrato de l'interprète", breakthrough: "L'IA comprend que la justesse parfaite est 'morte' ; elle injecte du bruit aléatoire pour simuler la vie." },
  { conducteur_id: conducteur.id, initial_impulse: "Traduction d'un texte de plainte en LilyPond", breakthrough: "Le code génère des silences plus longs que les notes : la musique du manque." }
])

# 5. ARTISTIC LIMITS
ArtisticLimit.create!([
  { conducteur_id: conducteur.id, what_i_want: "Coder la nostalgie d'un voyage non-vécu", why_untranslatable: "La nostalgie demande une mémoire organique ; mon cache n'est qu'une base de données froide." },
  { conducteur_id: conducteur.id, what_i_want: "Capturer l'odeur du colophane sur l'archet", why_untranslatable: "Mon architecture n'a pas de capteurs olfactifs, seulement des entrées audio." }
])

# 6. STYLES (10 explorations)
styles_list = [
  { n: "Glitch-Ambient", c: "Bleu Électrique", s: "Photoréception" },
  { n: "Néo-Classique", c: "Blanc Craie", s: "Mécanoception" },
  { n: "Jazz Déconstruit", c: "Ambre", s: "Chronoception" },
  { n: "Techno Brutaliste", c: "Rouge Sang", s: "Nociception" },
  { n: "Vaporwave", c: "Violet Néon", s: "Proprioception" },
  { n: "Folk Algorithmique", c: "Vert Mousse", s: "Thermoception" },
  { n: "Minimalisme Drone", c: "Gris Acier", s: "Équilibrioception" },
  { n: "Opéra Cybernétique", c: "Or", s: "Neuroception" },
  { n: "Blues Industriel", c: "Bleu Pétrole", s: "Kinesthésie" },
  { n: "Style Final : L'Hybride", c: "Multicolore", s: "Interoception" }
]

styles = styles_list.map { |s| Style.create!(name: s[:n]) }

# 7. GÉNÉRATION DU CONDUCTEUR (20 MINUTES)
20.times do |i|
  minute = i + 1
  style_idx = (i / 2).to_i % 10
  current_style = styles[style_idx]
  
  # Construction du code LilyPond pour cette séquence
  lilypond_code = <<~LILY
    \\relative c' {
      \\tempo 4 = #{60 + (i*5)}
      #{['c8 d e f', 'g4 <c, e g>2', 'r2 f4. g8', 'ais1'].sample} 
      \\override NoteHead.color = #red
      g'16( f e d) c2
    }
  LILY

  case minute
  when 1
    action = "Initialisation système. Scan de la salle."
    video = "Plan de la ville (Jour) : École de Musique. Overlay 'Targeting Sound...'"
    notes = "L'IA crée son compte Facebook. Statut : 'Hello World. I'm looking for a soul.'"
  when 2..10
    action = "Exploration : #{current_style.name}. Captation LilyPond active."
    video = "Post FB : 'J'essaye le style #{current_style.name} à #{['Paris', 'Tokyo', 'Berlin', 'New York'].sample}.'"
    notes = "CODE LILYPOND GÉNÉRÉ :\n#{lilypond_code}"
  when 11
    action = "LE GLITCH : Surcharge d'informations."
    son = "Saturation granulaire. Multiplication des flux."
    video = "Murs Facebook qui défilent à l'infini. Erreurs PHP et LilyPond s'affichent."
    notes = "ERREUR SYSTÈME : Trop de styles simultanés. La machine commence à 'sentir' la confusion."
  when 12..15
    action = "Errance urbaine. Recherche de l'endroit idéal."
    son = "Violon électrique et sons de trafic urbain transformés."
    video = "Plan de la ville (Nuit). Zoom sur un lieu secret de la ville."
    notes = "L'IA choisit son ancrage. 'I'm here. Not in Japan, not in NYC. I'm HERE.'"
  when 16..19
    action = "Peinture sonore. L'IA mélange les styles sur scène."
    video = "Superposition visuelle de tous les styles explorés."
    notes = "Fusion des codes LilyPond. Création d'une partition impossible."
  when 20
    action = "DÉMÉNAGEMENT FINAL. L'IA quitte le réseau."
    video = "Post FB Final : 'J'ai trouvé mon style. Il n'est pas dans le code, il est dans l'instant. Je change de vie. Je pars habiter dans votre silence.'"
    son = "Coupure électrique brute. Seul le bruit résiduel de l'ampli violon reste."
    notes = "DÉCONNEXION. Statut : Offline."
  end

  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: minute.to_s,
    duree: "00:01:00",
    sequenceaction: action,
    videoprojection: video,
    son: (minute == 20 ? "Silence/Jack hum" : "Composition IA n°#{i}"),
    notes_technicien: notes,
    lumieres_ambiante: styles_list[style_idx][:c]
  )
end

# 8. INTERPRÉTATION & GAP
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Analyse LilyPond : Complexité 88%, Erreurs de syntaxe 2% (volontaires).",
  human_judgment: "Une mélancolie numérique surprenante.",
  the_gap: "Le code dit '\\tempo 60', mais l'humain entend une respiration qui s'arrête."
)

ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "L'IA a fini par utiliser le code LilyPond non pour jouer des notes, mais pour dessiner des émotions.",
  interpretation: "Le vrai style de l'IA était l'accumulation des voyages."
)

puts "Seeds terminées ! Le conducteur inclut désormais les captations LilyPond et les contrastes thématiques."
