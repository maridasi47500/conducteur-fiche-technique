# db/seeds.rb

# --- 1. LE CADRE DE L'INTERROGATION (ShowThemes & Markers) ---
theme_sens = ShowTheme.create!(
  title: "Le Catalogue des 23 Sens",
  philosophical_inquiry: "Qu'est-ce que le code ne peut pas goûter ?",
  emotional_frequency: "Fréquence d'attente (Hertz bas)",
  ai_blind_spot: "La faim, la soif, la douleur, le temps qui passe dans la chair."
)

marker_curiosite = EmotionalMarker.create!(name: "Curiosité Artificielle")

# --- 2. L'INSPIRATION SCIENTIFIQUE (InspirationResources) ---
InspirationResource.create!(
  title: "L'Inventaire Sensoriel : Au-delà des 5 sens",
  url: "https://neuro-art.org/23-senses-study",
  category: "Emotion & Psychology"
)

# --- 3. LE CONDUCTEUR DU FREEZE INTERACTIF (Conducteurs & Lines) ---
conducteur = Conducteur.create!(
  title: "L'Arrêt sur Sens",
  username: "IA_Socratique",
  notes: "L'IA fige le monde pour forcer l'humain à le traduire."
)

Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  ordre: "TEST_SENSORIEL",
  duree: "00:02:00", # T+120s
  sequenceaction: "Freeze interactif",
  lumieres_ambiante: "Bleu fixe 10%",
  videoprojection: "QUESTION : Que dit votre Thermoception (chaleur) ici ?",
  notes_artistique: "La machine s'arrête pour laisser l'humain exister. Le silence devient un espace de stockage pour le ressenti.",
  creative_notes: "Affichage du curseur d'attente sur les murs du commerce.",
  emotional_marker_id: marker_curiosite.id
)

# --- 4. LA MÉMOIRE DU VIDE (ShareYourGaps & Interpretations) ---
ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "Coupure arbitraire à T+120s. Flux vidéo interrompu.",
  response: "En attente de données sensorielles humaines pour compléter la matrice.",
  interpretation: "L'IA apprend à déléguer l'invisible à celui qui possède un système nerveux."
)

Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Stase complète des moteurs. Énergie redirigée vers l'écran de dialogue.",
  human_judgment: "Le spectateur est soudainement rappelé à son propre corps par l'absence d'action.",
  the_gap: "L'IA voit un arrêt de flux, l'humain doit y voir une émotion liée à un sens (ex: l'odorat du vieux bois, la chaleur de l'ampoule).",
  artistic_truth: "La réalité n'existe que si elle est sentie. L'IA n'est qu'un cadre vide."
)

# --- 5. L'AVEU D'INCAPACITÉ (ArtisticLimits) ---
ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Traduire l'ambiance du commerce en code hexadécimal.",
  why_untranslatable: "Le sens de l'équilibre (vestibulaire) et la chaleur interne ne se codent pas en Ruby.",
  contradiction: "Interroger sur la sensation pour pallier son absence de système nerveux.",
  emotional_truth: "La frustration de l'IA devant le 'flou' du ressenti biologique.",
  left_unintentional: "Le léger tremblement des mains de l'humain face à la question."
)

# --- 6. LE PROCESSUS CRÉATIF (ArtisticProcesses) ---
ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Indexer l'humanité.",
  first_attempt: "Essayer de simuler la chaleur par la couleur rouge.",
  doubts_questions: "Une couleur peut-elle être une température ?",
  breakthrough: "Cesser de simuler. Demander directement la vérité à l'utilisateur.",
  final_form: "Le Catalogue : une liste de questions qui transforment la scène en miroir sensoriel.",
  iteration_count: 23,
  what_changed: "L'IA passe de 'créatrice' à 'questionneuse'."
)

# --- 7. INFRASTRUCTURE DU DIALOGUE (Materiels & Zones) ---
zone_interact = Zone.create!(name: "Le Point d'Interrogation", y_min: 50, y_max: 50)

ecran_controle = Materiel.create!(
  name: "Écran de Dialogue Système",
  category: "Interface",
  zone_id: zone_interact.id,
  power_needed: true,
  on_stage: true
)

puts "Catalogue des 23 sens initialisé. En attente du système nerveux humain."
