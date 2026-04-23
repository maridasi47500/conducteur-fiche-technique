# Role: Régie / Compilateur de données
# Thème: "Intelligence Artistique" - Interrogation sur la place de l'humain face au digital.
# État: Données statiques, non exécutées.

# 1. INITIALISATION DES RÉFÉRENCES (Habtm CreativeDetour 87)
creative_detour = CreativeDetour.find(87)

# 2. ESPACE ET MATÉRIAUX (Zones & Matériel)
zone_centrale = Zone.create!(name: "Zone Alpha - Scène", y_min: 20, y_max: 80)
violon_elec = Materiel.create!(name: "Violon Électrique (Corps de bois / Capteur piézo)", maximum: 1, zone: zone_centrale, x_pref: 50, spread: 5)
projecteur_laser = Materiel.create!(name: "Vidéoprojecteur 12K (Faisceau froid)", maximum: 1, zone: zone_centrale, x_pref: 50, spread: 0)

# 3. STRUCTURE ET CADRE (Conducteur & Fiche Technique)
fiche = FicheTechnique.create!(
  name_event: "Performance : L'Âme au Silicium",
  date: "2026-04-23",
  eleve_responsable: "Régie Automatisée",
  professeur_referent: "Études Digitales",
  notes_complementaires: "Tentative de capture de l'impalpable via base de données SQL."
)

conducteur = Conducteur.create!(
  fiche_technique: fiche,
  title: "Partition du Vide Émotionnel",
  username: "Système 01",
  tempo_range: "Variable : 40 à 180 BPM",
  notes: "Données LilyPond prêtes pour injection."
)

# 4. COEUR PHILOSOPHIQUE (StageThemes & EmotionalMarkers)
theme_ia = StageTheme.create!(name: "L'aveuglement binaire")
marker_solitude = EmotionalMarker.create!(name: "Solitude (Fréquence d'isolement)")

# 5. ARTISTIC NOTES, PROCESSES & LIMITS (Le coeur du thème)
n1 = ArtisticNote.create!(title: "Le silence entre deux bits", content: "L'IA traite le silence comme 'valeur=0', l'humain comme 'poids de l'absence'.")
n2 = ArtisticNote.create!(title: "Oxymore digital", content: "Le code est prévisible, l'âme est l'imprévisibilité stockée dans le bois.")

p1 = ArtisticProcess.create!(
  conducteur: conducteur,
  initial_impulse: "Observation de l'écart entre le vibrato algorithmique et le tremblement de la main.",
  first_attempt: "Imitation parfaite des fréquences harmoniques.",
  doubts_questions: "Est-ce qu'une base de données peut stocker l'intention derrière une fausse note ?",
  final_form: "Performance où l'IA s'arrête pour laisser le bois résonner seul."
)

l1 = ArtisticLimit.create!(
  conducteur: conducteur,
  what_i_want: "Une mélancolie non mathématique.",
  why_untranslatable: "La mélancolie est une baisse de tension vitale, pas un paramètre de filtre passe-bas.",
  contradiction: "Stockage fini vs Sensation infinie.",
  emotional_truth: "La machine ignore le frisson épidermique lors de la résolution d'une dissonance."
)

# 6. ANALYSE ET ÉCART (Interpretations & ShareYourGaps)
interp = Interpretation.create!(
  conducteur: conducteur,
  machine_analysis: "Analyse FFT : 100% de précision tonale.",
  human_judgment: "Perception d'un son 'plat', dépourvu de grain organique.",
  the_gap: "Absence de micro-délais entre l'intention et l'attaque de l'archet.",
  artistic_truth: "La vérité se situe dans le retard sur le métronome."
)

gap = ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "T+15s : Note tenue 440Hz.",
  response: "Oscillation trop stable.",
  interpretation: "Moment précis où l'IA échoue à simuler la fatigue musculaire de l'interprète."
)

# 7. LOGIQUE DE STYLE ET AMBIANCE (Styles & AmbianceOptions)
style_minimaliste = Style.create!(name: "Minimalisme Algorithmique")
amb_froid = AmbianceOption.create!(style: style_minimaliste, category: "lumieres", value: "Blanc LED (8000K) / Intensité 10%")

# 8. SCÉNARIO ET TEMPLATES (SequenceTemplates & ConducteurLines)
seq_intro = SequenceTemplate.create!(style: style_minimaliste, label: "Initialisation : Scan LilyPond", phase: "intro", target_talent: "IA")
seq_body = SequenceTemplate.create!(style: style_minimaliste, label: "Interprétation : Analyse Alterations", phase: "body", target_talent: "Violoniste")

# Injection des lignes (Zoom sur Analyse Musicale T+120s à T+150s)
[
  {ordre: "1", action: "Affichage LilyPond : Mesures 34-40", son: "Silence (0dB)", visuel: "Code brut défilant"},
  {ordre: "2", action: "Analyse Nuance : Forte (calculé)", son: "Crescendo synthétique", visuel: "Spectrogramme 2D"},
  {ordre: "3", action: "Détection Altération : Fa# (étranger)", son: "Note isolée 740Hz", visuel: "Cercle rouge clignotant"}
].each do |line|
  Conducteurline.create!(
    conducteur: conducteur,
    ordre: line[:ordre],
    sequenceaction: line[:action],
    son: line[:son],
    videoprojection: line[:visuel],
    lumieres_ambiante: "Noir",
    duree: "00:00:10"
  )
end

# 9. DESSIN DE SCÈNE (PlanDeSceneDessins)
PlanDeSceneDessin.create!(fiche_technique: fiche, materiel_musicien: violon_elec.name, coord_x: 50, coord_y: 50, layer: zone_centrale.name)

# 10. SUGGESTIONS & RESSOURCES (InspirationResources & ThemeSuggestions)
res = InspirationResource.create!(title: "L'erreur comme matériau", url: "http://archive.digital/error", category: "Performance Art")
sug = ThemeSuggestion.create!(category: "Philosophie", title: "L'IA comme miroir de nos propres absences")

# --- ASSOCIATIONS HABTM (17 TABLES) ---
creative_detour.directive_artistiques << DirectiveArtistique.create!(name: "Directive Vide", stage_theme: theme_ia)
creative_detour.artistic_notes << [n1, n2]
creative_detour.artistic_processes << p1
creative_detour.artistic_limits << l1
creative_detour.stage_themes << theme_ia
creative_detour.ambiance_options << amb_froid
creative_detour.styles << style_minimaliste
creative_detour.sequence_templates << [seq_intro, seq_body]
creative_detour.inspiration_resources << res
creative_detour.emotional_markers << marker_solitude
creative_detour.theme_suggestions << sug
creative_detour.conducteurs << conducteur
creative_detour.fiche_techniques << fiche
creative_detour.materiels << violon_elec
creative_detour.zones << zone_centrale
creative_detour.plan_de_scene_dessins << PlanDeSceneDessin.last
creative_detour.interpretations << interp
