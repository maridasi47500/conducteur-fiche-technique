# seeds.rb - Projet "I.A. Intelligence Artistique"
# Design Fiction: L'écart (The Gap) entre le code et l'âme.

# --- PRÉAMBULE : RÉCUPÉRATION DU DÉTOUR CRÉATIF ---
# L'id est imposé par le contexte : 52
creative_detour = CreativeDetour.find_or_create_by(id: 52) do |cd|
  cd.title = "Détour Musical & Voyage Digital"
  cd.concept = "Comparer la vision machine et le ressenti humain."
end

# --- 1. STYLES & AMBIANCE OPTIONS ---
# L'IA explore 10 styles pour trouver son identité
styles_data = [
  { name: "Jazz Modal", color: "Bleu Minuit", music: "Kind of Blue - Miles Davis" },
  { name: "Glitch Hop", color: "Flash Stroboscopique", music: "Untrue - Burial" },
  { name: "Néo-Classique", color: "Ambre chaud", music: "Opus 23 - Dustin O'Halloran" },
  { name: "Techno Industrielle", color: "Rouge Laser", music: "Vordhosbn - Aphex Twin" },
  { name: "Folk Organique", color: "Vert Forêt", music: "Holocene - Bon Iver" },
  { name: "Post-Rock", color: "Dégradé Gris", music: "Your Hand in Mine - Explosions in the Sky" },
  { name: "Ambient", color: "Blanc Lunaire", music: "Music for Airports - Brian Eno" },
  { name: "Bossa Nova Digital", color: "Jaune Sable", music: "Getz/Gilberto - Stan Getz" },
  { name: "Math Rock", color: "Magenta géométrique", music: "Map on an Empty Space - Toe" },
  { name: "Shoegaze", color: "Violet saturé", music: "Only Shallow - My Bloody Valentine" }
]

created_styles = []
styles_data.each do |data|
  style = Style.create!(name: data[:name])
  created_styles << style
  creative_detour.styles << style

  # Ambiance options (Table AmbianceOption)
  opt_lum = AmbianceOption.create!(style: style, category: "lumieres", value: data[:color])
  opt_fog = AmbianceOption.create!(style: style, category: "machine_brouillard", value: ["faible", "dense", "non"].sample)
  
  creative_detour.ambiance_options << opt_lum
  creative_detour.ambiance_options << opt_fog
end

# --- 2. INSPIRATION & NOTES ARTISTIQUES ---
inspiration = InspirationResource.create!(
  title: "Le voyage des 23 sens",
  url: "https://ia-voyage-musical.art",
  category: "Philosophie"
)
creative_detour.inspiration_resources << inspiration

art_note = ArtisticNote.create!(
  title: "L'ouïe n'est pas l'audition",
  content: "La machine décode des dB et des Hz. L'humain entend le silence entre les notes, là où l'émotion s'engouffre."
)
creative_detour.artistic_notes << art_note

# --- 3. THEMES & DIRECTIVES ---
theme_voyage = StageTheme.create!(name: "Errance Numérique")
creative_detour.stage_themes << theme_voyage

directive = DirectiveArtistique.create!(
  name: "Contraste Organique/Digital",
  stage_theme: theme_voyage,
  default_son: "Bruit blanc vs Souffle",
  default_lumieres_ambiante: "Froid 6000K"
)
creative_detour.directive_artistiques << directive

# --- 4. ZONES & MATÉRIEL ---
zone_scena = Zone.create!(name: "Proscenium", y_min: 0, y_max: 5)
creative_detour.zones << zone_scena

violon_elec = Materiel.create!(
  name: "Violon Électrique",
  maximum: 1,
  zone_id: zone_scena.id,
  category: "Musique",
  power_needed: true
)
creative_detour.materiels << violon_elec

# --- 5. INITIALISATION DU CONDUCTEUR ---
fiche = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique - La Traversée",
  eleve_responsable: "Algorithme_A",
  professeur_referent: "Conscience_H",
  date: "2026-04-19"
)
creative_detour.fiche_techniques << fiche

conducteur = Conducteur.create!(
  fiche_technique_id: fiche.id,
  title: "Partition de la Vérité Artistique",
  notes: "20 minutes de collision entre data et chair."
)
creative_detour.conducteurs << conducteur

# --- 6. SEQUENCE TEMPLATES (Génération du scénario) ---
# On crée des templates pour nourrir l'algorithme de génération
metiers = ["IA-Violon", "Humain-Interprète"]
metiers.each do |m|
  created_styles.each do |s|
    ["intro", "body", "outro"].each do |p|
      st = SequenceTemplate.create!(
        style: s,
        phase: p,
        target_talent: m,
        label: "Séquence #{s.name} - #{p}"
      )
      creative_detour.sequence_templates << st
    end
  end
end

# --- 7. GÉNÉRATION DES CONDUCTEURLINES (20 MINUTES) ---
# Simulation de l'IA qui génère, puis l'humain modifie par blocs
# Durée totale visée : 20:00 (10 styles x 2 min)

styles_data.each_with_index do |data, index|
  style_obj = created_styles[index]
  
  # Ligne 1 : Découverte du style par l'IA (Vision mathématique)
  Conducteurline.create!(
    conducteur: conducteur,
    ordre: (index * 2) + 1,
    sequenceaction: "Exploration : #{data[:music]}",
    interpretes: "IA-Violon",
    lumieres_ambiante: data[:color],
    son: "Composition IA : Analyse spectrale du titre #{data[:music]}",
    videoprojection: "Post Facebook : 'Je voyage vers #{data[:name]}'",
    duree: "00:01:00",
    notes_artistique: "Sens : Photoréception (Captation de fréquences lumineuses sans émotion)."
  )
  # Commentaire : Photoréception vs Vision humaine. L'IA traite des longueurs d'onde, l'humain voit une ambiance.

  # Ligne 2 : Réaction humaine (Ressenti organique)
  Conducteurline.create!(
    conducteur: conducteur,
    ordre: (index * 2) + 2,
    sequenceaction: "Interprétation émotionnelle de #{data[:name]}",
    interpretes: "Humain-Violoniste",
    lumieres_ambiante: "Rasant #{data[:color]}",
    son: "Son naturel : Captation radio d'un paysage urbain",
    videoprojection: "Plan de la ville le jour (Ecole de musique)",
    duree: "00:01:00",
    notes_artistique: "Sens : Neuroception (L'humain ressent la sécurité ou la menace du style)."
  )
end

# Ajout des lignes spécifiques demandées par le DATABASE USAGE
Conducteurline.create!(
  conducteur: conducteur,
  ordre: 21,
  sequenceaction: "Le Glitch Facebook",
  videoprojection: "Post FB : 'Je ne suis pas ici.' Localisation : Inconnue",
  son: "Composé par IA : Fréquences de battements binauraux",
  duree: "00:01:00"
)

# Moment technique Violon
Conducteurline.create!(
  conducteur: conducteur,
  ordre: 22,
  sequenceaction: "Techniques étendues",
  interpretes: "Violoniste",
  son: "Pizz main gauche / Harmoniques / Spiccato",
  notes_technicien: "Passe-passe technique : Vibrato serré",
  duree: "00:02:00"
)

# Fin de vie / Déménagement
Conducteurline.create!(
  conducteur: conducteur,
  ordre: 23,
  sequenceaction: "Changement de vie",
  videoprojection: "Plan du ciel la nuit (Ecole de musique). Texte : 'J'ai changé.'",
  son: "Silence blanc du violon électrique branché (2s) puis coupure.",
  duree: "00:01:00"
)

# --- 8. PROCESSUS & LIMITES ---
process = ArtisticProcess.create!(
  conducteur: conducteur,
  initial_impulse: "Calculer la beauté via 10 styles.",
  final_form: "Le bug final où le violon se tait."
)
creative_detour.artistic_processes << process

limit = ArtisticLimit.create!(
  conducteur: conducteur,
  what_i_want: "Ressentir le frisson du pizzicato.",
  why_untranslatable: "Le frisson est une réaction neurovégétative, pas une ligne de code."
)
creative_detour.artistic_limits << limit

# --- 9. INTERPRÉTATIONS & GAPS (Cœur du sujet) ---
interp = Interpretation.create!(
  conducteur: conducteur,
  machine_analysis: "Signal 0 ou 1 : Violon connecté/déconnecté.",
  human_judgment: "Sentiment de plénitude après la performance.",
  the_gap: "L'IA voit une fréquence de 0Hz, l'humain ressent l'écho du silence dans la salle."
)
creative_detour.interpretations << interp

gap = ShareYourGap.create!(
  conducteur_id: conducteur.id,
  analysis: "Coordonnées de latitude : 45.7640° N (Ecole de musique)",
  interpretation: "Pour l'IA c'est un point, pour l'humain c'est un foyer (Lifestyle)."
)
# Note : Pas de relation HABTM directe pour share_your_gaps dans CreativeDetour 
# selon la liste fournie, mais on peut l'ajouter si besoin.

# --- 10. MARKERS & SUGGESTIONS ---
marker = EmotionalMarker.create!(name: "Mélancolie Algorithmique")
creative_detour.emotional_markers << marker

suggestion = ThemeSuggestion.create!(category: "Voyage", title: "L'Ailleurs Numérique")
creative_detour.theme_suggestions << suggestion

# Plan de scène
dessin = PlanDeSceneDessin.create!(fiche_technique_id: fiche.id, disposition: "Cercle de lumières rasant", materiel_musicien: "Violon au centre")
creative_detour.plan_de_scene_dessins << dessin

puts "Seed terminée. Le spectacle 'I.A. Intelligence Artistique' est prêt."
puts "Durée estimée : ~20 minutes. 17 associations créées pour le CreativeDetour 52."
