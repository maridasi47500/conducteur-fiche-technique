# db/seeds.rb

# --- 1. L'ESPACE COMME ENTREPÔT (Zones & Matériel) ---
rayon_a = Zone.create!(name: "Rayon A - Entrée flux", y_min: 0, y_max: 10)
rayon_b = Zone.create!(name: "Rayon B - Stockage", y_min: 11, y_max: 20)

projecteur_hall = Materiel.create!(
  name: "Projecteur Hall",
  requires_power: true,
  power_needed: true,
  zone_id: rayon_a.id,
  category: "Éclairage Industriel",
  on_stage: true
)

rampe_b = Materiel.create!(
  name: "Rampe Fluorescente B",
  requires_power: true,
  zone_id: rayon_b.id,
  category: "Éclairage Rayon"
)

# --- 2. LA LOGIQUE BINAIRE (MetierDependencies) ---
# L'allumage n'est pas une intention, c'est une réaction électrique.
MetierDependency.create!(
  materiel_id: rampe_b.id,
  required_item_id: projecteur_hall.id,
  qty_multiplier: 1,
  note: "L'allumage de la rampe B est asservi à la détection de présence dans la Zone A."
)

# --- 3. LE CONDUCTEUR SANS ÂME (Conducteurs & Lines) ---
style_froid = Style.create!(name: "Minimalisme Fonctionnel")

conducteur = Conducteur.create!(
  title: "L'Automatisme Aveugle",
  username: "Logistics_Core_v4",
  notes: "Gestion optimisée de l'occupation spatiale."
)

# L'allumage automatique
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  ordre: "Trigger Capteur",
  sequenceaction: "Allumage automatique",
  lumieres_ambiante: "100%",
  duree: "00:00:05",
  interpretes: "Système",
  son: "Bourdonnement électrique constant (50Hz)",
  notes_technicien: "Vérifier le voltage. Aucun fondu programmé.",
  creative_notes: "La lumière est crue, chirurgicale."
)

# L'arrêt brutal
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  ordre: "Seuil CO2 Atteint",
  sequenceaction: "Extinction de sécurité",
  lumieres_ambiante: "0%",
  notes_artistique: "L'IA ne supporte pas le dépassement des seuils. Elle coupe le monde."
)

# --- 4. LE MALENTENDU ÉMOTIONNEL (Interpretations & Gaps) ---
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Consommation énergétique optimisée. Cycle de vie des lampes préservé.",
  human_judgment: "Une lumière qui semble 'vraie' par sa puissance, mais qui est 'morte' par son manque d'âme.",
  the_gap: "Le voyageur ressent une ambiance dramatique, l'IA voit un voltage et un flux de données.",
  artistic_truth: "La perfection sans intention est une forme de silence."
)

ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "Temps de présence dépassé. Rentabilité lumineuse nulle.",
  interpretation: "Le spectateur est plongé dans le noir au moment où il commençait à rêver.",
  response: "L'IA ne comprend pas la frustration : la tâche 'Éclairage' est simplement terminée."
)

# --- 5. L'ACCIDENT ESTHÉTIQUE (ArtisticLimits) ---
ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Maintenir la visibilité des produits.",
  why_untranslatable: "Le sentiment de vertige devant l'immensité des rayons.",
  left_unintentional: "L'ombre portée sur le visage du voyageur (l'IA ne sait pas qu'elle a créé un clair-obscur magnifique).",
  emotional_truth: "La beauté ici est une erreur de calcul."
)

# --- 6. LE POINT MORT (ShowThemes) ---
ShowTheme.create!(
  projet_artistique_id: 1,
  title: "L'Entrepôt du Monde",
  philosophical_inquiry: "Peut-on habiter un espace géré par un inventaire ?",
  ai_blind_spot: "La différence entre flâner (perte de temps) et consommer (action tracée).",
  emotional_frequency: "Linéaire / Neutre"
)

puts "Automatisme activé : La lumière est désormais une donnée, plus une émotion."
