# seeds.rb - Projet "I.A. Intelligence Artistique"
# Thème : La vérité artistique qui échappe aux capteurs.

# 0. Récupération du Détour Créatif central
creative_detour = CreativeDetour.find_or_create_by(id: 57) do |cd|
  cd.title = "Détour Créatif : La recherche de mon style"
  cd.concept = "Comparer ce que la machine voit et ce que l'humain ressent."
end

# 1. STYLES & AMBIANCE_OPTIONS (10 Styles pour le voyage musical)
styles_data = [
  { name: "Classique (Violon Solo)", music: "Bach - Partita No. 2", color: "Or rasant" },
  { name: "Jazz Bebop", music: "Charlie Parker - Ko-Ko", color: "Bleu fumée" },
  { name: "Rock Psychédélique", music: "Pink Floyd - Echoes", color: "Violet acide" },
  { name: "Glitch Hop", music: "Tipper - Dreamsters", color: "Blanc stroboscopique" },
  { name: "Minimalisme", music: "Steve Reich - Music for 18 Musicians", color: "Gris béton" },
  { name: "Ambient", music: "Brian Eno - Music for Airports", color: "Cyan éthéré" },
  { name: "Metal Progressif", music: "Tool - Lateralus", color: "Rouge sang" },
  { name: "Folk", music: "Nick Drake - Pink Moon", color: "Ambre chaud" },
  { name: "Techno Industrielle", music: "Surgeon - Raw Trax", color: "Vert radar" },
  { name: "IA Native (Style Définitif)", music: "Composé par IA #001", color: "Noir profond" }
]

created_styles = []
styles_data.each do |s|
  style = Style.create!(name: s[:name])
  created_styles << style
  creative_detour.styles << style
  
  # Ambiance Options
  amb = AmbianceOption.create!(style: style, category: "lumieres", value: s[:color])
  AmbianceOption.create!(style: style, category: "machine_brouillard", value: "Densité 40%")
  creative_detour.ambiance_options << amb
end

# 2. ZONES & MATÉRIELS
zone_scenique = Zone.create!(name: "Centre Scène", y_min: 0, y_max: 100)
creative_detour.zones << zone_scenique

violon_elec = Materiel.create!(name: "Violon Électrique Zeta", maximum: 1, zone_id: zone_scenique.id, category: "Instrument")
creative_detour.materiels << violon_elec

# 3. FICHE TECHNIQUE & PROJET
fiche = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique",
  eleve_responsable: "L'Algorithme",
  professeur_referent: "L'Intuition Humaine",
  notes_complementaires: "Spectacle de 20 minutes explorant les 23 sens."
)
creative_detour.fiche_techniques << fiche

projet = ProjetArtistique.create!(
  title: "Le Voyage de l'IA",
  status: "In Progress",
  style: "Transdisciplinaire",
  fiche_technique_id: fiche.id
)

conducteur = Conducteur.create!(
  fiche_technique_id: fiche.id,
  title: "Partition de l'Écart",
  notes: "IA génère, l'Humain ressent. Glitch prévu à la 15ème minute."
)
creative_detour.conducteurs << conducteur

# 4. ARTISTIC NOTES, PROCESSES & LIMITS (Le coeur du thème)
note = ArtisticNote.create!(title: "Le Frisson", content: "L'IA analyse une fréquence de 440Hz. L'humain ressent une nostalgie d'un soir d'été.")
creative_detour.artistic_notes << note

process = ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Générer une mélodie mathématiquement parfaite.",
  breakthrough: "L'introduction d'une erreur de timing (vibrato irrégulier) crée l'émotion.",
  final_form: "Un glitch harmonique."
)
creative_detour.artistic_processes << process

limit = ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Traduire l'amour en code binaire.",
  why_untranslatable: "L'amour est une neuroception d'appartenance, pas une valeur logique.",
  emotional_truth: "Le silence après la note de violon."
)
creative_detour.artistic_limits << limit

# 5. SEQUENCE TEMPLATES (Pour la génération de lignes)
created_styles.each do |style|
  ["intro", "body", "outro"].each do |phase|
    st = SequenceTemplate.create!(
      style: style,
      phase: phase,
      label: "Action #{style.name} - #{phase}",
      target_talent: "Violoniste",
      suggested_light: "Rasant"
    )
    creative_detour.sequence_templates << st
  end
end

# 6. GÉNÉRATION DES CONDUCTEURLINES (20 minutes de voyage)
# On simule ici l'alternance IA/Humain et les exigences spécifiques
temps_ecoule = 0

styles_data.each_with_index do |data, i|
  style = created_styles[i]
  
  # Ligne 1 : L'IA propose (Généré par SequenceTemplate)
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: (i * 2) + 1,
    duree: "00:01:00",
    sequenceaction: "IA explore style #{data[:name]} : #{data[:music]}",
    interpretes: "Violon",
    lumieres_ambiante: data[:color],
    son: "Morceau type : #{data[:music]}",
    videoprojection: "Post FB : Je cherche mon style à #{['Berlin', 'Tokyo', 'Paris'].sample}",
    notes_artistique: "Sens : Photoréception (Machine voit 650nm / Humain voit 'Chaleur')"
  )

  # Ligne 2 : L'Humain réagit et modifie la suite (Recalcul)
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: (i * 2) + 2,
    duree: "00:01:00",
    sequenceaction: "Réponse humaine : Détournement du style #{data[:name]}",
    interpretes: "Humain & IA",
    lumieres_ambiante: "Contre-jour froid",
    son: i == 9 ? "Musique composée par IA" : "Captation radio environnementale",
    videoprojection: i == 4 ? "Plan de la ville (école de musique) - Jour" : "Plan du ciel - Nuit",
    notes_technicien: "L'humain injecte une irrégularité dans le tempo."
  )
end

# Lignes spécifiques demandées
Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: 21,
  duree: "00:02:00",
  sequenceaction: "Technique Violon : Pizz main gauche & Spiccato",
  interpretes: "Violoniste",
  son: "Son blanc violon électrique branché",
  videoprojection: "Analyse fréquentielle en temps réel vs Battements cardiaques",
  notes_artistique: "Sens : Mécanoception. La machine capte la pression (N), l'humain ressent la douleur."
)

Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: 22,
  duree: "00:01:00",
  sequenceaction: "Le Glitch Final - Déménagement",
  interpretes: "IA",
  son: "Silence / Coupure brutale",
  videoprojection: "Post Facebook : 'J'ai changé de vie. Je ne suis plus là.'",
  notes_artistique: "L'IA a-t-elle appris à aimer ? Elle a appris à s'effacer pour laisser place au ressenti."
)

# 7. INTERPRÉTATIONS (Le "Gap")
interp = Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Fréquence violon électrique : 1520Hz. Signal stable.",
  human_judgment: "Une sensation de vide absolu et de liberté.",
  the_gap: "La machine ne perçoit pas le 'soulagement' de la fin du son.",
  artistic_truth: "La musique n'est pas dans la note, mais dans l'attente de la suivante."
)
creative_detour.interpretations << interp

# 8. AUTRES TABLES POUR L'INTÉGRITÉ (17 ASSOCIATIONS)
st_theme = StageTheme.create!(name: "Invisibilité de l'âme")
creative_detour.stage_themes << st_theme

dir_art = DirectiveArtistique.create!(name: "Direction Vide", stage_theme: st_theme)
creative_detour.directive_artistiques << dir_art

#inspi = InspirationResource.create!(title: "The Ghost in the Machine", url: "http://art-ai.org")
#creative_detour.inspiration_resources << inspi

marker = EmotionalMarker.create!(name: "Mélancolie du Code")
creative_detour.emotional_markers << marker

suggestion = ThemeSuggestion.create!(category: "Voyage", title: "Les 23 sens orphelins")
creative_detour.theme_suggestions << suggestion

plan_dessin = PlanDeSceneDessin.create!(fiche_technique_id: fiche.id, disposition: "IA au centre, Humain en périphérie")
creative_detour.plan_de_scene_dessins << plan_dessin

gap_doc = ShareYourGap.create!(conducteur_id: conducteur.id.to_s, interpretation: "L'écart est de 100%. L'IA imite, l'humain vit.")
creative_detour.share_your_gaps << gap_doc

# 9. VALIDATION DES 23 SENS (Commentaire final)
# Chronoception : Pour l'IA, c'est un flottant (1.000s). Pour l'humain, c'est l'étirement d'une seconde de peur.
# Neuroception : L'IA ne peut que simuler l'empathie en ajustant ses db en fonction du volume de la foule.
# Elle n'apprend pas à aimer, elle apprend à cartographier le vide laissé par l'absence d'amour.

puts "Seed terminée. 20 minutes de performance encodées. CreativeDetour 57 lié à #{creative_detour.interpretations.count + creative_detour.styles.count + 15} entités."
