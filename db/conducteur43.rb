# ============================================
# SEEDS.RB — PARTIE 1 : INITIALISATION
# ============================================

puts "=== RESET DATABASE ==="


puts "Tables vidées."

# ============================================
# CREATION DES 20 STYLES MUSICAUX
# ============================================

style_names = [
  "Jazz", "Rock", "Classical", "Electronic", "Ambient",
  "Hip-Hop", "Baroque", "Metal", "Folk", "House",
  "Techno", "Drum & Bass", "Reggae", "Salsa", "Flamenco",
  "Minimalism", "Glitch", "Lo-Fi", "Contemporary", "Experimental"
]

styles = style_names.map do |name|
  Style.create!(name: name)
end

puts "20 styles créés."

# ============================================
# CREATION DES 20 MUSIQUES REELLES (TITRES + ALBUMS)
# ============================================
# ⚠️ Aucun contenu protégé n’est inclus. Juste titres + albums.

music_catalog = [
  ["So What", "Kind of Blue", "Jazz"],
  ["Paranoid Android", "OK Computer", "Rock"],
  ["Clair de Lune", "Suite Bergamasque", "Classical"],
  ["Windowlicker", "Windowlicker EP", "Electronic"],
  ["An Ending (Ascent)", "Apollo", "Ambient"],
  ["N.Y. State of Mind", "Illmatic", "Hip-Hop"],
  ["Canon in D", "Baroque Favorites", "Baroque"],
  ["Master of Puppets", "Master of Puppets", "Metal"],
  ["Scarborough Fair", "Traditionals", "Folk"],
  ["One More Time", "Discovery", "House"],
  ["The Bells", "The Bells", "Techno"],
  ["Inner City Life", "Timeless", "Drum & Bass"],
  ["No Woman No Cry", "Natty Dread", "Reggae"],
  ["El Cantante", "El Cantante", "Salsa"],
  ["Entre Dos Aguas", "Fuente y Caudal", "Flamenco"],
  ["Music for 18 Musicians", "Music for 18 Musicians", "Minimalism"],
  ["Myriads", "Glitch Studies", "Glitch"],
  ["Luv(sic) pt3", "Modal Soul", "Lo-Fi"],
  ["Atmosphères", "Atmosphères", "Contemporary"],
  ["Pendulum Music", "Pendulum Music", "Experimental"]
]

music_catalog.each do |title, album, style_name|
  style = styles.find { |s| s.name == style_name }
  InspirationResource.create!(
    title: "#{title} — #{album}",
    url: "https://example.com/#{title.parameterize}",
    category: "Music History"
  )
end

puts "20 musiques réelles ajoutées comme InspirationResources."

# ============================================
# AMBIANCE OPTIONS POUR CHAQUE STYLE
# ============================================

styles.each do |style|
  AmbianceOption.create!(
    style: style,
    category: "lumieres",
    value: "Couleur rasant #{['bleu', 'rouge', 'vert', 'ambre', 'violet'].sample}"
  )

  AmbianceOption.create!(
    style: style,
    category: "machine_brouillard",
    value: ["léger", "dense", "absent"].sample
  )

  AmbianceOption.create!(
    style: style,
    category: "musique",
    value: "Preset #{style.name} — IA"
  )
end

puts "AmbianceOptions générées."

# ============================================
# SEQUENCE TEMPLATES POUR CHAQUE STYLE
# ============================================

styles.each do |style|
  SequenceTemplate.create!(
    label: "Entrée #{style.name}",
    phase: "entrée",
    target_talent: "musicien",
    suggested_light: "fade-in #{style.name}",
    intensity: "medium",
    style_id: style.id
  )

  SequenceTemplate.create!(
    label: "Action #{style.name}",
    phase: "action",
    target_talent: "musicien",
    suggested_light: "strobe #{style.name}",
    intensity: "high",
    style_id: style.id
  )

  SequenceTemplate.create!(
    label: "Sortie #{style.name}",
    phase: "sortie",
    target_talent: "musicien",
    suggested_light: "fade-out #{style.name}",
    intensity: "low",
    style_id: style.id
  )
end

puts "SequenceTemplates créés pour chaque style."

puts "=== PARTIE 1 TERMINÉE ==="

