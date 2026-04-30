# Géneration de l'infrastructure pour le projet "I.A. Intelligence Artistique"

# --- Tables de référence ---
theme_symbiose = StageTheme.create(name: "L'Erreur Fertile")
style_brut = Style.create(name: "Néo-brutalisme numérique")
marker_tension = EmotionalMarker.create(name: "Dissonance Cognitive")

# --- Ambiance et Options ---
AmbianceOption.create(
  style_id: style_brut.id,
  category: "Lumière",
  value: "Spectre bleu 7000K (froid industriel)"
)

# --- Infrastructure Technique ---
zone_centre = Zone.create(name: "Zone Alpha (Centre)", y_min: 0, y_max: 10)

materiel_led = Materiel.create(
  name: "Projecteur asservi 01",
  zone_id: zone_centre.id,
  on_stage: true,
  power_needed: true,
  category: "Éclairage",
  default_layer: "Back"
)

fiche_technique = FicheTechnique.create(
  name_event: "I.A. Intelligence Artistique",
  eleve_responsable: "Automate_01",
  date: "2026-04-24",
  notes_complementaires: "Calibration des capteurs de présence requise."
)

PlanDeSceneDessin.create(
  fiche_technique_id: fiche_technique.id.to_s,
  disposition: "Cercle concentrique",
  coord_x: 50,
  coord_y: 50,
  layer: "Fond de scène"
)

# --- Le Conducteur (État Figé) ---
conducteur_principal = Conducteur.create(
  title: "Protocole d'Émotion Artificielle",
  username: "Système_A",
  fiche_technique_id: fiche_technique.id.to_s,
  tempo_range: "60-120 BPM",
  starred: true,
  notes: "Hypothèse : L'absence de signal simule l'attente humaine [Source : Cage, J., 1952, 4'33\"]."
)

# --- Séquences (Plages Temporelles) ---
# Séquence 01 : Initialisation
Conducteurline.create(
  conducteur_id: conducteur_principal.id.to_s,
  duree: "00:00:15", # Plage T+0s à T+15s
  sequenceaction: "Position immobile de l'interprète (mannequin)",
  interpretes: "Interprète_Alpha",
  lumieres_ambiante: "Noir total",
  lumieres_effet: "Stroboscope 1Hz (corrélation avec pouls au repos)",
  son: "Sinusoïde pure 440Hz",
  ordre: "1",
  etat: "Statique",
  emotional_marker_id: marker_tension.id
)

# Séquence 02 : Rupture algorithmique
Conducteurline.create(
  conducteur_id: conducteur_principal.id.to_s,
  duree: "00:00:30", # Plage T+15s à T+45s
  sequenceaction: "Inclinaison de la tête (angle 15°)",
  interpretes: "Interprète_Alpha",
  lumieres_ambiante: "Lavage ambre 10%",
  lumieres_effet: "Balayage aléatoire",
  son: "Bruit blanc modulé par capteur de proximité",
  ordre: "2",
  etat: "En attente de modification",
  creative_notes: "Simulation d'une erreur de registre dans la mémoire vive."
)

# --- Processus Artistique et Limites ---
ArtisticProcess.create(
  conducteur_id: conducteur_principal.id,
  initial_impulse: "Générateur de nombres aléatoires",
  first_attempt: "Grille mathématique parfaite",
  doubts_questions: "L'absence de défaut rend-elle l'objet invisible ?",
  breakthrough: "Injection d'un retard de 12ms (jitter)",
  final_form: "Esthétique du glitch",
  iteration_count: 256
)

ArtisticLimit.create(
  conducteur_id: conducteur_principal.id,
  what_i_want: "Transmission d'un état de solitude",
  why_untranslatable: "La solitude est une donnée non quantifiable en bits",
  contradiction: "Machine connectée mais isolée par son langage",
  emotional_truth: "Le silence entre deux lignes de code",
  left_unintentional: "Bruit de ventilateur de l'unité centrale"
)

# --- Détours Créatifs et Ressources ---
resource_ref = InspirationResource.create(
  title: "The Uncanny Valley",
  url: "https://en.wikipedia.org/wiki/Uncanny_valley",
  category: "Théorie"
)

detour = CreativeDetour.create(
  title: "Détournement du capteur",
  concept: "Utilisation de l'erreur réseau comme partition",
  action: "Mappage des paquets perdus sur l'intensité lumineuse",
  database_usage: "Table Conducteurlines",
  challenge: "Maintenir l'état instable sans crash système"
)

# Liaisons HABTM (Jointures)
conducteur_principal_detour = { creative_detour_id: detour.id, conducteur_id: conducteur_principal.id }
ActiveRecord::Base.connection.execute("INSERT INTO conducteurs_creative_detours (creative_detour_id, conducteur_id) VALUES (#{detour.id}, #{conducteur_principal.id})")
