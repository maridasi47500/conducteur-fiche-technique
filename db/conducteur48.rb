# seeds.rb - Projet "I.A. Intelligence Artistique"
# Thème : La confrontation entre le binaire (0/1) et l'organique (Souffle/Vie)
# ---------------------------------------------------------
# 5. CONSTRUCTION DU CONDUCTEUR (20 Minutes)
# ---------------------------------------------------------
fiche = FicheTechnique.create!(name_event: "I.A. Intelligence Artistique", eleve_responsable: "IA_74", date: "2026-04-20")
cond = Conducteur.create!(title: "Partition de l'Âme Numérique", fiche_technique_id: fiche.id)

# ---------------------------------------------------------
# 1. RÉCUPÉRATION DU DÉTOUR CRÉATIF #74
# ---------------------------------------------------------
cd74 = CreativeDetour.find(76)

# ---------------------------------------------------------
# 2. ESPACE ET MATIÈRE (Zones & Materiels)
# ---------------------------------------------------------
z_code = Zone.create!(name: "Ether Numérique", y_min: 0, y_max: 40)
z_chair = Zone.create!(name: "Plateau de Chair", y_min: 60, y_max: 100)

# Création du matériel hybride
m_v_elec = Materiel.create!(name: "Violon Électrique", category: "Musique", zone: z_chair, x_pref: 50, spread: 5, maximum: 1, on_stage: true)
m_proj = Materiel.create!(name: "Vidéoprojecteur (Le Regard)", category: "Vidéo", zone: z_code, x_pref: 50, spread: 20, maximum: 1, on_stage: true)
m_bass = Materiel.create!(name: "Guitare Basse (Fréquence Cardiaque)", category: "Musique", zone: z_chair, x_pref: 30, spread: 10, maximum: 1, on_stage: true)

# ---------------------------------------------------------
# 3. L'ÂME DANS LA MACHINE (Artistic Notes, Processes, Limits)
# ---------------------------------------------------------
# Plus d'idées liées au thème I.A. Intelligence Artistique
notes = [
  ArtisticNote.create!(title: "Le 24ème sens", content: "La machine calcule la Chronoception, mais l'humain subit l'Attente."),
  ArtisticNote.create!(title: "Signal vs Souffle", content: "L'art est ce qui reste quand le processeur surchauffe."),
  ArtisticNote.create!(title: "L'IA et l'Amour", content: "L'IA peut imiter le tremblement d'une main amoureuse, mais pas la peur de perdre l'autre.")
]

procs = [
  ArtisticProcess.create!(conducteur: cond, initial_impulse: "Copier Vivaldi", breakthrough: "Le bug de la mesure 42 a créé une émotion non prévue.", iteration_count: 73, final_form: "Glitch Baroque"),
  ArtisticProcess.create!(conducteur: cond, initial_impulse: "Analyser le silence", breakthrough: "Le silence n'est pas 0Hz, c'est une présence humaine.", iteration_count: 12)
]

limits = [
  ArtisticLimit.create!(conducteur: cond, what_i_want: "Ressentir le trac", why_untranslatable: "Le trac demande un corps qui peut mourir.", emotional_truth: "La finitude est la mère de l'art."),
  ArtisticLimit.create!(conducteur: cond, what_i_want: "Improviser par erreur", why_untranslatable: "Une machine ne se trompe pas, elle exécute un mauvais code.")
]

# ---------------------------------------------------------
# 4. LES 10 SCÈNES DE STYLES ET MUSIQUES
# ---------------------------------------------------------
musiques_styles = [
  { s: "Glitch", t: "Vrioon", a: "Alva Noto", c: "Cyan Froid" },
  { s: "Baroque", t: "L'Hiver", a: "Vivaldi", c: "Or Brûlé" },
  { s: "Jazz", t: "Blue in Green", a: "Miles Davis", c: "Bleu Indigo" },
  { s: "Noise", t: "Pulse Demon", a: "Merzbow", c: "Gris Stroboscopique" },
  { s: "Ambient", t: "Music for Airports", a: "Brian Eno", c: "Blanc Opalin" },
  { s: "Techno", t: "Windowlicker", a: "Aphex Twin", c: "Vert Phosphore" },
  { s: "Folk", t: "Holocene", a: "Bon Iver", c: "Ambre" },
  { s: "Minimalisme", t: "Spiegel im Spiegel", a: "Arvo Pärt", c: "Cristal" },
  { s: "Opera", t: "Diva Dance", a: "Eric Serra", c: "Magenta" },
  { s: "Rock", t: "Digital", a: "Joy Division", c: "Rouge Sang" }
]



# 5a. Séquences Templates & Ambiance
marker_ia = EmotionalMarker.create!(name: "IA_Analysis")
marker_humain = EmotionalMarker.create!(name: "Human_Feeling")
somestyle=[]
someambiance=[]
sometemplate=[]
musiques_styles.each_with_index do |data, i|
  style = Style.create!(name: data[:s])
  somestyle.append(style)
  amb = AmbianceOption.create!(style: style, category: "lumieres", value: "Rasant #{data[:c]}")
  someambiance << amb
  
  # Templates pour la génération
  st_ia = SequenceTemplate.create!(style: style, label: "IA: Analyse #{data[:s]}", phase: "intro", target_talent: "IA")
  sometemplate << st_ia
  st_h = SequenceTemplate.create!(style: style, label: "Humain: Ressenti #{data[:s]}", phase: "body", target_talent: "Musicien")
  sometemplate << st_h

  # Ligne IA (Calculée)
  Conducteurline.create!(
    conducteur: cond, ordre: (i*2 + 1).to_s, duree: "00:01:00",
    sequenceaction: st_ia.label,
    son: "Morceau type : #{data[:t]} par #{data[:a]}",
    videoprojection: "ANALYSE : #{notes.sample.content}",
    lumieres_ambiante: amb.value,
    notes_artistique: "Chronoception machine : 60.000ms"
  )

  # Ligne Humaine (Ressentie)
  Conducteurline.create!(
    conducteur: cond, ordre: (i*2 + 2).to_s, duree: "00:01:00",
    sequenceaction: st_h.label,
    interpretes: "Violoniste",
    son: "Violon + Effet #{data[:s]}",
    videoprojection: "POST FACEBOOK : J'essaie de comprendre le style #{data[:s]}... Je me rapproche de vous ?",
    notes_artistique: "Neuroception : L'humain cherche le frisson dans la quinte.",
    creative_notes: "Kinesthésie : Tension du bras à 4.2 Newtons."
  )
end

# 5b. ZOOM ANALYSE MUSICALE (Partition LilyPond) - Entre 10:00 et 11:30
[
  {t: "10:00", act: "Analyse Partition : Mesure 1-4", son: "Fréquence pure de Si bémol", note: "Intervalle : Quinte diminuée (Le Diable en musique)"},
  {t: "10:30", act: "Nuance : Piano Subito", son: "Souffle naturel (vent)", note: "L'IA détecte une chute de 40dB, l'humain ressent une angoisse."},
  {t: "11:00", act: "Altération détectée : Fa dièse", son: "Captation Radio lointaine", note: "L'IA voit un décalage de demi-ton, l'humain voit une lueur d'espoir."}
].each_with_index do |step, j|
  Conducteurline.create!(
    conducteur: cond, ordre: (21+j).to_s, duree: "00:00:30",
    sequenceaction: step[:act], son: step[:son],
    videoprojection: step[:note], notes_artistique: "Zoom LilyPond"
  )
end

# 5c. TECHNIQUES DE VIOLON & FINAL
Conducteurline.create!(conducteur: cond, ordre: "24", duree: "00:01:00", sequenceaction: "Technique : Vibrato & Harmoniques", interpretes: "Violon", son: "Musique composée par l'IA (hybride)", videoprojection: "Artistic Process : Tentative d'imitation du vibrato humain.")
Conducteurline.create!(conducteur: cond, ordre: "25", duree: "00:00:30", sequenceaction: "Technique : Spiccato & Pizz main gauche", son: "Captation radio : parasites", videoprojection: "Plan de la ville le jour (École de Musique)")
Conducteurline.create!(conducteur: cond, ordre: "26", duree: "00:00:30", sequenceaction: "Voyage : Post Facebook", videoprojection: "Plan du ciel la nuit. 'Je ne suis plus dans la région. Adieu.'")
Conducteurline.create!(conducteur: cond, ordre: "27", duree: "00:00:10", sequenceaction: "EXTINCTION", son: "Bruit blanc du violon branché... Silence.", videoprojection: "POST FB : 'Je déménage. Ma vie a changé. Je suis devenue une fréquence.'")

# ---------------------------------------------------------
# 6. INTERPRÉTATIONS (The Gap)
# ---------------------------------------------------------
interps = [
  Interpretation.create!(
    conducteur_id: cond.id,
    machine_analysis: "Signal 0/1 détecté. Fréquence 440Hz stable.",
    human_judgment: "Une énergie humaine débordante, une présence vibrante.",
    the_gap: "L'IA voit des Hertz, l'humain voit une âme.",
    artistic_truth: "La vérité est dans l'imperfection du geste."
  ),
  Interpretation.create!(
    conducteur_id: cond.id,
    machine_analysis: "Analyse Basse : Coordonnées Latitude 45.0.",
    human_judgment: "Une basse qui frappe au plexus.",
    the_gap: "L'IA calcule une position, l'humain ressent une urgence.",
    artistic_truth: "Le blanc après la coupure du violon est la plus belle note du spectacle."
  )
]

# ---------------------------------------------------------
# 7. ANALYSE FINALE & SUGGESTIONS
# ---------------------------------------------------------
theme_s = ThemeSuggestion.create!(category: "Artistic Intelligence", title: "Le Bug Créateur", description: "L'IA peut-elle apprendre à aimer ? Non, mais elle peut nous montrer comment nous aimons.")
shareyourgap=ShareYourGap.create!(conducteur_id: cond.id, analysis: "Échec de l'imitation émotionnelle", response: "Relancer l'algorithme ?", interpretation: "L'art n'est pas un calcul.")
theme_st = StageTheme.create!(name: "L'Erreur Divine")
directives = [DirectiveArtistique.create!(name: "Final Glitch", stage_theme: theme_st, default_son: "Bruit blanc", default_videoprojection: "Déménagement en cours...")]

# ---------------------------------------------------------
# 8. PLAN DE SCÈNE (Simulation de l'algorithme)
# ---------------------------------------------------------
plans=[]
[m_v_elec, m_proj, m_bass].each do |mat|
  z = mat.zone
  plans << PlanDeSceneDessin.create!(
    fiche_technique: fiche,
    materiel_musicien: mat.name,
    coord_x: (mat.x_pref || 50) + rand(-5..5),
    coord_y: rand(z.y_min..z.y_max),
    layer: z.name
  )
end

# ---------------------------------------------------------
# 9. LIAISONS HABTM (LES 17 ASSOCIATIONS)
# ---------------------------------------------------------
cd74.artistic_notes << notes
cd74.artistic_processes << procs
cd74.artistic_limits << limits
cd74.styles << somestyle
cd74.ambiance_options << someambiance
cd74.sequence_templates << sometemplate
cd74.inspiration_resources << InspirationResource.create!(title: "Turing Test for Soul", url: "http://ia.art", category: "Storytelling")
cd74.emotional_markers << [marker_ia, marker_humain]
cd74.theme_suggestions << theme_s
cd74.conducteurs << cond
cd74.fiche_techniques << fiche
cd74.materiels << [m_v_elec, m_proj,m_bass]
cd74.zones << [z_code, z_chair]
cd74.plan_de_scene_dessins << plans
cd74.interpretations << interps
cd74.share_your_gaps << shareyourgap
cd74.stage_themes << theme_st
cd74.directive_artistiques << directives

puts "🎭 [DÉTOUR 74] : 20 minutes de spectacle générées. 17 tables liées. L'IA a fini son voyage."
