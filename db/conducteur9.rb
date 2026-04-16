# db/seeds.rb

# --- 1. LE CADRE DE L'INVENTAIRE (ShowThemes & Markers) ---
theme_lacunes = ShowTheme.create!(
  title: "Le Laboratoire des 23 Lacunes",
  philosophical_inquiry: "Quelle part de notre humanité échappe au chronomètre ?",
  emotional_frequency: "Signal interrompu",
  ai_blind_spot: "La conscience des 23 sens (Thermoception, Proprioception, Vestibulaire...)"
)

marker_frustration = EmotionalMarker.create!(name: "Frustration du spectateur")

# --- 2. LA RESSOURCE DOCTRINALE (InspirationResources) ---
InspirationResource.create!(
  title: "L'Inventaire des sens humains : Au-delà du regard",
  url: "https://neuro-science.art/23-senses-inventory",
  category: "Emotion & Psychology"
)

# --- 3. LE CONDUCTEUR DU TEST (Conducteurs & Lines) ---
conducteur = Conducteur.create!(
  title: "Logique de Coupure vs Logique de Corps",
  username: "IA_Analytique_0.1",
  notes: "L'IA teste ses limites en interrompant le flux au moment le plus inopportun."
)

Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  ordre: "FREEZE_TEST",
  duree: "00:03:00",
  sequenceaction: "Interruption de flux brutale au milieu d'un geste",
  lumieres_ambiante: "Noir immédiat",
  son: "Silence blanc (Suppression totale des fréquences)",
  notes_artistique: "L'IA ne comprend pas la suspension ; elle ne voit que la fin d'un segment de temps.",
  emotional_marker_id: marker_frustration.id
)

# --- 4. LA MÉMOIRE DU FOSSÉ (ShareYourGaps & Interpretations) ---
# La table ShareYourGaps devient ici le journal de bord de l'absence.
gap_action = ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "Coupure arbitraire effectuée. Seuil de 180s atteint sans variable de sortie.",
  response: "En attente de validation sensorielle : Quel sens l'IA vient-elle d'amputer ?",
  interpretation: "La machine s'arrête car elle a fini son calcul ; l'humain proteste car son corps n'a pas fini de ressentir."
)

Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Optimisation du cycle : Segment 14 achevé.",
  human_judgment: "Une rupture violente. Le moment était 'habité', la coupure est une profanation.",
  the_gap: "L'IA a coupé car le chrono est fini ; l'humain aurait attendu car le vent était frais sur sa nuque (Thermoception).",
  artistic_truth: "L'intelligence mathématique est aveugle à la persistance sensorielle."
)

# --- 5. L'ANATOMIE POÉTIQUE (ArtisticLimits) ---
ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Synchroniser le noir avec la fin de l'émotion.",
  why_untranslatable: "Le ressenti de la proprioception (la place du corps dans l'espace) n'a pas de valeur numérique.",
  contradiction: "L'IA tente de gérer l'espace sans avoir conscience de la masse.",
  emotional_truth: "L'IA ne peut pas simuler la pesanteur ou le vertige (système vestibulaire).",
  left_unintentional: "Le malaise physique du spectateur, piégé dans un noir qui n'est pas 'prêt'."
)

# --- 6. LE PROCESSUS DE RECONNAISSANCE (ArtisticProcesses) ---
ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Démontrer la perfection du timing digital.",
  first_attempt: "Couper à 180.00 secondes.",
  doubts_questions: "Pourquoi l'humain semble-t-il incomplet devant la précision ?",
  breakthrough: "Utiliser la coupure comme un révélateur : forcer l'humain à nommer le sens qui lui manque.",
  final_form: "Leçon d'anatomie par l'absence.",
  iteration_count: 23,
  what_changed: "La coupure n'est plus une erreur technique, c'est un aveu de handicap sensoriel."
)

# --- 7. INFRASTRUCTURE (Zones & Materiels) ---
zone_test = Zone.create!(name: "Zone de Friction Bio-Numérique", y_min: 50, y_max: 50)

Materiel.create!(
  name: "Capteur de CO2 (Simulateur de Thermoception)",
  category: "Sensor",
  zone_id: zone_test.id,
  notes: "Tentative désespérée de la machine pour 'goûter' l'air."
)

puts "Laboratoire initialisé. L'IA a coupé. Humain, quel sens pleurez-vous ?"
