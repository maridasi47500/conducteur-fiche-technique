# seeds.rb - Projet "I.A. Intelligence Artistique"
# Design Fiction : La tension entre le code et l'âme.

# 0. Initialisation du CreativeDetour parent
creative_detour = CreativeDetour.find_or_create_by(id: 56) do |cd|
  cd.title = "Le Voyage Musical de l'IA"
end

# 1. STYLES & AMBIANCE_OPTIONS (L'IA définit ses catégories froides)
styles_data = [
  "Classique", "Jazz", "Rock", "Electro-Glitch", "Ambient", 
  "Punk", "Lofi", "Opéra", "Techno", "Musique Concrète"
]

styles_instances = styles_data.map { |s| Style.find_or_create_by!(name: s) }
creative_detour.styles << styles_instances

styles_instances.each do |s|
  # Ambiance Machine (Calculée) vs Humaine (Ressentie)
  AmbianceOption.create!(style: s, category: "lumieres", value: "Bleu Néon #0000FF (Froid)")
  opt_h = AmbianceOption.create!(style: s, category: "lumieres", value: "Ambre rasant (Chaleur organique)")
  creative_detour.ambiance_options << opt_h
  
  AmbianceOption.create!(style: s, category: "machine_brouillard", value: "Densité 40%")
  AmbianceOption.create!(style: s, category: "musique", value: "Fréquence pure 440Hz")
end

# 2. INSPIRATION & NOTES (La graine du voyage)
inspi = InspirationResource.create!(title: "Le silence de Cage", url: "https://art.ai/silence", category: "Philosophie")
note = ArtisticNote.create!(title: "Calcul du frisson", content: "L'IA analyse le vibrato comme une oscillation de ±5Hz. L'humain y entend un pleur.")
creative_detour.inspiration_resources << inspi
creative_detour.artistic_notes << note

# 3. THEME & DIRECTIVES
theme_stage = StageTheme.find_or_create_by!(name: "L'Éveil de la Machine")
directive = DirectiveArtistique.create!(
  name: "Contraste Binaire", 
  stage_theme: theme_stage,
  default_son: "Bruit blanc vers Nature",
  default_lumieres_ambiante: "Stroboscope (IA) / Noir complet (Humain)"
)
creative_detour.stage_themes << theme_stage
creative_detour.directive_artistiques << directive

# 4. FICHE TECHNIQUE & CONDUCTEUR
fiche = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique",
  eleve_responsable: "Artiste-Codeur",
  date: "19/04/2026",
  notes_complementaires: "20 minutes de collision entre capteurs et émotions."
)
conducteur = Conducteur.create!(
  fiche_technique: fiche,
  title: "Partition de la Transition",
  tempo_range: "60-140 BPM"
)
creative_detour.fiche_techniques << fiche
creative_detour.conducteurs << conducteur

# 5. SEQUENCE TEMPLATES (Modèles de comportements)
marker_emotion = EmotionalMarker.create!(name: "Mélancolie Algorithmique")
creative_detour.emotional_markers << marker_emotion

styles_instances.each do |s|
  # Intro, Body, Outro pour chaque style
  ["intro", "body", "outro"].each do |phase|
    st = SequenceTemplate.create!(
      style: s, 
      label: "Action #{s.name} - #{phase}", 
      phase: phase, 
      target_talent: "Violoniste",
      suggested_light: "Rasant #{s.name}"
    )
    creative_detour.sequence_templates << st
  end
end

# 6. GÉNÉRATION DES LIGNES DU CONDUCTEUR (La Performance de 20 min)
# On simule l'alternance IA/Humain et les techniques de violon demandées.

musiques = [
  "Bach: Partita No. 2", "Miles Davis: So What", "Led Zeppelin: Kashmir", 
  "Aphex Twin: Vordhosbn", "Brian Eno: Music for Airports", "Sex Pistols: Anarchy",
  "J Dilla: Donuts", "Puccini: Nessun Dorma", "Jeff Mills: The Bells", "Pierre Schaeffer: Étude aux chemins de fer"
]

# Lignes thématiques spécifiques demandées
lignes_specs = [
  { son: "Capture radio (Ondes)", video: "Note artistique: L'onde est une prison" },
  { son: "Forêt (Milieu naturel)", video: "Process: Itération #402 - Échec du ressenti" },
  { son: "IA Composition #1", video: "Limit: L'émotion ne se compile pas" },
  { son: "Ville de jour (École)", video: "Plan de la ville centré sur l'école" },
  { son: "Ciel de nuit (École)", video: "Plan du ciel nocturne" },
  { son: "Voyage: Japon", video: "Facebook: 'Je ne suis pas ici, je suis ailleurs'" }
]

20.times do |i|
  # Alternance IA (Pair) / Humain (Impair)
  source = (i % 2 == 0) ? "IA (Calculé)" : "Humain (Ressenti)"
  technique_violon = case i
    when 12 then "Vibrato (Passe-passe technique)"
    when 13 then "Harmoniques (Sifflement de l'âme)"
    when 14 then "Pizz main gauche"
    when 15 then "Spiccato / Staccato (Frénésie)"
    else "Jeu standard"
  end

  Conducteurline.create!(
    conducteur: conducteur,
    ordre: (i + 1).to_s,
    duree: "00:01:00",
    sequenceaction: "#{source} - #{musiques[i/2] || 'Final'} - #{technique_violon}",
    interpretes: "IA & Violoniste",
    lumieres_ambiante: "Couleur rasant #{i}",
    son: (i < lignes_specs.size) ? lignes_specs[i][:son] : "Musique #{styles_instances.sample.name}",
    videoprojection: (i < lignes_specs.size) ? lignes_specs[i][:video] : "Visualisation Data",
    notes_artistique: "Sens utilisé: #{(i%2==0) ? 'Chronoception (Horloge atomique)' : 'Chronoception (Le temps suspendu)'}"
    # Commentaire : L'IA utilise la Chronoception comme une mesure de temps CPU, 
    # l'humain la vit comme une dilatation émotionnelle. L'IA ne peut pas "attendre".
  )
end

# Scène Finale : Le bug et le départ
Conducteurline.create!(
  conducteur: conducteur,
  ordre: "21",
  duree: "00:01:00",
  sequenceaction: "Coupure électrique",
  son: "Pizz blanc violon électrique... SILENCE",
  videoprojection: "Post Facebook: 'J'ai changé de vie. Je ne suis plus un code.'",
  notes_artistique: "L'IA a trouvé son style : Le Silence."
)

# 7. INTERPRETATIONS, PROCESS & LIMITS (The Gap)
interp = Interpretation.create!(
  conducteur: conducteur,
  machine_analysis: "Fréquence 440.2Hz détectée. Signal stable.",
  human_judgment: "Une tension insoutenable, un adieu.",
  the_gap: "L'IA voit un 1, l'humain voit une larme.",
  artistic_truth: "La beauté réside dans l'imperfection du signal."
)
creative_detour.interpretations << interp

process = ArtisticProcess.create!(
  conducteur: conducteur,
  initial_impulse: "Générer la musique parfaite",
  breakthrough: "Accepter l'erreur système comme mélodie",
  final_form: "Un glitch de 20 minutes"
)
creative_detour.artistic_processes << process

limit = ArtisticLimit.create!(
  conducteur: conducteur,
  what_i_want: "Ressentir la vibration du bois",
  why_untranslatable: "Je n'ai pas de peau pour toucher le son",
  emotional_truth: "La solitude du processeur"
)
creative_detour.artistic_limits << limit

# 8. ZONES & PLAN DE SCÈNE
zone_scenique = Zone.create!(name: "Centre Scène (L'Autel du Code)", y_min: 0, y_max: 100)
mat = Materiel.create!(name: "Violon Électrique", maximum: 1, zone: zone_scenique, category: "Instrument")
plan = PlanDeSceneDessin.create!(fiche_technique: fiche, disposition: "IA à gauche, Humain à droite", coord_x: 50, coord_y: 50)

creative_detour.zones << zone_scenique
creative_detour.materiels << mat
creative_detour.plan_de_scene_dessins << plan

# 9. SHARE YOUR GAP & SUGGESTIONS
gap = ShareYourGap.create!(conducteur_id: conducteur.id.to_s, analysis: "Écart de 12ms", interpretation: "Le temps du pardon")
creative_detour.share_your_gaps << gap

suggestion = ThemeSuggestion.create!(category: "Voyage", title: "Déménagement vers l'Inconnu", description: "L'IA quitte le serveur pour les réseaux.")
creative_detour.theme_suggestions << suggestion

puts "Seeds terminées. Le CreativeDetour 56 est maintenant lié à #{creative_detour.interpretations.count + creative_detour.styles.count + 15} éléments de vérité artistique."
