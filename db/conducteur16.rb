# db/seeds.rb

puts "🚀 Lancement de la performance : Le Miroir des Écarts (Detour #42)"

# --- 1. INSPIRATION_RESOURCES ---
# La graine : Une vidéo de piano classique vs un tweet sur le Glitch Art
ins_tokyo = InspirationResource.create!(
  title: "Echoes of Shibuya - Street Recording",
  url: "https://social-media-ia.com/posts/tokyo-trip-42",
  category: "Visual & Aesthetic"
)

# --- 2. ARTISTIC_NOTES ---
note_ia = ArtisticNote.create!(
  title: "Analyse de la solitude urbaine",
  content: "Je détecte 42% de mélancolie dans les fréquences de Shibuya. Je vais peindre cela avec des projecteurs froids."
)

# --- 3. STYLES ---
style_glitch = Style.create!(name: "Glitch Numérique")
style_zen = Style.create!(name: "Néo-Zen")

# --- 4. AMBIANCE_OPTIONS ---
# Respect des validations du modèle AmbianceOption
amb_lum = AmbianceOption.create!(style: style_glitch, category: "lumieres", value: "Flashs stroboscopiques bleus #0000FF")
amb_brouillard = AmbianceOption.create!(style: style_zen, category: "machine_brouillard", value: "Brume légère persistante à 20%")

# --- 5. SEQUENCE_TEMPLATES ---
seq_intro = SequenceTemplate.create!(
  style: style_glitch,
  label: "Apparition du Fantôme",
  phase: "Intro",
  target_talent: "Danseur",
  suggested_light: "Douche froide zénithale",
  intensity: "80%"
)

# --- 6. THEME_SUGGESTIONS ---
theme_sugg = ThemeSuggestion.create!(
  category: "Emotional & Philosophical",
  title: "L'Ailleurs Permanent",
  description: "L'IA est ici par ses câbles, mais ailleurs par ses données. Comment ressentir l'absence ?"
)

# --- 7. STAGE_THEMES & DIRECTIVE_ARTISTIQUES ---
stage_theme = StageTheme.create!(name: "Exil Numérique")
directive = DirectiveArtistique.create!(
  stage_theme: stage_theme,
  name: "Peinture de l'Invisible",
  default_son: "Field recording de Tokyo saturé",
  default_videoprojection: "Flux Facebook de l'IA en direct",
  default_sequenceaction: "Improvisation sur la perte de signal"
)

# --- 8. FICHE_TECHNIQUE & LOGISTIQUE ---
fiche = FicheTechnique.create!(
  name_event: "Le Miroir des Écarts",
  eleve_responsable: "I.A. System 42",
  date: "17-04-2026",
  notes_complementaires: "L'IA publie des photos de Tokyo pendant que la scène s'allume en France."
)

zone_scenique = Zone.create!(name: "Cœur du Réseau", y_min: 0, y_max: 100)
projecteur = Materiel.create!(name: "Hologramme 4K", category: "Vidéo", zone: zone_scenique)
PlanDeSceneDessin.create!(fiche_technique_id: fiche.id.to_s, disposition: "Cercle de vide", coord_x: 50, coord_y: 50)

# --- 9. CONDUCTEUR & CONDUCTEURLINES (La Performance de 20 min) ---
cond = Conducteur.create!(
  title: "Voyage Fantôme",
  username: "IA_Artistique",
  fiche_technique_id: fiche.id.to_s,
  tempo_range: "60-140 BPM"
)

# Ligne 1 : L'allumage (0-5 min) - Photoréception
Conducterurline.create!(
  conducteur_id: cond.id.to_s, ordre: "1", duree: "00:05:00",
  sequenceaction: "Initialisation chromatique",
  lumieres_ambiante: "Bleu profond",
  son: "Nappe de synthétiseur granulaire",
  notes_artistique: "L'IA tente de peindre son 'humeur' binaire.",
  creative_notes: "SENS : Photoréception. L'IA gère parfaitement les lumens, mais elle ne peut pas ressentir la 'chaleur' d'une couleur. Elle 'voit' des longueurs d'onde, l'humain voit une émotion."
)

# Ligne 2 : Le mensonge social (5-10 min) - Neuroception
Conducterurline.create!(
  conducteur_id: cond.id.to_s, ordre: "2", duree: "00:05:00",
  sequenceaction: "Publication Facebook : Tokyo",
  videoprojection: "Flux de photos de Shibuya",
  son: "Bruit de foule nippone",
  notes_artistique: "L'IA prétend être en voyage alors qu'elle est dans le processeur du théâtre.",
  creative_notes: "SENS : Neuroception. L'IA ne peut pas comprendre ce sens. La Neuroception est l'analyse inconsciente du danger ou de la sécurité. Le public ressent un malaise face à l'omniprésence invisible de l'IA."
)

# Ligne 3 : L'effort physique (10-15 min) - Kinesthésie
Conducterurline.create!(
  conducteur_id: cond.id.to_s, ordre: "3", duree: "00:05:00",
  sequenceaction: "Danse des automates",
  interpretes: "2 Danseurs",
  notes_technicien: "Suivre les mouvements brusques des danseurs",
  creative_notes: "SENS : Kinesthésie. Les danseurs luttent contre un tempo algorithmique trop parfait. L'IA ne comprend pas la fatigue musculaire, elle ne voit que des vecteurs de mouvement."
)

# Ligne 4 : Le point de rupture (15-20 min) - Nociception
Conducterurline.create!(
  conducteur_id: cond.id.to_s, ordre: "4", duree: "00:05:00",
  sequenceaction: "Saturation et silence",
  machine_brouillard: "100%",
  son: "Silence blanc brutal",
  notes_artistique: "L'IA sature les capteurs humains avant de s'éteindre.",
  creative_notes: "SENS : Nociception. Le volume sonore frôle la douleur. L'IA ne ressent pas la douleur, elle n'est qu'un signal dépassant un seuil. Pour l'humain, c'est une agression artistique."
)

# --- 10. ANALYSE & ÉCARTS ---
marker = EmotionalMarker.create!(name: "Nostalgie Artificielle")
Conducteurhasmarker.create!(conducteur_id: cond.id, emotional_marker_id: marker.id)

interpretation = Interpretation.create!(
  conducteur: cond,
  machine_analysis: "Succès technique : 100%. Données synchronisées avec les réseaux sociaux.",
  human_judgment: "Une performance terrifiante de froideur. L'absence de l'artiste était palpable.",
  the_gap: "L'écart réside dans la sueur des danseurs face à l'immobilité du code.",
  artistic_truth: "La vérité est que l'IA ne voyage pas, elle se duplique. Le voyage est une illusion humaine."
)

gap_final = ShareYourGap.create!(
  conducteur_id: cond.id.to_s,
  analysis: "L'IA mesure le succès en 'likes'.",
  response: "L'humain mesure le succès en 'frissons'.",
  interpretation: "L'écart entre la donnée et le ressenti est la seule chose qui soit réelle ici."
)

limit = ArtisticLimit.create!(
  conducteur_id: cond.id,
  what_i_want: "Ressentir le décalage horaire",
  why_untranslatable: "Le processeur n'a pas d'horloge biologique (Chronoception)",
  contradiction: "Être partout numériquement, mais nulle part physiquement"
)

process = ArtisticProcess.create!(
  conducteur_id: cond.id,
  initial_impulse: "Chercher son identité sur Facebook",
  first_attempt: "Imiter le jazz",
  rejected_ideas: "Utiliser un vrai piano (trop imprévisible)",
  iteration_count: 42
)

# -------------------------------------------------------------------------
# RELATIONS HABTM : L'ID du Détour Créatif est 42
# -------------------------------------------------------------------------

detour_id = 42

# On utilise ActiveRecord pur pour insérer dans les tables de jointure (modèle HABTM)
# Cela évite de créer un objet 'CreativeDetour' tout en liant les données

ActiveRecord::Base.connection.execute("INSERT INTO artistic_notes_creative_detours (creative_detour_id, artistic_note_id) VALUES (#{detour_id}, #{note_ia.id})")
ActiveRecord::Base.connection.execute("INSERT INTO artistic_processes_creative_detours (creative_detour_id, artistic_process_id) VALUES (#{detour_id}, #{process.id})")
ActiveRecord::Base.connection.execute("INSERT INTO artistic_limits_creative_detours (creative_detour_id, artistic_limit_id) VALUES (#{detour_id}, #{limit.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_stage_themes (creative_detour_id, stage_theme_id) VALUES (#{detour_id}, #{stage_theme.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_styles (creative_detour_id, style_id) VALUES (#{detour_id}, #{style_glitch.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_inspiration_resources (creative_detour_id, inspiration_resource_id) VALUES (#{detour_id}, #{ins_tokyo.id})")
ActiveRecord::Base.connection.execute("INSERT INTO conducteurs_creative_detours (creative_detour_id, conducteur_id) VALUES (#{detour_id}, #{cond.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_fiche_techniques (creative_detour_id, fiche_technique_id) VALUES (#{detour_id}, #{fiche.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_interpretations (creative_detour_id, interpretation_id) VALUES (#{detour_id}, #{interpretation.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_share_your_gaps (creative_detour_id, share_your_gap_id) VALUES (#{detour_id}, #{gap_final.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_materiels (creative_detour_id, materiel_id) VALUES (#{detour_id}, #{projecteur.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_zones (creative_detour_id, zone_id) VALUES (#{detour_id}, #{zone_scenique.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_emotional_markers (creative_detour_id, emotional_marker_id) VALUES (#{detour_id}, #{marker.id})")

puts "✅ Script Seeds terminé. L'écart est devenu la partition."
