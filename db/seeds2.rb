# --- Nettoyage complet ---
puts "Suppression des anciennes données..."
[AmbianceOption, SequenceTemplate, Style, MetierDependency, PlanDeSceneDessin, 
 Conducteurline, Conducteur, MaterielNecessaire, FicheTechnique, ProjetArtistique, 
 Materiel, Zone].each(&:destroy_all)

# =============================================================================
# 1. CONFIGURATION DE RÉGIE (Les "Règles du jeu")
# =============================================================================

puts "1. Création des zones et du matériel..."
back  = Zone.create!(name: "Back",  y_min: 0,  y_max: 30)
mid   = Zone.create!(name: "Mid",   y_min: 31, y_max: 65)
front = Zone.create!(name: "Front", y_min: 66, y_max: 100)

# Catalogue avec réglages de position (x_pref et spread)
m_batterie = Materiel.create!(name: "batterie", zone: back, x_pref: 50, spread: 5, on_stage: true, maximum: 1, power_needed: true)
m_guitare  = Materiel.create!(name: "ampli guitare", zone: back, x_pref: 80, spread: 10, on_stage: true, maximum: 2, power_needed: true)
m_basse    = Materiel.create!(name: "ampli basse", zone: back, x_pref: 20, spread: 10, on_stage: true, maximum: 1, power_needed: true)
m_micro    = Materiel.create!(name: "micros", zone: front, x_pref: 50, spread: 40, on_stage: true, maximum: 10)
m_retour   = Materiel.create!(name: "retour de scene (monitor)", zone: front, x_pref: 50, spread: 45, on_stage: true, maximum: 6)
m_pc       = Materiel.create!(name: "branchement ordinateur", zone: nil, on_stage: false, maximum: 2)

puts "2. Configuration des automatismes (Dépendances)..."
# Si on prend une batterie, l'IA ajoutera 4 micros et 1 retour automatiquement
MetierDependency.create!(materiel: m_batterie, required_item_id: m_micro.id, qty_multiplier: 4, note: "Kit batterie")
MetierDependency.create!(materiel: m_batterie, required_item_id: m_retour.id, qty_multiplier: 1, note: "Retour batteur")
# L'ampli guitare a besoin d'un micro pour le son
MetierDependency.create!(materiel: m_guitare, required_item_id: m_micro.id, qty_multiplier: 1, note: "Repiquage ampli")

puts "3. Création des Styles et Ambiances..."
rock = Style.create!(name: "Rock")
["rouge", "stroboscope", "blanc froid"].each do |color|
  AmbianceOption.create!(style: rock, category: "lumieres", value: color)
end
AmbianceOption.create!(style: rock, category: "machine_brouillard", value: "oui - continu")

puts "4. Création des Templates de scénario..."
SequenceTemplate.create!(style: rock, phase: "intro", label: "Entrée scène + Noir", suggested_light: "noir total")
SequenceTemplate.create!(style: rock, phase: "body", label: "Solo intense", suggested_light: "stroboscope")
SequenceTemplate.create!(style: rock, phase: "outro", label: "Salut final", suggested_light: "blanc froid")

# =============================================================================
# 2. SIMULATION D'UN PROJET (Le résultat concret)
# =============================================================================

puts "5. Génération d'un projet complet : 'The Rails Stars - Live'..."

# A. La Fiche Technique
fiche = FicheTechnique.create!(
  name_event: "The Rails Stars - Live",
  eleve_responsable: "DHH Junior",
  date: "2026-06-15",
  professeur_referent: "M. Ruby",
  notes_complementaires: "Attention, volume sonore élevé."
)

# B. Le Matériel Nécessaire (L'utilisateur choisit Batterie + Guitare)
# L'IA devrait normalement utiliser MetierDependency pour ajouter le reste
MaterielNecessaire.create!(fiche_technique: fiche, materiel: m_batterie, quantite: 1)
MaterielNecessaire.create!(fiche_technique: fiche, materiel: m_guitare, quantite: 2)
MaterielNecessaire.create!(fiche_technique: fiche, materiel: m_micro, quantite: 6, precisions_observations: "Chant + Repiquage")

# C. Le Plan de Scène (Positionnement calculé via Materiel et Zone)
# On place la batterie au fond au centre
PlanDeSceneDessin.create!(
  fiche_technique: fiche, 
  materiel_musicien: "batterie", 
  coord_x: 50, coord_y: 15, 
  layer: "back", disposition: "center"
)
# On place les 2 amplis guitare sur les côtés au fond
PlanDeSceneDessin.create!(fiche_technique: fiche, materiel_musicien: "ampli guitare", coord_x: 10, coord_y: 10, layer: "back", disposition: "left")
PlanDeSceneDessin.create!(fiche_technique: fiche, materiel_musicien: "ampli guitare", coord_x: 90, coord_y: 10, layer: "back", disposition: "right")

# D. Le Conducteur (Le déroulé du spectacle)
cond = Conducteur.create!(title: "Setlist Rock", username: "Regisseur_Alpha", fiche_technique_id: fiche.id)

# Ligne 1 : Intro
Conducteurline.create!(
  conducteur_id: cond.id,
  ordre: "1",
  sequenceaction: "Intro - Montage tension",
  lumieres_ambiante: "noir total",
  machine_brouillard: "oui",
  duree: "00:01:00",
  notes_technicien: "Lancer la fumée 30s avant"
)

# Ligne 2 : Le morceau
Conducteurline.create!(
  conducteur_id: cond.id,
  ordre: "2",
  sequenceaction: "Main Riff",
  lumieres_ambiante: "rouge",
  videoprojection: "Logo Groupe",
  duree: "00:04:30"
)

# E. Le Projet Artistique (Le dossier qui lie tout)
ProjetArtistique.create!(
  title: "The Rails Stars - Live",
  username: "DHH Junior",
  status: "Validé",
  style: "Rock",
  fiche_technique_id: fiche.id,
  conducteur_id: cond.id
)

puts "========================================================"
puts "  SEED TERMINÉ : 1 Projet complet prêt à l'affichage ! "
puts "  - Accédez à 'Projets Artistiques' pour voir le résultat."
puts "========================================================"
