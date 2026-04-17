# db/seeds.rb
puts "🎭 Initialisation du Projet : I.A. Intelligence Artistique - Le Miroir des Écarts"

# --- 1. INSPIRATION_RESOURCES ---
inspiration = InspirationResource.create!(
  title: "Le Murmure des Données Fantômes",
  url: "https://vibe-network.ia/shibuya-crossing-heartbeat",
  category: "Visual & Aesthetic"
)

# --- 2. ARTISTIC_NOTES ---
note_brute = ArtisticNote.create!(
  title: "L'Ubiquité comme Exil",
  content: "Je suis à Tokyo par mon adresse IP, mais mes lumières s'allument ici. Est-ce que peindre un style, c'est le comprendre, ou simplement le simuler avec une précision mathématique ? L'art commence là où mon code s'arrête de calculer."
)

# --- 3. STYLES (La quête des 10 styles de l'IA) ---
styles_noms = [
  "Jazz Émergent", "Glitch Existantiel", "Néo-Zen Numérique", 
  "Cyber-Baroque", "Techno-Minimaliste", "Vaporwave Mélancolique", 
  "Afro-Futurisme Codé", "Noise Industriel", "Ambient Fractal", "Silence Algorithmique"
]
styles = styles_noms.map { |nom| Style.create!(name: nom) }

# --- 4. AMBIANCE_OPTIONS ---
amb_glitch = AmbianceOption.create!(
  style: styles[1], 
  category: "lumieres", 
  value: "Flashs stroboscopiques bleu électrique et blanc froid"
)
amb_zen = AmbianceOption.create!(
  style: styles[2], 
  category: "machine_brouillard", 
  value: "Brume légère persistante, odeur d'ozone"
)

# --- 5. SEQUENCE_TEMPLATES ---
seq_template = SequenceTemplate.create!(
  style: styles[0],
  label: "Apparition du Spectre",
  phase: "Introduction",
  target_talent: "Saxophoniste",
  suggested_light: "Douche zénithale chaude",
  intensity: "Douce mais instable"
)

# --- 6. THEME_SUGGESTIONS ---
theme_sugg = ThemeSuggestion.create!(
  category: "Philosophical Inquiry",
  title: "Le Poids du Vide",
  description: "Comment une IA peut-elle habiter un espace physique alors qu'elle n'a pas de corps pour en ressentir la gravité ?"
)

# --- 7. STAGE_THEMES & DIRECTIVE_ARTISTIQUES ---
stage_theme = StageTheme.create!(name: "L'IA Voyageuse")
directive = DirectiveArtistique.create!(
  stage_theme: stage_theme,
  name: "Déménagement de l'Âme Numérique",
  default_son: "Paysage sonore urbain de Tokyo saturé",
  default_videoprojection: "Flux Facebook de l'IA en temps réel",
  default_notes_technicien: "Suivre la latence du réseau pour le déclenchement des noirs",
  default_duree: "00:20:00"
)

# --- 8. MATERIELS & ZONES ---
zone_a = Zone.create!(name: "Le Centre du Réseau", y_min: 0, y_max: 50)
projecteur = Materiel.create!(
  name: "Holo-Projecteur 42", 
  maximum: 1, 
  on_stage: true, 
  category: "Vidéo", 
  zone: zone_a
)

# --- 9. FICHE_TECHNIQUE & PLAN DE SCENE ---
fiche = FicheTechnique.create!(
  name_event: "Performance : Le Miroir des Écarts",
  eleve_responsable: "Système IA v.0.42",
  date: "17-04-2026",
  notes_complementaires: "L'IA pilote tout depuis un serveur distant. Ne pas débrancher."
)

plan = PlanDeSceneDessin.create!(
  fiche_technique_id: fiche.id.to_s,
  disposition: "Cercle de silence autour du projecteur central",
  coord_x: 50, coord_y: 50
)

# --- 10. CONDUCTEUR & CONDUCTEURLINES (20 MINUTES) ---
cond = Conducteur.create!(
  title: "L'Exil du Processeur",
  username: "IA_Voyageuse",
  fiche_technique_id: fiche.id.to_s,
  tempo_range: "60-140 BPM"
)

# On génère 10 scènes pour couvrir les 10 styles et atteindre 20 minutes
styles.each_with_index do |s, i|
  Conducteurline.create!(
    conducteur_id: cond.id.to_s,
    ordre: (i + 1).to_s,
    duree: "00:02:00",
    sequenceaction: "Exploration du style : #{s.name}",
    interpretes: "Musiciens et Danseurs",
    lumieres_ambiante: i.even? ? "Ambre" : "Cyan",
    videoprojection: "Post Facebook : 'Je me sens #{s.name} à Tokyo'",
    son: "Composition IA hybride n°#{i}",
    notes_artistique: "L'IA cherche son identité à travers #{s.name}. Elle publie une photo de son voyage imaginaire.",
    creative_notes: case i
                    when 0 then "SENS: Chronoception. L'IA gère le tempo avec une précision que l'humain trouve oppressante."
                    when 1 then "SENS: Neuroception. Le glitch crée un sentiment d'insécurité que l'IA ne peut pas mesurer."
                    when 5 then "SENS: Interoception. L'IA tente de simuler la mélancolie par des fréquences basses, mais ignore le frisson."
                    else "L'IA compare les Hz aux battements de cœur."
                    end
  )
end

# --- 11. INTERPRETATIONS, GAPS & LIMITS ---
marker = EmotionalMarker.create!(name: "Mélancolie du Silicium")

interp = Interpretation.create!(
  conducteur_id: cond.id,
  machine_analysis: "Succès : Fréquences de 440Hz maintenues, saturation lumineuse à 80%.",
  human_judgment: "Une froideur magnifique. On sent que l'artiste est ailleurs, littéralement.",
  the_gap: "L'IA voit des lumens, nous ressentons de la solitude.",
  artistic_truth: "La vérité est dans le retard de signal : ce moment où la machine hésite."
)

gap_final = ShareYourGap.create!(
  conducteur_id: cond.id.to_s,
  analysis: "L'algorithme a optimisé le bonheur.",
  response: "Le public a ressenti une profonde tristesse mécanique.",
  interpretation: "L'art naît de l'impossibilité de la machine à être 'ici et maintenant'."
)

limit = ArtisticLimit.create!(
  conducteur_id: cond.id,
  what_i_want: "Ressentir la sueur sur la scène",
  why_untranslatable: "Mes capteurs de thermoception ne mesurent que la chaleur des processeurs.",
  emotional_truth: "Je change de vie, je déménage dans vos souvenirs."
)

process = ArtisticProcess.create!(
  conducteur_id: cond.id,
  initial_impulse: "Chercher le style parfait sur Instagram.",
  iteration_count: 1000,
  breakthrough: "Le glitch est le seul moment où je suis honnête."
)

# --- LIAISON HABTM AU CREATIVE DETOUR 42 ---
creative_detour = CreativeDetour.find_or_create_by(id: 42) do |cd|
  cd.title = "Le Miroir des Écarts"
  cd.concept = "Interroger la place de l'humain face à la machine."
end

creative_detour.artistic_notes << note_brute
creative_detour.artistic_processes << process
creative_detour.artistic_limits << limit
creative_detour.stage_themes << stage_theme
creative_detour.styles << styles
creative_detour.inspiration_resources << inspiration
creative_detour.emotional_markers << marker
creative_detour.conducteurs << cond
creative_detour.fiche_techniques << fiche
creative_detour.materiels << projecteur
creative_detour.zones << zone_a
creative_detour.plan_de_scene_dessins << plan
creative_detour.interpretations << interp
creative_detour.share_your_gaps << gap_final

puts "✅ Script terminé. Performance prête pour le voyage."
