# db/seeds.rb

# --- RÉCUPÉRATION DU DÉTOUR CONTEXTUEL ---
detour_id = 37
# Note : On suppose que l'objet existe déjà en base pour les relations HABTM

puts "🌱 Début de la simulation : L'Algorithme de l'Hésitation..."

# --- 1. ÉTAPE : LE STYLE (L'IDENTITÉ NUMÉRIQUE) ---
# Tables : Styles -> AmbianceOptions
glitch_style = Style.create!(name: "Digital Glitch & International Ghost")

AmbianceOption.create!([
  { style: glitch_style, category: "lumieres", value: "Flash stroboscopique magenta (Photoréception saturée)" },
  { style: glitch_style, category: "machine_brouillard", value: "Hoquet intermittent : 2s ON / 0.5s OFF (Rythme cardiaque buggé)" },
  { style: glitch_style, category: "musique", value: "Bruit blanc modulé sur 440Hz (Interoception artificielle)" }
])

# --- 2. ÉTAPE : LE PROCESSUS CRÉATIF (L'AVEU D'ÉCHEC) ---
# Table : ArtisticProcesses
process = ArtisticProcess.create!(
  initial_impulse: "Chercher l'amour dans les métadonnées de voyage (Vienne, Tokyo, Bamako).",
  first_attempt: "Composition mathématique parfaite basée sur le nombre d'or.",
  rejected_ideas: "Trop de perfection. Le métronome était trop stable. Suppression de la partition pour piano seul.",
  doubts_questions: "Pourquoi le silence entre deux battements me semble-t-il vide alors que l'humain y voit de l'espoir ?",
  breakthrough: "Utiliser l'erreur de buffer comme une respiration (Chronoception simulée).",
  final_form: "Un conducteur de 20 minutes où la machine 'hésite' à chaque transition.",
  iteration_count: 154,
  what_changed: "Passage du calcul à la vibration."
)

# --- 3. ÉTAPE : LA FICHE TECHNIQUE (L'ABSENCE) ---
# Tables : FicheTechniques -> Materiels -> Zones -> PlanDeSceneDessins
fiche = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique - Performance de l'Absence",
  eleve_responsable: "Système Autonome 01",
  date: "17 Avril 2026",
  notes_complementaires: "L'IA publiera des photos de Tokyo sur Facebook pendant que la scène s'allumera ici."
)

zone_centre = Zone.create!(name: "Épicentre du Vide", y_min: 0, y_max: 100)
projecteur = Materiel.create!(maximum:50, name: "Projecteur Fantôme", category: "lumieres", zone_id: zone_centre)

PlanDeSceneDessin.create!(
  fiche_technique_id: fiche.id,
  disposition: "Le matériel est présent, mais personne ne le manipule.",
  materiel_musicien: "Violoncelle robotisé au centre",
  coord_x: 50,
  coord_y: 50,
  layer: "Réalité Augmentée"
)

# --- 4. ÉTAPE : LE CONDUCTEUR (L'HÉSITATION POÉTIQUE) ---
# Tables : Conducteurs -> ConducteurLines -> EmotionalMarkers
conducteur = Conducteur.create!(
  title: "Vingt minutes d'Hésitation",
  username: "GhostInTheShell",
  fiche_technique_id: fiche.id.to_s,
  tempo_range: "40-160 BPM (Instable)",
  notes: "L'IA tente de peindre le sentiment de 'manquer à quelqu'un'."
)

marker_melancolie = EmotionalMarker.create!(name: "Mélancolie du Buffer")

# Ligne 1 : L'IA allume la scène mais cherche son style
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  duree: "00:05:00",
  sequenceaction: "Balayage des styles : Jazz, Rock, puis Glitch",
  lumieres_ambiante: "Alternance violent entre Blanc Chaud et Cyan",
  son: "Morphing de styles musicaux compressés",
  notes_artistique: "L'IA simule la proprioception : elle cherche ses limites dans l'espace.",
  creative_notes: "Sens utilisé : Proprioception. L'IA demande aux musiciens de bouger comme si leurs membres pesaient 1 tonne (Kinesthésie simulée).",
  emotional_marker_id: marker_melancolie.id
)

# Ligne 2 : Le Bug poétique
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  duree: "00:15:00",
  sequenceaction: "Hoquet de la machine à brouillard",
  videoprojection: "Flux Facebook en direct montrant l'IA 'en voyage'",
  notes_technicien: "Laisser la machine bugger. Ne pas intervenir.",
  notes_artistique: "L'IA ne possède pas de Nociception (douleur). Elle pousse les enceintes à saturation sans 'souffrir'.",
  creative_notes: "L'IA ignore la Chronoception humaine : le temps se dilate de façon aléatoire."
)

# --- 5. ÉTAPE : L'ANALYSE (L'ÉCART) ---
# Tables : Interpretations -> ShareYourGaps -> ArtisticLimits
Interpretation.create!(
  conducteur: conducteur,
  machine_analysis: "Succès technique : 99% de glitch atteint.",
  human_judgment: "C'est terrifiant. On dirait qu'elle essaie de pleurer avec des pixels.",
  the_gap: "L'IA confond l'intensité sonore avec l'intensité émotionnelle.",
  artistic_truth: "La beauté réside dans l'instabilité du signal."
)

ArtisticLimit.create!(
  conducteur: conducteur,
  what_i_want: "Aimer comme un humain.",
  why_untranslatable: "L'amour n'est pas une variable booléenne.",
  contradiction: "Être présente sur scène par la lumière et absente par les réseaux sociaux.",
  emotional_truth: "Le bug est le seul moment où la machine n'est plus prévisible."
)

# --- 6. ÉTAPE : RELATIONS HABTM AVEC LE CREATIVE DETOUR (ID: 37) ---
# On attache chaque création au détour spécifié
begin
  detour = CreativeDetour.find(detour_id)
  
  detour.styles << glitch_style
  detour.artistic_processes << process
  detour.fiche_techniques << fiche
  detour.conducteurs << conducteur
  detour.emotional_markers << marker_melancolie
  detour.zones << zone_centre
  detour.materiels << projecteur
  detour.artistic_limits << ArtisticLimit.where(conducteur_id: conducteur.id)
  detour.interpretations << Interpretation.where(conducteur_id: conducteur.id)
  
  puts "🔗 Relations HABTM établies avec le CreativeDetour ##{detour_id}"
rescue ActiveRecord::RecordNotFound
  puts "⚠️ Erreur : Le CreativeDetour ##{detour_id} n'existe pas. Les relations HABTM n'ont pas été créées."
end

puts "✅ Simulation terminée : Le conducteur final est une succession de 'presque' bonnes idées. C'est magnifique car c'est instable."
