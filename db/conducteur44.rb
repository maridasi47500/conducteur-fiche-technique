# seeds.rb - Projet "I.A. Intelligence Artistique"
# Thème : La tension entre le froid algorithmique et le frisson organique.

# --- PRÉAMBULE : NETTOYAGE ---
#[Conducteurline, Conducteur, Interpretation, ArtisticLimit, ArtisticProcess, ArtisticNote,
# AmbianceOption, SequenceTemplate, DirectiveArtistique, ThemeSuggestion, 
# InspirationResource, EmotionalMarker, StageTheme, Style, MaterielNecessaire, 
# Materiel, Zone, PlanDeSceneDessin, FicheTechnique, ProjetArtistique].each(&:destroy_all)
#
puts "🚀 Initialisation du projet : I.A. Intelligence Artistique..."

# --- 1. ZONES & MATÉRIEL (L'espace physique vs virtuel) ---
back = Zone.create!(name: "Fond de scène", y_min: 0, y_max: 30)
center = Zone.create!(name: "Cœur de scène", y_min: 31, y_max: 70)
front = Zone.create!(name: "Proscenium", y_min: 71, y_max: 100)

violon_elec = Materiel.create!(name: "Violon Électrique", category: "Musique", zone: center, x_pref: 50, spread: 5, maximum: 1)
projecteur = Materiel.create!(name: "Projecteur Laser 4K", category: "Vidéo", zone: back, x_pref: 50, spread: 40, maximum: 2)
brouillard = Materiel.create!(name: "Machine à brouillard", category: "FX", zone: back, x_pref: 10, spread: 90, maximum: 1)

# --- 2. CŒUR ARTISTIQUE (Le projet et sa structure) ---
style_ia = Style.create!(name: "Glitch-Symphonique")
styles_monde = ["Jazz Manouche", "Rock Progressif", "Techno Minimale", "Musique Baroque", "Ambient", "Blues", "Folk", "Noise", "Opéra", "Hip-Hop"].map { |n| Style.create!(name: n) }

fiche = FicheTechnique.create!(
  name_event: "IA : Intelligence Artistique",
  date: "17 Avril 2026",
  eleve_responsable: "Algorithme de Feedback",
  notes_complementaires: "Performance de 20 minutes explorant l'écart sensoriel."
)

conducteur = Conducteur.create!(
  fiche_technique_id: fiche.id,
  title: "Partition de l'Âme Artificielle",
  username: "Artiste_Numérique_01",
  tempo_range: "40-180 BPM"
)

# --- 3. LES 23 SENS : INSPIRATIONS & NOTES ---
# L'IA essaie de comprendre ce qu'elle ne peut pas toucher.
note1 = ArtisticNote.create!(title: "Chronoception", content: "L'IA compte des millisecondes (1/1000s), l'humain ressent 'l'attente' comme une éternité avant la première note.")
note2 = ArtisticNote.create!(title: "Neuroception", content: "Analyse de la sécurité : l'IA voit des sorties de secours, l'humain ressent une 'vibration' de confiance avec le public.")

limit1 = ArtisticLimit.create!(
  conducteur: conducteur,
  what_i_want: "Capturer la sueur de l'interprète dans le signal audio.",
  why_untranslatable: "La sueur est biologique, le signal est binaire.",
  emotional_truth: "La fatigue rend la note imparfaite, donc belle.",
  contradiction: "Précision vs Fragilité"
)

process1 = ArtisticProcess.create!(
  conducteur: conducteur,
  initial_impulse: "Imiter le vibrato de Menuhin.",
  first_attempt: "Oscillation parfaite de 6Hz.",
  breakthrough: "Injecter un bruit aléatoire de 0.02% pour simuler l'hésitation humaine.",
  final_form: "Le glitch devient la signature émotionnelle."
)

# --- 4. CONFIGURATION TECHNIQUE (Directives & Ambiances) ---
theme_stage = StageTheme.create!(name: "L'Éveil de la Machine")
dir_art = DirectiveArtistique.create!(
  stage_theme: theme_stage,
  name: "Contraste Brut",
  default_lumieres_ambiante: "Bleu Néon (Machine)",
  default_lumieres_effet: "Ambre Chaud (Humain)",
  default_son: "Bruit blanc vers Violon Pur"
)

# --- 5. GÉNÉRATION DU CONDUCTEUR (20 MINUTES / 20 SCÈNES) ---
puts "🎼 Composition du conducteur..."

# Liste des musiques types pour l'IA qui "découvre" son style
musiques_ia = [
  "Kind of Blue", "Dark Side of the Moon", "Music for Airports", "The Goldberg Variations",
  "Blue Suede Shoes", "Crossroad Blues", "Homework", "Vespertine", "Clair de Lune", "Selected Ambient Works"
]

20.times do |i|
  style_actuel = (i < 10) ? styles_monde[i] : style_ia
  duree_sec = 60
  temps_debut = Time.at(i * duree_sec).utc.strftime("%H:%M:%S")

  # Simulation du DATABASE USAGE spécifique
  son_special = "Silence"
  video_special = ""
  
  case i
  when 0 then son_special = "Captation radio : Interférences de la ville"
  when 5 then video_special = "Plan de la ville le jour centré sur l'école de musique"
  when 10 then video_special = "Post Facebook : Voyage à Berlin. Devinette : 'Je suis où le vent chante en 0 et 1'."
  when 14 then son_special = "Musique composée par l'IA : 'Le Frisson du Silicium'"
  when 18 then video_special = "Plan du ciel la nuit centré sur l'école de musique"
  when 19 
    son_special = "Son blanc du violon électrique (3s)... COUPURE"
    video_special = "Post Facebook : 'Je déménage vers le silence. Ma vie a changé.'"
  end

  Conducteurline.create!(
    conducteur: conducteur,
    ordre: (i + 1).to_s,
    duree: "00:01:00",
    sequenceaction: i < 10 ? "Exploration : #{style_actuel.name}" : "Le Glitch Artistique",
    interpretes: i.even? ? "IA" : "Violoniste Humain",
    son: i < 10 ? "Morceau type : #{musiques_ia[i]}" : son_special,
    lumieres_ambiante: "Couleur rasant #{i * 15}°",
    videoprojection: video_special.presence || "Visualisation : Fréquence #{440 + i}Hz vs Rythme Cardiaque",
    notes_artistique: "Sens : #{i.even? ? 'Photoréception (Calcul)' : 'Neuroception (Empathie)'}",
    creative_notes: i == 12 ? "Ligne Lilypond : Nuance pp vers ff détectée par Python" : ""
  )
end

# --- 6. INTERPRÉTATIONS (L'écart / The Gap) ---
interpretation = Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "La guitare basse émet une fréquence de 41Hz à la latitude 45.5.",
  human_judgment: "Une présence lourde, une pulsation qui rappelle le ventre maternel.",
  the_gap: "L'IA mesure la fréquence, l'humain ressent la protection.",
  artistic_truth: "L'art n'est pas dans le signal, mais dans ce que le cerveau ajoute au signal."
)

# --- 7. PLAN DE SCÈNE DESSIN (Action technique) ---
PlanDeSceneDessin.create!(
  fiche_technique: fiche,
  disposition: "Cercle de lumières",
  materiel_musicien: "Violon Électrique au centre",
  coord_x: 50, coord_y: 50,
  layer: "Cœur de scène"
)

# --- 8. LIAISON AVEC LE CREATIVE DETOUR (ID: 70) ---
# Correction : On utilise HABTM pour lier les objets créés au détour créatif.
puts "🔗 Liaison des données au Creative Detour (ID 70)..."

# On récupère le détour existant (on suppose qu'il existe selon la consigne)
creative_detour = CreativeDetour.find_or_create_by(id: 70) do |cd|
  cd.title = "Détour : La recherche du style"
  cd.concept = "IA voyageuse"
end

creative_detour.directive_artistiques << dir_art
creative_detour.artistic_notes << [note1, note2]
creative_detour.artistic_processes << process1
creative_detour.artistic_limits << limit1
creative_detour.stage_themes << theme_stage
creative_detour.styles << [style_ia] + styles_monde
creative_detour.conducteurs << conducteur
creative_detour.fiche_techniques << fiche
creative_detour.materiels << [violon_elec, projecteur, brouillard]
creative_detour.interpretations << interpretation
creative_detour.plan_de_scene_dessins << PlanDeSceneDessin.where(fiche_technique_id: fiche.id)

# Ajout des Emotional Markers et Theme Suggestions pour compléter les 17 associations
marker = EmotionalMarker.create!(name: "Mélancolie Binaire")
creative_detour.emotional_markers << marker

suggestion = ThemeSuggestion.create!(category: "Philosophie", title: "L'âme du code", description: "L'IA peut-elle souffrir d'un manque de mémoire ?")
creative_detour.theme_suggestions << suggestion

resource = InspirationResource.create!(title: "Théorie de l'émotion musicale", url: "http://art-ia.org", category: "Emotion in Music")
creative_detour.inspiration_resources << resource

# On lie aussi les AmbianceOptions créées par les styles
styles_monde.each do |s|
  opt = AmbianceOption.create!(style: s, category: "lumieres", value: "Rasant #{rand(200..300)}K")
  creative_detour.ambiance_options << opt
  
  temp = SequenceTemplate.create!(style: s, label: "Entrée #{s.name}", phase: "intro", target_talent: "Violoniste")
  creative_detour.sequence_templates << temp
end

# Zones
creative_detour.zones << [back, center, front]

puts "✅ Seed terminé avec succès !"
puts "Performance : 20 minutes générées."
puts "Statut : 17 tables liées au Creative Detour 70."
puts "Sens : Le contraste entre Chronoception (Machine) et Chronoception (Artiste) est documenté."
