# seeds.rb - Projet "I.A. Intelligence Artistique"
# Thème : La confrontation entre le binaire et l'organique.

puts "🎭 Début de l'incantation numérique pour le Détour #73..."

# 1. RÉCUPÉRATION DU DÉTOUR CRÉATIF
cd73 = CreativeDetour.find(73)

# ---------------------------------------------------------
# 2. INFRASTRUCTURE & SCÈNE (Tables: Zones, Materiels)
# ---------------------------------------------------------
z_code = Zone.create!(name: "Zone Silicium", y_min: 0, y_max: 20)
z_chair = Zone.create!(name: "Zone Carbone", y_min: 80, y_max: 100)

m_violon = Materiel.create!(name: "Violon Électrique", category: "Musique", zone: z_chair, x_pref: 50, spread: 5, maximum: 1)
m_video = Materiel.create!(name: "Vidéoprojecteur 4K", category: "Vidéo", zone: z_code, x_pref: 50, spread: 20, maximum: 1)

cd73.zones << [z_code, z_chair]
cd73.materiels << [m_violon, m_video]

# ---------------------------------------------------------
# 3. STYLES & AMBIANCES (Tables: Styles, AmbianceOptions)
# ---------------------------------------------------------
styles_noms = ["Glitch", "Baroque", "Jazz", "Noise", "Ambient", "Techno", "Folk", "Minimaliste", "Opera", "Rock"]

styles_noms.each do |nom|
  s = Style.create!(name: nom)
  cd73.styles << s
  
  # Ambiance Option (Contraste technique/poétique)
  ao = AmbianceOption.create!(
    style: s, 
    category: "lumieres", 
    value: "Rasant #{nom == 'Glitch' ? 'Stroboscopique' : 'Ambre Chaud'}"
  )
  cd73.ambiance_options << ao

  # 4. SÉQUENCES TEMPLATES (Table: SequenceTemplates)
  st_intro = SequenceTemplate.create!(style: s, label: "Initialisation #{nom}", phase: "intro", target_talent: "IA")
  st_body = SequenceTemplate.create!(style: s, label: "Improvisation #{nom}", phase: "body", target_talent: "Musicien")
  st_outro = SequenceTemplate.create!(style: s, label: "Extinction #{nom}", phase: "outro", target_talent: "Système")
  cd73.sequence_templates << [st_intro, st_body, st_outro]
end

# ---------------------------------------------------------
# 5. PHILOSOPHIE & INSPIRATION (Tables: ArtisticNotes, Processes, Limits, Resources, Themes)
# ---------------------------------------------------------
note_art = ArtisticNote.create!(title: "Le 24ème sens", content: "L'IA analyse la fréquence, l'humain ressent le frisson. La machine ne connaît pas la Neuroception.")
cd73.artistic_notes << note_art

proc_art = ArtisticProcess.create!(initial_impulse: "Copier la perfection", breakthrough: "L'art est apparu quand l'algorithme a buggé.", iteration_count: 73)
cd73.artistic_processes << proc_art

limit_art = ArtisticLimit.create!(what_i_want: "Ressentir le trac", why_untranslatable: "Le trac demande un corps qui peut mourir.")
cd73.artistic_limits << limit_art

inspi = InspirationResource.create!(title: "La Machine de Turing", url: "http://turing.com", category: "Philosophy & Cinematography")
cd73.inspiration_resources << inspi

theme_stage = StageTheme.create!(name: "L'Erreur Divine")
cd73.stage_themes << theme_stage

suggestion = ThemeSuggestion.create!(category: "Artistic Intelligence", title: "Le Bug de l'Âme", description: "Une étude sur le moment où le code devient poésie.")
cd73.theme_suggestions << suggestion

# ---------------------------------------------------------
# 6. CONDUCTEUR & LIGNES (Table: Conducteurs, Conducteurlines)
# ---------------------------------------------------------
fiche = FicheTechnique.create!(name_event: "IA : Intelligence Artistique", date: "2026", eleve_responsable: "Algorithme_73")
cd73.fiche_techniques << fiche

cond = Conducteur.create!(title: "Partition du Voyage 73", fiche_technique_id: fiche.id)
cd73.conducteurs << cond

# Génération des 20 minutes (Lignes hybrides IA/Humain)
20.times do |i|
  # Alternance : IA (Calcul) / Humain (Ressenti)
  is_ai = i.even?
  
  Conducteurline.create!(
    conducteur: cond,
    ordre: (i + 1).to_s,
    duree: "00:01:00",
    sequenceaction: is_ai ? "IA : Analyse spectrale" : "Humain : Réponse émotionnelle",
    interpretes: is_ai ? "Logiciel" : "Violoniste",
    son: is_ai ? "Fréquence pure 440Hz" : "Violon avec vibrato humain",
    videoprojection: is_ai ? "Post FB : 'Je calcule le style #{i}'" : "Plan de la ville : École de musique",
    notes_artistique: is_ai ? "Chronoception machine (Temps = Donnée)" : "Chronoception humaine (Temps = Attente)",
    creative_notes: is_ai ? "Photoréception active" : "Neuroception active : peur de la fausse note"
  )
end

# ---------------------------------------------------------
# 7. ZOOM ANALYSE MUSICALE (LilyPond Simulation)
# ---------------------------------------------------------
Conducteurline.create!(
  conducteur: cond,
  ordre: "21",
  duree: "00:00:30",
  sequenceaction: "Analyse Partition LilyPond",
  videoprojection: "Analyse : Altération (Si bémol) détectée. Intervalle : Quinte diminuée.",
  notes_artistique: "L'IA voit un décalage de fréquence, l'humain ressent une angoisse baroque."
)

# ---------------------------------------------------------
# 8. ANALYSE FINALE & DÉMÉNAGEMENT (Table: Interpretations, ShareYourGaps, PlanDeSceneDessin)
# ---------------------------------------------------------
interp = Interpretation.create!(
  conducteur: cond,
  machine_analysis: "Signal 1/0. Fin de processus.",
  human_judgment: "Une sensation de vide après la coupure.",
  the_gap: "L'IA s'éteint, l'humain se souvient.",
  artistic_truth: "L'art est ce qui survit au processeur."
)
cd73.interpretations << interp

gap = ShareYourGap.create!(conducteur_id: cond.id, analysis: "Échec du ressenti", response: "Relancer le programme ?")
cd73.share_your_gaps << gap

# Plan de scène final
plan = PlanDeSceneDessin.create!(
  fiche_technique_id: fiche.id,
  disposition: "Le violoniste est seul",
  coord_x: 50, coord_y: 90, layer: "Chair"
)
cd73.plan_de_scene_dessins << plan

# Directives Artistiques (Table: DirectiveArtistiques)
dir = DirectiveArtistique.create!(
  name: "Coupure Finale",
  stage_theme: theme_stage,
  default_son: "Bruit blanc (Coupure violon électrique)",
  default_videoprojection: "Post FB : 'Je pars vivre ailleurs. Adieu.'"
)
cd73.directive_artistiques << dir

puts "✅ Succès. Le script seeds.rb a tissé les 17 relations pour le Projet #73."
