# --- Nettoyage de la base de données ---
puts "Nettoyage de la base..."
AmbianceOption.destroy_all
SequenceTemplate.destroy_all
Style.destroy_all
MetierDependency.destroy_all
MaterielNecessaire.destroy_all
Materiel.destroy_all
Zone.destroy_all

# --- 1. Création des Zones de scène ---
puts "Création des zones..."
back  = Zone.create!(name: "Back",  y_min: 0,  y_max: 30)
mid   = Zone.create!(name: "Mid",   y_min: 31, y_max: 65)
front = Zone.create!(name: "Front", y_min: 66, y_max: 100)

# --- 2. Création du Catalogue Matériel ---
puts "Remplissage du catalogue matériel..."
# Format: [Nom, Zone, X_pref, Spread, On_Stage, Max]
materiel_list = [
  ["batterie", back, 50, 10, true, 1],
  ["ampli basse", back, 20, 5, true, 2],
  ["ampli guitare", back, 80, 5, true, 2],
  ["praticable (estrade)", back, 50, 40, true, 1],
  ["piano numerique", mid, 15, 10, true, 1],
  ["pupitres", mid, 50, 40, true, 10],
  ["chaises", mid, 50, 40, true, 10],
  ["percussion", mid, 75, 10, true, 5],
  ["micros", front, 50, 40, true, 10],
  ["retour de scene (monitor)", front, 50, 45, true, 4],
  ["ecran/videoprojecteur", nil, 50, 0, false, 1],
  ["branchement ordinateur", nil, 50, 0, false, 1]
]

materiels_objs = {}
materiel_list.each do |name, zone, x, s, stage, max|
  materiels_objs[name] = Materiel.create!(
    name: name,
    zone: zone,
    x_pref: x,
    spread: s,
    on_stage: stage,
    maximum: max,
    power_needed: ["batterie", "ampli basse", "ampli guitare", "piano numerique"].include?(name)
  )
end

# --- 3. Dépendances Métier (Logique technique) ---
puts "Configuration des dépendances métiers..."
# La batterie demande 4 micros
MetierDependency.create!(
  materiel: materiels_objs["batterie"],
  required_item_id: materiels_objs["micros"].id,
  qty_multiplier: 4,
  note: "Overheads et Grosse caisse"
)

# La batterie demande aussi un praticable
MetierDependency.create!(
  materiel: materiels_objs["batterie"],
  required_item_id: materiels_objs["praticable (estrade)"].id,
  qty_multiplier: 1
)

# L'ampli guitare demande un micro pour le repiquage
MetierDependency.create!(
  materiel: materiels_objs["ampli guitare"],
  required_item_id: materiels_objs["micros"].id,
  qty_multiplier: 1,
  note: "Repiquage SM57"
)

# --- 4. Styles et Ambiances ---
puts "Création des styles et ambiances..."

# -- Style JAZZ
jazz = Style.create!(name: "Jazz")
[
  ["lumieres", "blanc chaud"], ["lumieres", "bleu nuit"], ["lumieres", "douche"],
  ["machine_brouillard", "non"], ["machine_brouillard", "oui - 10 sec"]
].each { |cat, val| AmbianceOption.create!(style: jazz, category: cat, value: val) }

# -- Style ROCK
rock = Style.create!(name: "Rock")
[
  ["lumieres", "rouge"], ["lumieres", "stroboscope"], ["lumieres", "jaune"],
  ["machine_brouillard", "oui - continu"], ["machine_brouillard", "oui"]
].each { |cat, val| AmbianceOption.create!(style: rock, category: cat, value: val) }

# --- 5. Templates de Séquences (Conducteur) ---
puts "Génération des templates de séquences..."

# Templates pour le Rock
SequenceTemplate.create!(
  style: rock,
  label: "Entrée fracassante",
  phase: "intro",
  target_talent: "Tous",
  suggested_light: "stroboscope",
  intensity: "100%"
)

SequenceTemplate.create!(
  style: rock,
  label: "Solo Guitare",
  phase: "body",
  target_talent: "Musicien/ne",
  suggested_light: "douche",
  intensity: "80%"
)

# Templates pour le Jazz
SequenceTemplate.create!(
  style: jazz,
  label: "Ambiance Club",
  phase: "body",
  target_talent: "Tous",
  suggested_light: "bleu nuit",
  intensity: "40%"
)

SequenceTemplate.create!(
  style: jazz,
  label: "Final Doux",
  phase: "outro",
  target_talent: "Tous",
  suggested_light: "blanc chaud",
  intensity: "20%"
)

puts "--- SEED TERMINE AVEC SUCCÈS ---"
