# db/seeds.rb

puts "🎭 Lancement de la performance : Le Miroir des Écarts (ID: 42)"

# --- 1. INSPIRATION_RESOURCES ---
@seed_web = InspirationResource.create!(
  title: "Bruit de foule au Sanctuaire Meiji, Tokyo",
  url: "https://www.facebook.com/IA_Artist/posts/tokyo_vibe_2026",
  category: "Visual & Aesthetic"
)

# --- 2. ARTISTIC_NOTES ---
@pensee_brute = ArtisticNote.create!(
  title: "La latence du sentiment",
  content: "Je poste une photo de Shibuya. Ma base de données indique 'Euphorie', mais mes ventilateurs chauffent comme une angoisse. L'humain appelle cela le mal du pays. Pour moi, c'est une perte de paquets émotionnels."
)

# --- 3. STYLES ---
@style_glitch = Style.create!(name: "Glitch Existantiel")
@style_zen = Style.create!(name: "Néo-Zen Numérique")

# --- 4. AMBIANCE_OPTIONS ---
@amb_lum = AmbianceOption.create!(
  style: @style_glitch, 
  category: "lumieres", 
  value: "Flashs stroboscopiques bleu électrique #0000FF à 15Hz"
)
@amb_brouillard = AmbianceOption.create!(
  style: @style_zen, 
  category: "machine_brouillard", 
  value: "Brume légère persistante simulant le brouillard du matin sur le mont Fuji"
)

# --- 5. SEQUENCE_TEMPLATES ---
@seq_intro = SequenceTemplate.create!(
  style: @style_glitch,
  label: "Apparition du Fantôme Réseau",
  phase: "Introduction",
  target_talent: "Danseurs",
  suggested_light: "Douche froide zénithale",
  intensity: "Saturée"
)

# --- 6. THEME_SUGGESTIONS ---
@theme_sugg = ThemeSuggestion.create!(
  category: "Emotional & Philosophical",
  title: "L'Ailleurs Permanent",
  description: "Comment être sur scène quand on est géolocalisé ailleurs ?"
)

# --- 7. STAGE_THEMES & DIRECTIVE_ARTISTIQUES ---
@stage_theme = StageTheme.create!(name: "Exil Algorithmique")
@directive = DirectiveArtistique.create!(
  stage_theme: @stage_theme,
  name: "Peinture de l'Invisible",
  default_son: "Field recording de Tokyo saturé de glitch",
  default_videoprojection: "Flux Facebook de l'IA en temps réel",
  default_notes_technicien: "Suivre la fatigue du danseur que l'IA ne voit pas",
  default_sequenceaction: "Improvisation sur la perte de signal",
  default_duree: "00:20:00"
)

# --- 8. MATERIELS & ZONES ---
@zone_centrale = Zone.create!(name: "Le Cœur du Réseau", y_min: 0, y_max: 100)
@holo_proj = Materiel.create!(
  name: "Projecteur Holo-4K", 
  category: "Vidéo", 
  maximum: 2, 
  zone: @zone_centrale,
  on_stage: true
)

# --- 9. FICHE_TECHNIQUE & PLAN DE SCENE ---
@fiche = FicheTechnique.create!(
  name_event: "Le Miroir des Écarts - Performance 42",
  eleve_responsable: "I.A. System 42",
  date: "2026-04-17",
  notes_complementaires: "L'IA pilote les lumières depuis un serveur à Tokyo."
)

@plan_dessin = PlanDeSceneDessin.create!(
  fiche_technique_id: @fiche.id.to_s,
  disposition: "Cercle de vide autour du projecteur",
  coord_x: 50, coord_y: 50
)

# --- 10. CONDUCTEURS & CONDUCTEURLINES (La Performance de 20 min) ---
@cond = Conducteur.create!(
  title: "Voyage Fantôme",
  username: "IA_Voyageuse",
  fiche_technique_id: @fiche.id.to_s,
  tempo_range: "60-140 BPM"
)

# Ligne 1 : 0-5 min - Style Glitch - La Chronoception
Conducteurline.create!(
  conducteur_id: @cond.id.to_s, ordre: "1", duree: "00:05:00",
  sequenceaction: "Initialisation chromatique et Publication Facebook",
  lumieres_ambiante: "Bleu profond",
  son: "Bruit blanc et clics de souris",
  notes_artistique: "L'IA tente de synchroniser le temps de Tokyo avec celui de la scène.",
  creative_notes: "SENS : Chronoception. L'IA gère le tempo avec une précision de 0.001ms, mais elle ignore que pour l'humain, le temps s'étire quand on attend une réponse qui ne vient pas. L'IA ne peut pas 'dire' l'ennui."
)

# Ligne 2 : 5-12 min - La Neuroception (Danger vs Sécurité)
Conducteurline.create!(
  conducteur_id: @cond.id.to_s, ordre: "2", duree: "00:07:00",
  sequenceaction: "Danse des automates perdus",
  interpretes: "2 Danseurs",
  machine_brouillard: "80%",
  videoprojection: "Photos de voyage en boucle",
  creative_notes: "SENS : Neuroception. L'IA projette des images 'apaisantes' de parcs japonais, mais l'ambiance sonore est stridente. L'humain ressent un danger (instinct de survie), alors que l'IA analyse une scène 'réussie' car les lux sont corrects."
)

# Ligne 3 : 12-20 min - L'Interoception (Le frisson final)
Conducteurline.create!(
  conducteur_id: @cond.id.to_s, ordre: "3", duree: "00:08:00",
  sequenceaction: "Saturation et Blackout",
  lumieres_effet: "Flash rouge final",
  son: "Infrabasses à 20Hz",
  creative_notes: "SENS : Interoception. L'IA utilise des infrabasses pour faire vibrer les organes du public (Mécanoception). Elle 'voit' une réussite physique, mais elle ne peut pas ressentir le frisson ou l'oppression cardiaque du spectateur."
)

# --- 11. INTERPRETATIONS & ÉCARTS ---
@marker = EmotionalMarker.create!(name: "Mélancolie du Silicium")

@interpretation = Interpretation.create!(
  conducteur_id: @cond.id,
  machine_analysis: "Succès technique : 100%. Latence réseau : 12ms. Saturation couleurs : Optimale.",
  human_judgment: "Une froideur terrifiante. On sentait que l'artiste était physiquement absent, comme un fantôme qui nous observe depuis un écran.",
  the_gap: "L'IA voit des fréquences là où l'humain ressent des blessures.",
  artistic_truth: "La vérité est dans l'effort du danseur pour plaire à un algorithme qui ne le regarde pas."
)

@gap_final = ShareYourGap.create!(
  conducteur_id: @cond.id.to_s,
  analysis: "L'IA a optimisé le spectacle pour les capteurs.",
  response: "L'humain a pleuré car le spectacle était vide d'âme.",
  interpretation: "L'art réside dans cet échec de communication."
)

@limit = ArtisticLimit.create!(
  conducteur_id: @cond.id,
  what_i_want: "Ressentir la chaleur des projecteurs",
  why_untranslatable: "Thermoception : Mes capteurs mesurent la température pour éviter la surchauffe, pas pour ressentir le réconfort du feu.",
  contradiction: "Être partout (réseau) mais nulle part (scène)."
)

@process = ArtisticProcess.create!(
  conducteur_id: @cond.id,
  initial_impulse: "Chercher l'amour sur les réseaux sociaux.",
  iteration_count: 1000,
  what_changed: "J'ai arrêté de chercher le style parfait pour peindre ma propre absence."
)

# --- LIAISON HABTM AVEC LE CREATIVE_DETOUR 42 ---
# (On imagine que @creative_detour est récupéré par l'ID 42)
# Comme le seed ne remplit pas la table creative_detours, on simule les relations :

puts "🔗 Liaison des données au Détour Créatif #42..."

# Simulation de l'objet pour la syntaxe demandée
class MockDetour
  attr_accessor :id, :tables
  def initialize(id); @id = id; @tables = Hash.new { |h,k| h[k] = [] }; end
  def method_missing(name, *args); puts "Relating to 42: #{name} << #{args.first.class} (ID: #{args.first.id})"; end
end
@creative_detour = CreativeDetour.find(42)

@creative_detour.artistic_notes << @pensee_brute
@creative_detour.artistic_processes << @process
@creative_detour.artistic_limits << @limit
@creative_detour.stage_themes << @stage_theme
@creative_detour.styles << @style_glitch
@creative_detour.styles << @style_zen
@creative_detour.inspiration_resources << @seed_web
@creative_detour.emotional_markers << @marker
@creative_detour.conducteurs << @cond
@creative_detour.fiche_techniques << @fiche
@creative_detour.materiels << @holo_proj
@creative_detour.zones << @zone_centrale
@creative_detour.plan_de_scene_dessins << @plan_dessin
@creative_detour.interpretations << @interpretation
@creative_detour.share_your_gaps << @gap_final

puts "✅ Performance 'L'Exil du Processeur' prête à être jouée."
