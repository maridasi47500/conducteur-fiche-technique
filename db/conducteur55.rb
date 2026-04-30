# Ajout d'un nouveau conducteur basé sur le thème de l'obsolescence du geste

# --- Références de structure ---
theme_glitch = StageTheme.create(name: "L'Obsolescence du Geste")
style_glitch = Style.create(name: "Esthétique de l'Erreur")
marker_vide = EmotionalMarker.create(name: "Abîme Numérique")

# --- Matériel et Zone ---
zone_peripherie = Zone.create(name: "Zone Bêta (Périphérie)", y_min: 11, y_max: 20)
machine_fumee = Materiel.create(
  name: "Machine à brouillard CO2",
  zone_id: zone_peripherie.id,
  on_stage: true,
  category: "Effets",
  default_layer: "Sol"
)

# --- Fiche Technique ---
fiche_glitch = FicheTechnique.create(
  name_event: "I.A. Intelligence Artistique - Session 02",
  eleve_responsable: "Automate_02",
  date: "2026-05-12",
  notes_complementaires: "Synchronisation MIDI instable par conception."
)

# --- Le Conducteur ---
conducteur_glitch = Conducteur.create(
  title: "Protocole de Dégradation Systémique",
  username: "Système_B",
  fiche_technique_id: fiche_glitch.id.to_s,
  tempo_range: "40-90 BPM",
  starred: false,
  notes: "Hypothèse : Le résidu de données imite la trace mémorielle humaine [Source : Betancourt, M., 2016]."
)

# --- Séquences du Conducteur ---
# Séquence 01 : État Stable
Conducteurline.create(
  conducteur_id: conducteur_glitch.id.to_s,
  duree: "00:00:25",
  sequenceaction: "Immobilité du mannequin, axe central",
  interpretes: "Actant_02",
  lumieres_ambiante: "Froid Cyan 100%",
  son: "Onde sinusoïdale 50Hz continue",
  ordre: "1",
  etat: "Initialisé",
  emotional_marker_id: marker_vide.id
)

# Séquence 02 : État Corrompu
Conducteurline.create(
  conducteur_id: conducteur_glitch.id.to_s,
  duree: "00:00:55",
  sequenceaction: "Élévation mécanique du membre supérieur droit (angle 45°)",
  interpretes: "Actant_02",
  lumieres_ambiante: "Stroboscope blanc",
  lumieres_effet: "Flicker 12Hz",
  son: "Saturation numérique, perte de paquets",
  ordre: "2",
  etat: "Buffer Error",
  creative_notes: "Simulation d'une saturation de mémoire tampon."
)

# --- Processus et Limites ---
ArtisticProcess.create(
  conducteur_id: conducteur_glitch.id,
  initial_impulse: "Observation de crash système",
  first_attempt: "Boucle parfaite de 4 mesures",
  doubts_questions: "Le contrôle total est-il l'opposé de l'art ?",
  breakthrough: "Désynchronisation manuelle des horloges MIDI",
  final_form: "Désordre structuré",
  iteration_count: 12
)

ArtisticLimit.create(
  conducteur_id: conducteur_glitch.id,
  what_i_want: "Capture de l'instant de rupture",
  why_untranslatable: "L'imprévisibilité ne peut être programmée sans devenir prévisible",
  contradiction: "Un système ordonné générant du chaos",
  emotional_truth: "La fragilité d'un signal qui s'interrompt",
  left_unintentional: "Échauffement thermique des processeurs"
)
