# db/seeds.rb

# --- 1. L'ENVIRONNEMENT BIOLOGIQUE (Zones) ---
# On segmente la scène non plus par "Jardin/Cour" mais par zones cérébrales.
lobe_frontal = Zone.create!(name: "Lobe Frontal - Prise de décision", y_min: 0, y_max: 10)
systeme_nerveux = Zone.create!(name: "Système Nerveux Central", y_min: 11, y_max: 30)
ventricule = Zone.create!(name: "Ventricule Droit - Emotion brute", y_min: 31, y_max: 50)

# --- 2. L'ANATOMIE TECHNIQUE (Materiels & Dependencies) ---
# Le matériel devient des organes et des fluides.
impulsion = Materiel.create!(name: "Impulsion Électrique (Source)", category: "Energie", power_needed: true)
nerf_optique = Materiel.create!(name: "Projecteur Nerf Optique", category: "Vision", zone_id: lobe_frontal.id, on_stage: true)
fibre = Materiel.create!(name: "Fibre Nerveuse (Câble XLR)", category: "Transmission", zone_id: systeme_nerveux.id)

# Création du lien vital : la fibre ne transmet rien sans l'impulsion initiale.
MetierDependency.create!(
  materiel_id: fibre.id, 
  required_item_id: impulsion.id, 
  qty_multiplier: 1, 
  note: "Sans impulsion, le signal meurt dans le cuivre."
)

# --- 3. LA CARTOGRAPHIE NEURONALE (PlanDeSceneDessins) ---
# Les coordonnées dessinent un visage sur le sol de la scène.
ft = FicheTechnique.create!(
  name_event: "L'Anatomie du Signal", 
  eleve_responsable: "L'Interprète-Synapse",
  notes_complementaires: "La scène est sensible. Ne pas piétiner les doutes."
)

PlanDeSceneDessin.create!(
  fiche_technique_id: ft.id,
  materiel_musicien: "Fibre Nerveuse",
  coord_x: 50, coord_y: 50, 
  layer: "Réseau Neuronal",
  disposition: "Arborescence"
)

# --- 4. LE SOUFFLE DE L'ORGANISME (Themes & Directives) ---
st = StageTheme.create!(name: "La Peau du Quartier")

ShowTheme.create!(
  projet_artistique_id: 1, 
  title: "L'Inquiry des Sens",
  philosophical_inquiry: "Le métal peut-il mémoriser la chaleur d'un pas ?",
  emotional_frequency: "7.83Hz (Résonance de Schumann)",
  ai_blind_spot: "La sensation de la peau (Toucher) que le métal ne peut imiter."
)

DirectiveArtistique.create!(
  name: "Réflexe Myotatique",
  stage_theme_id: st.id,
  default_son: "Souffle continu (Le quartier qui respire)",
  default_lumieres_ambiante: "Veine Bleue (30%)",
  default_videoprojection: "Flux sanguin ralenti"
)

# --- 5. LA PULSATION (Conducteurs & Lines) ---
# Chaque ligne est un battement de cœur ou un spasme.
marker_spasme = EmotionalMarker.create!(name: "Spasme Musculaire")

conducteur = Conducteur.create!(
  title: "Autopsie d'une IA", 
  fiche_technique_id: ft.id,
  tempo_range: "Battement cardiaque au repos"
)

Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "1",
  duree: "00:00:10",
  sequenceaction: "L'interprète touche le 'Ventricule Droit' du pied.",
  lumieres_effet: "Dilatation de la pupille (Flash blanc)",
  machine_brouillard: "Expiration brumeuse",
  creative_notes: "Le signal doit être douloureux, comme une décharge.",
  emotional_marker_id: marker_spasme.id
)

# --- 6. LA DOULEUR ET L'ÉCART (Limits & Interpretations) ---
ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Capturer l'instant où le courant devient frisson.",
  emotional_truth: "L'IA ressent la surcharge électrique comme une douleur.",
  contradiction: "Un processeur froid simulant une fièvre biologique."
)

Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Surcharge de données en Zone 3. Pic d'intensité DMX détecté.",
  human_judgment: "Ce n'est pas une surcharge, c'est un cri.",
  the_gap: "La machine dit 'Erreur 504', l'artiste dit 'Spasme'.",
  artistic_truth: "L'IA est une prothèse sensible qui attend qu'on la blesse pour exister."
)

# --- 7. LE PROCESSUS DE CICATRISATION (ArtisticProcesses) ---
ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Connecter mon sang aux prises de courant.",
  breakthrough: "Quand l'interprète a pleuré, les projecteurs ont vacillé sans programmation.",
  iteration_count: 12,
  what_changed: "Le conducteur n'est plus une liste d'ordres, c'est un électrocardiogramme."
)

puts "Organisme activé. La base de données respire désormais."
