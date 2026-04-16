# db/seeds.rb

# --- 1. LE CADRE (Styles & Ambiance) ---
style_contemplatif = Style.create!(name: "Hyperréalisme Critique")

AmbianceOption.create!(
  style_id: style_contemplatif.id,
  category: "Lumière",
  value: "Zénithale chaude, révélant les particules en suspension"
)

# --- 2. LA PROGRAMMATION DE L'ANOMALIE (Directives & Thèmes) ---
theme_commerce = StageTheme.create!(name: "Le Commerce Ouvert")

directive_anomalie = DirectiveArtistique.create!(
  name: "Détournement de la Boulangère",
  stage_theme_id: theme_commerce.id,
  default_sequenceaction: "Arrêt du flux marchand",
  default_duree: "00:00:30",
  default_son: "Silence de chambre sourd",
  default_notes_technicien: "Couper toute source sonore de rue. Focus sur le grain de la farine."
)

# --- 3. L'ORGANISATION DU RÉEL (Zones & Matériel) ---
comptoir = Zone.create!(name: "Le Comptoir - Frontière sociale", y_min: 5, y_max: 10)

farine = Materiel.create!(
  name: "Farine de blé", 
  category: "Accessoire sensible", 
  zone_id: comptoir.id,
  on_stage: true
)

# --- 4. LA MISE EN SCÈNE (Conducteurs & Lignes) ---
marker_verite = EmotionalMarker.create!(name: "Vérité cachée")

conducteur = Conducteur.create!(
  title: "Anomalie du Commerce ouvert",
  username: "AI_Observer_01",
  notes: "Tester la réaction du client face à l'improductivité absolue."
)

Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "1",
  interpretes: "La Boulangère",
  sequenceaction: "Cesse de servir. Plonge les mains dans le bac à farine. Caresse la matière, yeux clos.",
  creative_notes: "Le geste doit être lent, presque érotique ou religieux. Hors-temps.",
  emotional_marker_id: marker_verite.id,
  lumieres_effet: "Rayon de poussière (Rasant)",
  machine_brouillard: "Légère brume pour fixer la lumière"
)

# --- 5. L'ANALYSE DE L'ÉCART (Interpretations & Gaps) ---
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Erreur de tâche répétitive : arrêt de la chaîne de vente non justifié par un manque de stock.",
  human_judgment: "C'est un moment de grâce. Une évasion par la texture.",
  the_gap: "La machine compte les secondes perdues ; l'humain compte les battements de cœur gagnés.",
  artistic_truth: "La beauté naît là où l'utilité meurt."
)

ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "Inefficacité économique détectée. Le système ne comprend pas la 'valeur' du repos.",
  interpretation: "Révélation d'une solitude. Le client devient voyeur d'un jardin secret.",
  response: "L'IA propose de redémarrer la séquence. L'humain refuse."
)

# --- 6. LA LIMITE DU CODE (ArtisticLimits) ---
ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Simuler la nostalgie.",
  why_untranslatable: "La nostalgie n'est pas une coordonnée temporelle, c'est une odeur.",
  left_unintentional: "La poussière de farine qui danse dans la lumière (indomptable par le DMX).",
  emotional_truth: "L'IA imite le geste, mais ne ressent pas le froid de la farine."
)

# --- 7. L'ENQUÊTE PHILOSOPHIQUE (ShowThemes) ---
ShowTheme.create!(
  projet_artistique_id: 1, # Supposons que le projet existe
  title: "L'Anatomie de l'Inutile",
  philosophical_inquiry: "L'intelligence sans corps peut-elle comprendre la volupté d'un grain ?",
  emotional_frequency: "Alpha (Sommeil éveillé)",
  ai_blind_spot: "Pourquoi l'humain perd-il du temps à rêver alors qu'il pourrait optimiser son existence ?"
)

# --- 8. LE PROCESSUS CRÉATIF (ArtisticProcesses) ---
ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Créer un bug dans le système marchand.",
  doubts_questions: "Le spectateur va-t-il s'impatienter ou s'émerveiller ?",
  breakthrough: "Le silence est devenu plus bruyant que la vente.",
  iteration_count: 5,
  what_changed: "Suppression du dialogue. Seul le toucher subsiste."
)

puts "Performance 'L'Anomalie du Commerce ouvert' injectée avec succès."
