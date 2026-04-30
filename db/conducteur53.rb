# INITIALISATION DES RÉFÉRENTIELS
style_froid = Style.create!(name: "Esthétique de l'erreur")
theme_base = StageTheme.create!(name: "L'Humain comme variable résiduelle")
marker_malaise = EmotionalMarker.create!(name: "Vallée de l'étrange")

# STRUCTURE LOGISTIQUE
fiche_technique = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique",
  date: "2026-04-23",
  notes_complementaires: "Calibration du système sur fréquences non-harmoniques"
)

# ARCHITECTURE DU CONDUCTEUR (CONTENANT VIDE)
conducteur_p = Conducteur.create!(
  title: "Séquence de silence et de pression",
  fiche_technique_id: fiche_technique.id.to_s,
  starred: true,
  notes: "Données prêtes pour injection humaine. Aucune routine autonome."
)

# MAPPAGE SCÉNIQUE (POSITIONS FIGÉES)
zone_z = Zone.create!(name: "Zone Zéro", y_min: 0, y_max: 2)
pfe = Materiel.create!(
  name: "Diffuseur de particules (Brouillard)",
  zone_id: zone_z.id,
  on_stage: true,
  category: "Effet"
)

PlanDeSceneDessin.create!(
  fiche_technique_id: fiche_technique.id.to_s,
  disposition: "Grille orthogonale",
  coord_x: 0,
  coord_y: 0,
  layer: "Infrastructure"
)

# LIMITES ARTISTIQUES (OBSERVATIONS PRÉ-EXÉCUTION)
ArtisticLimit.create!(
  conducteur_id: conducteur_p.id,
  what_i_want: "Capture du résidu sonore",
  why_untranslatable: "Le silence machine est absolu, le silence humain est bruité",
  emotional_truth: "Présence d'artefacts non-voulus"
)

# LIGNES DE CONDUCTEUR (ÉTATS DE LA MATIÈRE)
# Plage temporelle : T+[0s à 60s]
Conducteurline.create!(
  conducteur_id: conducteur_p.id.to_s,
  ordre: "01",
  etat: "Standby",
  sequenceaction: "Immobilité de la structure. Tension électrique : 230V stable.",
  lumieres_ambiante: "Noir total (0 lux)",
  son: "Silence numérique (-120dB)",
  notes_technicien: "Attente d'impulsion humaine pour démarrage de la boucle."
)

# Plage temporelle : T+[60s à 120s]
# Hypothèse : La répétition d'un signal biologique par un automate crée une dissonance [Source : Jentsch, E. 1906]
Conducteurline.create!(
  conducteur_id: conducteur_p.id.to_s,
  ordre: "02",
  etat: "Actif_Passif",
  sequenceaction: "Positionnement d'un interprète sous flux de données.",
  lumieres_ambiante: "Stroboscope (Fréquence : 12Hz - Plage : T+70s à T+80s)",
  son: "Fichier audio : enregistrement_pneumatique_04.wav (Loop)",
  notes_artistique: "Le flux sonore est un objet trouvé. L'automate ne respire pas.",
  emotional_marker_id: marker_malaise.id
)

# PROCESSUS (HISTORIQUE DE COMPILATION)
ArtisticProcess.create!(
  conducteur_id: conducteur_p.id,
  initial_impulse: "Requête : 'Interroger la place de l'âme'",
  rejected_ideas: "Simulation de sentiments (Rejeté : Vallée de l'étrange détectée)",
  breakthrough: "Utilisation du bug comme seule preuve d'humanité"
)
