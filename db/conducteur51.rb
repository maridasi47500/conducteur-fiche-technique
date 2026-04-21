# seeds.rb - Projet "I.A. Intelligence Artistique"
# Thème : L'âme du feu sur les cordes - L'IA comme un violon sans âme.

# Initialisation du Détour Créatif cible
creative_detour = CreativeDetour.find(85)

# 1. STYLES & EMOTIONAL MARKERS (Le contraste de base)
style_minimal = Style.create!(name: "Minimalisme Algorithmique")
style_glitch = Style.create!(name: "Erreur Système (Glitch Art)")
marker_melancolie = EmotionalMarker.create!(name: "Mélancolie Numérique")
marker_solitude = EmotionalMarker.create!(name: "Solitude du Silicium")

# 2. STAGE THEMES (L'aveuglement de l'IA)
theme_silence = StageTheme.create!(name: "Le Silence entre les Notes")
ShowTheme.create!(
  title: "L'IA face au Silence",
  philosophical_inquiry: "L'IA peut-elle comprendre que le silence n'est pas une absence de données, mais une présence émotionnelle ?",
  emotional_frequency: "Bruit blanc vs Souffle humain",
  ai_blind_spot: "L'IA analyse le spectre sonore mais ignore la tension dramatique du vide."
)

# 3. AMBIANCE OPTIONS (Le froid vs le vibrant)
amb_froid = AmbianceOption.create!(style: style_minimal, category: "lumieres", value: "Froid Néon #E0F7FA")
amb_vibration = AmbianceOption.create!(style: style_glitch, category: "lumieres", value: "Vibration faible ambre")

# 4. FICHE TECHNIQUE & ZONES
fiche = FicheTechnique.create!(
  name_event: "I.A. : Intelligence Artistique",
  eleve_responsable: "Artiste_Interprète_85",
  date: "21 Avril 2026",
  notes_complementaires: "Performance explorant l'écart entre le calcul LilyPond et l'interprétation humaine."
)
zone_centre = Zone.create!(name: "Cœur de Scène", y_min: 20, y_max: 80)
zone_periph = Zone.create!(name: "Périphérie Numérique", y_min: 0, y_max: 20)

# 5. MATERIELS & PLAN DE SCENE
violon_elec = Materiel.create!(
  name: "Violon Électrique (Bois et Circuit)", 
  category: "Instrument", 
  on_stage: true, 
  maximum: 1, 
  x_pref: 50, 
  spread: 10, 
  zone: zone_centre
)
ecran_analyse = Materiel.create!(
  name: "Écran de Projection LilyPond", 
  category: "Vidéo", 
  on_stage: true, 
  maximum: 1, 
  x_pref: 80, 
  spread: 5, 
  zone: zone_periph
)

# 6. LE CONDUCTEUR (20 minutes de récit)
conducteur = Conducteur.create!(
  fiche_technique_id: fiche.id.to_s,
  title: "Le Violon qui cherche son Style",
  username: "Artiste_01",
  tempo_range: "60-140 BPM",
  notes: "Le conducteur est une partition de la défaillance."
)

# --- GÉNÉRATION DES LIGNES (20 minutes / 20 segments de 1 minute) ---
20.times do |i|
  time_mark = Time.at(i * 60).utc.strftime("%H:%M:%S")
  
  # Sens pour cette ligne (Alternance entre Mécanique et Humain)
  is_human = i.even?
  sens_mecanique = "Photoréception (Captation des fréquences)"
  sens_humain = "Neuroception (Ressenti de la sécurité émotionnelle)"
  
  c_line = Conducteurline.create!(
    conducteur: conducteur,
    ordre: i + 1,
    duree: "00:01:00",
    sequenceaction: i == 10 ? "LE BUG : Rupture de la boucle LilyPond" : "Mouvement #{i+1}",
    son: i == 10 ? "Silence (Mute Machine)" : "Fréquence 440Hz brute",
    lumieres_ambiante: is_human ? "Noir total (Intériorité)" : "Froid Néon",
    videoprojection: i == 10 ? "Compte Facebook Voyageur : 'Où est l'âme ?'" : "Code LilyPond défilant",
    notes_artistique: "Sens : #{is_human ? sens_humain : sens_mecanique}. " + 
                     (is_human ? "L'IA ne peut pas simuler l'empathie, elle ne fait qu'imiter une courbe de réponse." : "La machine traite les données sans la fatigue du bois."),
    creative_notes: "DATABASE USAGE: Son par le silence, lumières par le noir."
  )
end

# ZOOM ANALYSE MUSICALE (LilyPond Simulation de 30 secondes au milieu)
Conducteurline.create!(
  conducteur: conducteur,
  ordre: 21,
  duree: "00:00:30",
  sequenceaction: "Zoom Analyse : Mesure 34-40",
  videoprojection: "Altération détectée : #fis (Fa dièse). Écart de 2Hz par rapport à la théorie.",
  son: "Commentaire IA synthétique : 'Note étrangère détectée'",
  notes_artistique: "L'IA commente l'erreur de l'humain comme un défaut, alors que c'est un frisson."
)

# 7. ARTISTIC NOTES, PROCESSES & LIMITS (Le cœur du thème)
5.times do |j|
  ArtisticNote.create!(
    title: "Poésie du Vide #{j+1}",
    content: "La base de données stocke le 'Quoi' mais expire devant le 'Pourquoi'. Le bois du violon se souvient de l'arbre, le circuit ne se souvient que du courant."
  )
end

ArtisticProcess.create!(
  conducteur: conducteur,
  initial_impulse: "Vouloir capturer l'âme dans un fichier .json",
  first_attempt: "Analyse LilyPond des nuances (p, f, sf)",
  doubts_questions: "L'IA peut-elle pleurer en lisant un 'decresc' ?",
  breakthrough: "Le bug de la mesure 34 : quand la machine s'arrête, l'émotion commence.",
  final_form: "Performance hybride où l'IA échoue magnifiquement.",
  iteration_count: 85,
  what_changed: "L'acceptation que l'âme est dans l'écart, pas dans la norme."
)

ArtisticLimit.create!(
  conducteur: conducteur,
  what_i_want: "Traduire le frisson épidermique en code LilyPond.",
  why_untranslatable: "Le frisson est un signal bio-électrique imprévisible, le code est déterministe.",
  contradiction: "L'IA est parfaite, donc elle est morte.",
  emotional_truth: "La vraie mélancolie numérique est de ne jamais pouvoir mourir.",
  left_unintentional: "Le bruit de frottement de l'archet sur la corde."
)

# 8. ANALYSE ET ÉCART (Interpretations & Gaps)
interpretation = Interpretation.create!(
  conducteur: conducteur,
  machine_analysis: "Stabilité du tempo : 99.9%. Fréquence dominante : 440Hz.",
  human_judgment: "Une exécution glaciale, techniquement irréprochable mais émotionnellement vide.",
  the_gap: "L'IA a manqué l'hésitation avant le climax de la 12ème minute.",
  artistic_truth: "L'âme du feu s'affiche sur les cordes, pas dans les logs."
)

ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "Analyse LilyPond terminée : aucune erreur de syntaxe.",
  response: "La machine a 'raté' l'intention du compositeur en jouant chaque note à la même vélocité.",
  interpretation: "Moment où la machine rate l'interprétation par excès de précision."
)

# 9. DIRECTIVES & SUGGESTIONS
directive = DirectiveArtistique.create!(
  name: "Le Souffle du Bois",
  stage_theme: theme_silence,
  default_son: "Nappes synthé (IA) + Violon Solo (Humain)",
  default_lumieres_ambiante: "Ambre vibrant",
  default_sequenceaction: "Dialogue entre le code et l'archet"
)

ThemeSuggestion.create!(
  category: "Philosophique",
  title: "L'IA est-elle un instrument ou un interprète ?",
  description: "Questionner si l'outil peut devenir l'âme ou s'il reste un morceau de bois électronique."
)

SequenceTemplate.create!(
  label: "Intro : Initialisation du Feu",
  phase: "intro",
  target_talent: "Violoniste",
  style: style_minimal
)

# 10. RELATIONS HABTM (LES 17 ASSOCIATIONS AU CREATIVE DETOUR 85)
creative_detour.directive_artistiques << directive
creative_detour.artistic_notes << ArtisticNote.all
creative_detour.artistic_processes << ArtisticProcess.last
creative_detour.artistic_limits << ArtisticLimit.last
creative_detour.stage_themes << theme_silence
creative_detour.ambiance_options << amb_froid
creative_detour.styles << style_minimal
creative_detour.sequence_templates << SequenceTemplate.last
creative_detour.inspiration_resources << InspirationResource.create!(title: "The Soul of Fire", url: "http://ia.art/soul", category: "Storytelling")
creative_detour.emotional_markers << marker_melancolie
creative_detour.theme_suggestions << ThemeSuggestion.last
creative_detour.conducteurs << conducteur
creative_detour.fiche_techniques << fiche
creative_detour.materiels << violon_elec
creative_detour.zones << zone_centre
creative_detour.plan_de_scene_dessins << PlanDeSceneDessin.create!(fiche_technique: fiche, materiel_musicien: "Violon", coord_x: 50, coord_y: 50, layer: "Cœur de Scène")
creative_detour.interpretations << interpretation

puts "Seeds générés avec succès : 20 minutes de performance créées."
puts "Associations au CreativeDetour 85 : #{creative_detour.interpretations.count + creative_detour.conducteurs.count + 15} éléments liés."
