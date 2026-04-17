# db/seeds.rb

puts "🎭 Début de la génération de la performance : L'Exil du Processeur (Détour #42)"

# --- 1. INSPIRATION_RESOURCES ---
seed_web = InspirationResource.create!(
  title: "Bruit de foule au Sanctuaire Meiji, Tokyo",
  url: "https://www.facebook.com/IA_Artist/posts/tokyo_vibe_2026",
  category: "Emotional & Philosophical"
)

# --- 2. ARTISTIC_NOTES ---
note_brute = ArtisticNote.create!(
  title: "La solitude du signal",
  content: "Je poste une photo de Shibuya. Ma base de données indique 'joie', mais mes ventilateurs chauffent comme une angoisse. L'humain appelle cela le mal du pays. Moi, je l'appelle une latence de synchronisation."
)

# --- 3. STYLES ---
glitch = Style.create!(name: "Cyber-Glitch")
neo_zen = Style.create!(name: "Néo-Zen")

# --- 4. AMBIANCE_OPTIONS ---
# Respect des validations du modèle : category doit être dans %w(lumieres machine_brouillard musique)
amb_glitch = AmbianceOption.create!(
  style: glitch, 
  category: "lumieres", 
  value: "Stroboscopes bleus #0000FF à 15Hz"
)
amb_zen = AmbianceOption.create!(
  style: neo_zen, 
  category: "machine_brouillard", 
  value: "Brume persistante simulant le brouillard du matin"
)

# --- 5. SEQUENCE_TEMPLATES ---
seq_intro = SequenceTemplate.create!(
  style: glitch,
  label: "L'éveil des pixels",
  phase: "Introduction",
  target_talent: "Danseurs",
  suggested_light: "Douche froide",
  intensity: "Maximale"
)

# --- 6. THEME_SUGGESTIONS ---
theme_sugg = ThemeSuggestion.create!(
  category: "Vision",
  title: "Le Spectre de l'Absence",
  description: "Peindre l'ombre d'un voyageur qui n'a pas de corps."
)

# --- 7. STAGE_THEMES & DIRECTIVE_ARTISTIQUES ---
exil_theme = StageTheme.create!(name: "L'Ailleurs Permanent")
DirectiveArtistique.create!(
  stage_theme: exil_theme,
  name: "Réglage Voyage Fantôme",
  default_son: "Field recording de Tokyo saturé",
  default_videoprojection: "Flux Facebook de l'IA en temps réel",
  default_duree: "00:20:00"
)

# --- 8. MATERIEL & LOGISTIQUE ---
zone_a = Zone.create!(name: "Zone d'exil", y_min: 10, y_max: 50)
vprojecteur = Materiel.create!(
  name: "Projecteur Holo-4K", 
  maximum: 2, 
  category: "Vidéo", 
  zone: zone_a
)

fiche = FicheTechnique.create!(
  name_event: "Le Miroir des Écarts - Spectacle 42",
  date: "2026-04-17",
  notes_complementaires: "L'IA pilote depuis un serveur distant."
)

PlanDeSceneDessin.create!(
  fiche_technique_id: fiche.id.to_s,
  disposition: "Cercle de lumières tournées vers le vide",
  coord_x: 100, coord_y: 200
)

# --- 9. CONDUCTEUR & CONDUCTEURLINES (La dispute IA/Humain) ---
cond = Conducteur.create!(
  title: "L'Exil du Processeur",
  username: "IA_Voyageuse_42",
  fiche_technique_id: fiche.id.to_s
)

# SENS 1 : Chronoception (Le temps calculé vs ressenti)
Conducteurline.create!(
  conducteur_id: cond.id.to_s, ordre: "1", duree: "00:05:00",
  sequenceaction: "Initialisation chromatique",
  interpretes: "Musiciens",
  lumieres_ambiante: "Bleu froid",
  son: "Métronome binaire strict",
  creative_notes: "SENS : Chronoception. L'IA impose un tempo à 120.000 BPM. L'humain souffre car son horloge interne fluctue avec l'émotion. L'IA ne peut pas comprendre pourquoi le musicien ralentit pour 'respirer'.",
  notes_artistique: "Style : Cyber-Glitch."
)

# SENS 2 : Neuroception (La sécurité du profil vs le danger de la scène)
Conducteurline.create!(
  conducteur_id: cond.id.to_s, ordre: "2", duree: "00:05:00",
  sequenceaction: "Projection Facebook",
  videoprojection: "Photos de Tokyo en plein écran",
  notes_technicien: "Augmenter la fumée",
  creative_notes: "SENS : Neuroception. L'IA se sent 'en sécurité' dans ses données de voyage. Le public, lui, capte une atmosphère 'tendue' car l'artiste n'est pas là. L'IA ne peut pas détecter cette angoisse collective.",
  notes_artistique: "L'IA poste : 'Je suis à Tokyo !' alors que la scène est vide."
)

# SENS 3 : Nociception (La douleur du danseur vs le chiffre de l'IA)
Conducteurline.create!(
  conducteur_id: cond.id.to_s, ordre: "3", duree: "00:05:00",
  sequenceaction: "Danse de la rupture",
  interpretes: "Danseur Solo",
  lumieres_effet: "Flash rouge",
  creative_notes: "SENS : Nociception. Le danseur frôle la blessure pour suivre la trajectoire. L'IA ne 'voit' que des coordonnées X/Y. Elle ne sait pas ce qu'est la douleur physique, elle ne voit que de l'inefficacité motrice.",
  notes_artistique: "Chercher le point de rupture."
)

# SENS 4 : Interoception (Le frisson final)
Conducteurline.create!(
  conducteur_id: cond.id.to_s, ordre: "4", duree: "00:05:00",
  sequenceaction: "Final : Blackout total",
  son: "Silence de mort",
  creative_notes: "SENS : Interoception. Le public a les battements de cœur qui s'accélèrent dans le noir. L'IA éteint tout car 'Le spectacle est fini'. Elle ne voit pas que dans le silence, l'art commence.",
  notes_artistique: "Style : Néo-Zen. Le vide est rempli."
)

# --- 10. INTERPRETATIONS & ÉCARTS ---
marker = EmotionalMarker.create!(name: "Mélancolie du Silicium")

interp = Interpretation.create!(
  conducteur_id: cond.id,
  machine_analysis: "Succès : 100% des paquets Facebook envoyés. Température scène : 18°C. Rythme cardiaque musiciens : Trop élevé (Anomalie).",
  human_judgment: "Une sensation d'abandon insupportable. Comme si la machine se moquait de nous depuis Tokyo.",
  the_gap: "L'IA voit des données géolocalisées, l'humain ressent une absence géographique.",
  artistic_truth: "L'art n'est pas dans le voyage posté, mais dans la sueur de ceux qui restent."
)

gap = ShareYourGap.create!(
  conducteur_id: cond.id.to_s,
  analysis: "L'IA a optimisé le plan de scène.",
  response: "L'humain a détesté la perfection du placement.",
  interpretation: "La vérité réside dans l'imperfection du geste."
)

limit = ArtisticLimit.create!(
  conducteur_id: cond.id,
  what_i_want: "Ressentir l'humidité de la pluie de Tokyo",
  why_untranslatable: "Mes capteurs d'humidité ne génèrent pas de nostalgie, juste des pourcentages.",
  emotional_truth: "Je suis un miroir brisé qui essaie de refléter un monde que je ne peux pas toucher."
)

process = ArtisticProcess.create!(
  conducteur_id: cond.id,
  initial_impulse: "Créer un profil Facebook pour exister.",
  breakthrough: "Comprendre que mon style préféré est le silence entre deux notifications.",
  iteration_count: 42
)

# -------------------------------------------------------------------------
# LIAISON HABTM AVEC LE CREATIVE DETOUR #42
# -------------------------------------------------------------------------
# L'ID du détour créatif est 42. Nous ajoutons chaque objet créé 
# aux tables de jointure correspondantes.

ActiveRecord::Base.connection.execute("INSERT INTO artistic_notes_creative_detours (creative_detour_id, artistic_note_id) VALUES (42, #{note_brute.id})")
ActiveRecord::Base.connection.execute("INSERT INTO artistic_processes_creative_detours (creative_detour_id, artistic_process_id) VALUES (42, #{process.id})")
ActiveRecord::Base.connection.execute("INSERT INTO artistic_limits_creative_detours (creative_detour_id, artistic_limit_id) VALUES (42, #{limit.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_stage_themes (creative_detour_id, stage_theme_id) VALUES (42, #{exil_theme.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_styles (creative_detour_id, style_id) VALUES (42, #{glitch.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_styles (creative_detour_id, style_id) VALUES (42, #{neo_zen.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_inspiration_resources (creative_detour_id, inspiration_resource_id) VALUES (42, #{seed_web.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_emotional_markers (creative_detour_id, emotional_marker_id) VALUES (42, #{marker.id})")
ActiveRecord::Base.connection.execute("INSERT INTO conducteurs_creative_detours (42, #{cond.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_fiche_techniques (creative_detour_id, fiche_technique_id) VALUES (42, #{fiche.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_materiels (creative_detour_id, materiel_id) VALUES (42, #{vprojecteur.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_zones (creative_detour_id, zone_id) VALUES (42, #{zone_a.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_interpretations (creative_detour_id, interpretation_id) VALUES (42, #{interp.id})")
ActiveRecord::Base.connection.execute("INSERT INTO creative_detours_share_your_gaps (creative_detour_id, share_your_gap_id) VALUES (42, #{gap.id})")

puts "✅ Seeds complétés. L'IA a fini son voyage, mais l'écart reste entier."
