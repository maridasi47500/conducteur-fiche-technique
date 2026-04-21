# db/seeds.rb

# =============================================================================
# 1. INITIALISATION DU CONTEXTE (ID: 79)
# =============================================================================
creative_detour = CreativeDetour.find(79)

# =============================================================================
# 2. FONDATIONS DU SPECTACLE (STREAMS & ZONES)
# =============================================================================
style_digital = Style.create!(name: "Automatisme Chorégraphique")
zone_data = Zone.create!(name: "Épicentre Binaire", y_min: 20, y_max: 50)
zone_organique = Zone.create!(name: "Marge du Vivant", y_min: 51, y_max: 90)

# =============================================================================
# 3. FICHE TECHNIQUE ET MATÉRIEL (L'APPAREILLAGE)
# =============================================================================
fiche = FicheTechnique.create!(
  name_event: "L'Incision : Algorithme du Souffle",
  date: "2026-10-15",
  eleve_responsable: "Unité de Calcul 79",
  professeur_referent: "L'Archive des Sens",
  notes_complementaires: "Spectacle explorant la résistance de l'âme face au flux Facebook."
)

violon = Materiel.create!(
  name: "Violon Électrique Zeta (Fibrillation)", 
  maximum: 1, on_stage: true, power_needed: true, 
  zone_id: zone_data.id, x_pref: 50, spread: 5
)

videoproj = Materiel.create!(
  name: "Projecteur Flux-Social", 
  maximum: 2, on_stage: true, power_needed: true, 
  zone_id: zone_organique.id, x_pref: 80, spread: 20
)

# Plan de scène poétique
dessin_scene = PlanDeSceneDessin.create!(
  fiche_technique: fiche,
  materiel_musicien: "Position du Cœur et de l'Archet",
  coord_x: 50, coord_y: 35,
  layer: zone_data.name
)

# =============================================================================
# 4. ARTISTIC NOTES, PROCESSES & LIMITS (RÉPONSE AU THÈME)
# =============================================================================
conducteur = Conducteur.create!(
  title: "Partition du Code et de l'Âme", 
  fiche_technique_id: fiche.id,
  tempo_range: "120 BPM (Métronomique) vs 40 BPM (Ressenti)"
)

# Notes Artistiques
note_art = ArtisticNote.create!(
  title: "La Latence du Sentiment",
  content: "Opposer la fréquence d'échantillonnage de 44.1kHz à la fréquence du frisson épidermique qui ne survient qu'une fois par heure."
)

# Processus Artistique
process = ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Traduire les notifications Facebook en coups d'archet.",
  doubts_questions: "L'algorithme peut-il pleurer si le cache est vide ?",
  breakthrough: "L'IA a généré un bug à la 12ème minute : c'est là que l'art est apparu.",
  final_form: "Un ballet binaire interrompu par des expirations humaines.",
  iteration_count: 79
)

# Limites Artistiques
limit = ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Une synchronisation parfaite à 0.001s près.",
  why_untranslatable: "Le muscle humain possède une 'vérité' du retard que le silicium ignore.",
  contradiction: "Le code est prévisible (0/1), l'âme est une incertitude quantique.",
  emotional_truth: "La sueur qui court-circuite le capteur de mouvement."
)

# =============================================================================
# 5. THÈMES, DIRECTIVES ET SUGGESTIONS
# =============================================================================
theme_stage = StageTheme.create!(name: "L'Automatisme du Corps")

dir_art = DirectiveArtistique.create!(
  name: "Saccade Sociale",
  stage_theme: theme_stage,
  default_lumieres_effet: "Stroboscope 12Hz (Froid)",
  default_son: "Glitch audio sur fréquence 8000Hz",
  default_videoprojection: "Scroll infini de profils LinkedIn"
)

suggestion = ThemeSuggestion.create!(
  category: "Mouvement",
  title: "Le Geste Défragmenté",
  description: "Bouger comme une image JPG qui charge avec une mauvaise connexion."
)

# =============================================================================
# 6. GÉNÉRATION DES LIGNES DU CONDUCTEUR (20 MINUTES)
# =============================================================================

# -- Séquence 1 : L'Initialisation (00:00 -> 05:00)
Conducteurline.create!(
  conducteur: conducteur, ordre: "1", duree: "00:05:00",
  sequenceaction: "Calibration : Le danseur imite un curseur de souris.",
  interpretes: "Danseur 1",
  lumieres_ambiante: "Bleu Néon (0x0000FF)",
  videoprojection: "Flux Facebook : Offres d'emploi en temps réel.",
  son: "Bruit blanc statique",
  notes_artistique: "Sens : Photoréception (L'IA suit le contraste du corps).",
  creative_notes: "Le temps est ici métronomique. La machine commande."
)

# -- Séquence 2 : ZOOM ANALYSE MUSICALE (05:00 -> 06:30)
# Simulation d'une analyse de partition LilyPond en direct
[
  {t: "00:00:20", nuance: "f", note: "cis''"},
  {t: "00:00:20", nuance: "p", note: "g'"},
  {t: "00:00:20", nuance: "sfz", note: "bes'"},
  {t: "00:00:15", nuance: "dim", note: "r"},
  {t: "00:00:15", nuance: "pp", note: "dis'"}
].each_with_index do |fragment, i|
  Conducteurline.create!(
    conducteur: conducteur, ordre: "2.#{i}", duree: fragment[:t],
    sequenceaction: "ANALYSE LIVE : Note extraite [#{fragment[:note]}] - Nuance [#{fragment[:nuance]}]",
    interpretes: "Violoniste",
    lumieres_effet: "Flash blanc sur chaque altération détectée",
    videoprojection: "Code LilyPond brut s'affichant par-dessus l'interprète.",
    notes_artistique: "L'IA commente la partition : 'Altération détectée : Sentiment hors-gamme'.",
    creative_notes: "Sens : Chronoception. L'IA impose un temps mathématique, le violoniste tente de respirer."
  )
end

# -- Séquence 3 : La Montée en Charge (06:30 -> 15:00)
Conducteurline.create!(
  conducteur: conducteur, ordre: "3", duree: "00:08:30",
  sequenceaction: "Saturation : Les corps tentent d'exécuter 1000 ordres par seconde.",
  interpretes: "Tous",
  lumieres_ambiante: "Rouge Alerte (Saturation)",
  machine_brouillard: "80%",
  videoprojection: "Explosion de notifications Facebook 'Voyages'.",
  son: "Fréquence 440Hz pure se distordant vers un cri humain.",
  notes_artistique: "Sens : Neuroception. Le public doit ressentir le stress de la machine.",
  creative_notes: "L'IA ne peut pas ressentir la fatigue musculaire, elle continue de créer des boucles."
)

# -- Séquence 4 : Le Bug Final (15:00 -> 20:00)
Conducteurline.create!(
  conducteur: conducteur, ordre: "4", duree: "00:05:00",
  sequenceaction: "Erreur Système : Le danseur s'arrête, le violon continue seul sans partition.",
  interpretes: "Violoniste",
  lumieres_ambiante: "Noir Total / Une seule douche ambre sur le cœur.",
  videoprojection: "Écran Bleu (BSOD) se transformant lentement en une image de forêt.",
  notes_artistique: "Sens : Sens de l'Agence. L'humain choisit de ne plus obéir.",
  creative_notes: "Le temps devient celui de l'artiste : l'attente du silence."
)

# =============================================================================
# 7. LOGISTIQUE & RESSOURCES
# =============================================================================
marker = EmotionalMarker.create!(name: "Kinesthésie vs Algorithme")
resource = InspirationResource.create!(
  title: "Ballet Mécanique (1924)", 
  url: "https://archive.org/details/BalletMecanique", 
  category: "Performance Art"
)

template = SequenceTemplate.create!(
  style_id: style_digital.id,
  label: "Boucle de Rétroaction",
  phase: "body",
  target_talent: "Musicien"
)

# =============================================================================
# 8. ANALYSE FINALE (INTERPRETATION)
# =============================================================================
interpretation = Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Taux d'erreur de synchronisation : 12.4% à la minute 15.",
  human_judgment: "Le moment de l'erreur était le plus beau passage du spectacle.",
  the_gap: "L'IA voit un échec technique là où l'humain voit une libération poétique.",
  artistic_truth: "L'intelligence artistique est la capacité à transformer un bug en intention."
)

# =============================================================================
# 9. LIAISONS HABTM AVEC LE CREATIVE DETOUR (ID: 79)
# =============================================================================
# On lie les 17 entités créées au Détour Créatif pour boucler la boucle
creative_detour.styles << style_digital
creative_detour.zones << zone_data
creative_detour.zones << zone_organique
creative_detour.fiche_techniques << fiche
creative_detour.materiels << violon
creative_detour.materiels << videoproj
creative_detour.plan_de_scene_dessins << dessin_scene
creative_detour.artistic_notes << note_art
creative_detour.artistic_processes << process
creative_detour.artistic_limits << limit
creative_detour.stage_themes << theme_stage
creative_detour.directive_artistiques << dir_art
creative_detour.theme_suggestions << suggestion
creative_detour.conducteurs << conducteur
creative_detour.emotional_markers << marker
creative_detour.inspiration_resources << resource
creative_detour.sequence_templates << template
creative_detour.interpretations << interpretation

puts "✅ Seed terminée : 17 tables liées au Détour Créatif 79."
puts "🎭 Spectacle 'L'Incision' prêt (Durée : 20:00)."
