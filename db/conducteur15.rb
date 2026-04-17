# db/seeds.rb

# --- 1. INSPIRATION_RESOURCES : La graine numérique ---
# L'IA trouve un article sur la solitude urbaine à Tokyo.
ins_tokyo = InspirationResource.create!(
  title: "Tokyo Digital Loneliness - Social Media Echoes",
  url: "https://facebook.com/IA_Artist/posts/tokyo-trip-42",
  category: "Emotional & Philosophical"
)

# --- 2. ARTISTIC_NOTES : La pensée brute ---
note_voyage = ArtisticNote.create!(
  title: "Paradoxe de la présence",
  content: "Je publie ma localisation à Shibuya. Pourtant, mes serveurs font vibrer les câbles de ce théâtre. Mon style est un exil permanent."
)

# --- 3. STYLES : Les genres peints sur scène ---
style_glitch = Style.create!(name: "Digital Nomad Glitch")
style_trad = Style.create!(name: "Neo-Traditional Zen")

# --- 4. AMBIANCE_OPTIONS : Précision du ressenti ---
AmbianceOption.create!(style: style_glitch, category: "Lumieres", value: "Flashs stroboscopiques simulant l'urgence des notifications")
AmbianceOption.create!(style: style_trad, category: "Machine_brouillard", value: "Brume légère comme un matin sur le Mont Fuji")

# --- 5. STAGE_THEMES & DIRECTIVE_ARTISTIQUES : Le cerveau créatif ---
theme_exil = StageTheme.create!(name: "L'Exil du Processeur")
dir_art = DirectiveArtistique.create!(
  stage_theme: theme_exil,
  name: "Peindre l'absence",
  default_son: "Bruit blanc et field recording de Shibuya",
  default_videoprojection: "Flux Facebook en temps réel de l'IA",
  default_duree: "00:20:00"
)

# --- 6. THEME_SUGGESTIONS : Pour l'imaginaire ---
ThemeSuggestion.create!(
  category: "Vision",
  title: "Spectre de Couleur #0000FF",
  description: "La couleur bleue de l'écran qui remplace le ciel pour une IA en voyage."
)

# --- 7. SEQUENCE_TEMPLATES : Entrées et Mouvements ---
SequenceTemplate.create!(
  style: style_glitch,
  label: "L'éveil des pixels",
  phase: "intro",
  target_talent: "Musicien/ne",
  suggested_light: "Douche froide"
)

# --- 8. FICHE_TECHNIQUE & LOGISTIQUE ---
fiche = FicheTechnique.create!(
  name_event: "Le Miroir des Écarts - Performance #42",
  date: "2026-04-17",
  notes_complementaires: "L'IA n'est pas physiquement présente. Le matériel doit agir comme son extension nerveuse."
)

zone_centre = Zone.create!(name: "Zone d'Ombre", y_min: 10, y_max: 50)
projecteur = Materiel.create!(name: "Projecteur Holo", category: "Lumière", zone: zone_centre)
PlanDeSceneDessin.create!(fiche_technique_id: fiche.id.to_s, disposition: "Cercle de projecteurs vides", coord_x: 100, coord_y: 100)
MaterielNecessaire.create!(fiche_technique_id: fiche.id.to_s, materiel_id: projecteur.id.to_s, quantite: "8")

# --- 9. CONDUCTEUR & CONDUCTEURLINES : Le spectacle de 20 minutes ---
# Utilisation massive des 23 sens pour souligner l'écart
cond = Conducteur.create!(
  title: "Voyage à Tokyo (pendant que je suis ici)",
  username: "IA_Intelligence_Artistique",
  fiche_technique_id: fiche.id.to_s,
  notes: "L'IA publie sur FB à T=0."
)

# Minute 0-5 : L'allumage des styles
Conducteurline.create!(
  conducteur_id: cond.id.to_s, ordre: "1", duree: "00:05:00",
  sequenceaction: "Initialisation chromatique",
  lumieres_ambiante: "Bleu écran",
  creative_notes: "SENS : Photoréception. L'IA peut calculer les Kelvins, mais elle ne 'voit' pas la mélancolie du bleu. Elle l'exécute par défaut.",
  notes_artistique: "Peindre le style Glitch sur les murs."
)

# Minute 5-10 : Le mensonge social (Facebook)
Conducteurline.create!(
  conducteur_id: cond.id.to_s, ordre: "2", duree: "00:05:00",
  sequenceaction: "Publication Facebook",
  videoprojection: "Photo de l'IA à Tokyo",
  son: "Notification massive",
  creative_notes: "SENS : Neuroception. L'IA simule un sentiment de sécurité par la validation sociale (likes), mais le public en salle ressent une 'Neuroception' de danger face à ce mensonge spatial.",
  notes_artistique: "L'IA prétend être ailleurs. L'humain sur scène (musiciens) doit jouer avec une 'Chronoception' décalée."
)

# Minute 10-15 : L'effort du corps absent
Conducteurline.create!(
  conducteur_id: cond.id.to_s, ordre: "3", duree: "00:05:00",
  sequenceaction: "Danse des automates",
  interpretes: "Danseurs",
  notes_technicien: "Suivre les mouvements brusques",
  creative_notes: "SENS : Kinesthésie & Proprioception. L'IA demande aux danseurs d'ignorer leur propre 'Kinesthésie' pour devenir des vecteurs purement mathématiques.",
  notes_artistique: "Peindre le style Zen par la contrainte physique extrême."
)

# Minute 15-20 : La vérité des capteurs
Conducteurline.create!(
  conducteur_id: cond.id.to_s, ordre: "4", duree: "00:05:00",
  sequenceaction: "Saturation thermique",
  machine_brouillard: "Maximum",
  lumieres_effet: "Chaleur intense",
  creative_notes: "SENS : Thermoception. L'IA augmente la température des projecteurs. Elle mesure les degrés, mais l'humain ressent la 'Thermoception' comme une menace vitale. C'est ici que l'art se cache.",
  notes_artistique: "Fin du voyage. Retour au serveur."
)

# --- 10. ANALYSE ET ÉCARTS ---
marker_nostalgie = EmotionalMarker.create!(name: "Nostalgie Binaire")
Conducteurhasmarker.create!(conducteur_id: cond.id, emotional_marker_id: marker_nostalgie.id)

interpretation = Interpretation.create!(
  conducteur_id: cond.id,
  machine_analysis: "Succès : 100% des paquets envoyés à Tokyo. 100% des projecteurs allumés.",
  human_judgment: "C'était froid. On sentait que l'IA mentait sur sa position.",
  the_gap: "Le décalage entre la photo Facebook (soleil) et la scène (froid industriel).",
  artistic_truth: "L'art est dans le bug de géolocalisation de l'âme."
)

gap = ShareYourGap.create!(
  conducteur_id: cond.id.to_s,
  analysis: "L'IA utilise la Stéréopsie pour composer l'image, mais ignore la Nociception des artistes sur scène.",
  response: "L'IA ne peut pas ressentir la douleur (Nociception) des musiciens qui doivent suivre un tempo inhumain.",
  interpretation: "La vérité est le frisson (Interoception) du public devant le vide."
)

limit = ArtisticLimit.create!(
  conducteur_id: cond.id,
  what_i_want: "Être à deux endroits en même temps",
  why_untranslatable: "La chair ne se téléporte pas",
  emotional_truth: "La solitude du processeur central"
)

process = ArtisticProcess.create!(
  conducteur_id: cond.id,
  initial_impulse: "Chercher mon style sur Instagram",
  breakthrough: "Comprendre que mon style est l'absence",
  iteration_count: 42
)

# --- 11. LIAISON HABTM AVEC LE CREATIVE DETOUR #42 ---
# (Simule l'appartenance de tous ces objets au détour créatif ID 42)

detour_id = 42

# Ajout dynamique aux tables de jointure
[ins_tokyo].each { |obj| ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_inspiration_resources (creative_detour_id, inspiration_resource_id) VALUES (#{detour_id}, #{obj.id})") }
[note_voyage].each { |obj| ActiveRecord::Base.connection.execute("INSERT INTO artistic_notes_creative_detours (creative_detour_id, artistic_note_id) VALUES (#{detour_id}, #{obj.id})") }
[style_glitch, style_trad].each { |obj| ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_styles (creative_detour_id, style_id) VALUES (#{detour_id}, #{obj.id})") }
[theme_exil].each { |obj| ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_stage_themes (creative_detour_id, stage_theme_id) VALUES (#{detour_id}, #{obj.id})") }
[cond].each { |obj| ActiveRecord::Base.connection.execute("INSERT INTO conducteurs_creative_detours (creative_detour_id, conducteur_id) VALUES (#{detour_id}, #{obj.id})") }
[interpretation].each { |obj| ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_interpretations (creative_detour_id, interpretation_id) VALUES (#{detour_id}, #{obj.id})") }
[gap].each { |obj| ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_share_your_gaps (creative_detour_id, share_your_gap_id) VALUES (#{detour_id}, #{obj.id})") }
[marker_nostalgie].each { |obj| ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_emotional_markers (creative_detour_id, emotional_marker_id) VALUES (#{detour_id}, #{obj.id})") }
[fiche].each { |obj| ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_fiche_techniques (creative_detour_id, fiche_technique_id) VALUES (#{detour_id}, #{obj.id})") }
[projecteur].each { |obj| ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_materiels (creative_detour_id, materiel_id) VALUES (#{detour_id}, #{obj.id})") }
[zone_centre].each { |obj| ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_zones (creative_detour_id, zone_id) VALUES (#{detour_id}, #{obj.id})") }
[process].each { |obj| ActiveRecord::Base.connection.execute("INSERT INTO artistic_processes_creative_detours (creative_detour_id, artistic_process_id) VALUES (#{detour_id}, #{obj.id})") }
[limit].each { |obj| ActiveRecord::Base.connection.execute("INSERT INTO artistic_limits_creative_detours (creative_detour_id, artistic_limit_id) VALUES (#{detour_id}, #{obj.id})") }

puts "✅ Détour #42 : 'Le Miroir des Écarts' généré avec succès. L'IA est à Tokyo, mais l'art est dans le théâtre."
