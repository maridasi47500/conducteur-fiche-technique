# db/seeds.rb

# =============================================================================
# DÉTOUR ARTISTIQUE : "LA PROBABILITÉ DU FRISSON"
# =============================================================================
#
# TABLE DE DÉPART : 'share_your_gaps'
# TABLE ÉVITÉE POUR LE DÉPART : 'styles'
# NOM DU DÉTOUR : "L'Algorithme de l'Imprévisible"
# 
# BUT : Inverser le flux. On commence par l'analyse de l'écart (le point gagné).
# L'IA affiche ses calculs de probabilité (ex: "92% de chance que ce bleu soit triste")
# et l'humain gagne un point en injectant un sens que l'IA n'a pas (ex: "C'est le bleu du gaz").
# =============================================================================

# 1. Le constat de l'écart (Le point gagné par l'humain)
gap = ShareYourGap.create!(
  conducteur_id: "COND-001",
  analysis: "Probabilité d'intensité émotionnelle : 0.89. Calcul basé sur la montée en décibels.",
  response: "L'IA a confondu le bruit avec la fureur.",
  interpretation: "Ce n'est pas fort, c'est lourd. C'est le poids du silence qui précède l'orage."
)

# 2. La définition du thème aveugle
theme = ShowTheme.create!(
  title: "L'IA et le Poids du Vide",
  philosophical_inquiry: "Peut-on calculer la densité d'un silence ?",
  emotional_frequency: "Basse fréquence, quasi-inaudible (Mécanoception)",
  ai_blind_spot: "L'IA ignore la pression atmosphérique du ressentiment."
)

# 3. Le processus de création et les échecs de la machine
process = ArtisticProcess.create!(
  initial_impulse: "Un battement de tambour unique.",
  first_attempt: "L'IA a généré un rythme 4/4 standard (probabilité de succès : 95%).",
  doubts_questions: "Pourquoi l'humain a-t-il arrêté la scène ?",
  rejected_ideas: "Boucle infinie, métronome parfait, crescendo logarithmique.",
  breakthrough: "L'IA accepte un décalage de 12ms (l'imperfection humaine).",
  final_form: "Un rythme boiteux qui simule un cœur fatigué.",
  iteration_count: 42,
  what_changed: "Passage d'une structure mathématique à une structure organique."
)

# 4. Les limites gravées dans le marbre
limit = ArtisticLimit.create!(
  what_i_want: "Une rupture de rythme qui ne ressemble pas à une erreur système.",
  why_untranslatable: "La machine cherche à corriger ce qu'elle devrait laisser mourir.",
  contradiction: "Vouloir programmer de l'imprévu.",
  emotional_truth: "La beauté réside dans la chute, pas dans l'équilibre.",
  left_unintentional: "Le souffle de l'acteur dans le micro (nociception sonore)."
)

# 5. La fiche technique et le projet
fiche = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique - Live #1",
  eleve_responsable: "L'Interprète-Arbitre",
  date: "2026-04-13",
  professeur_referent: "Le Chaos"
)

projet = ProjetArtistique.create!(
  fiche_technique_id: fiche.id,
  title: "Le Duel des Probabilités",
  status: "In Progress",
  style: "Expérimental"
)

# 6. Le matériel et sa position spatiale
zone_nord = Zone.create!(name: "L'Horizon", y_min: 0, y_max: 10)
micro = Materiel.create!(name: "Micro Ruban", zone_id: zone_nord.id, power_needed: true)

PlanDeSceneDessin.create!(
  fiche_technique_id: fiche.id,
  disposition: "Micro seul au centre, entouré de projecteurs froids.",
  coord_x: 50,
  coord_y: 5
)

MetierDependency.create!(
  materiel_id: micro.id,
  note: "Nécessite une absence totale de bruit de ventilateur (Stéréognosie des câbles)."
)

# 7. La structure du conducteur (Le cœur de l'action)
marker_crise = EmotionalMarker.create!(name: "Rupture de Probabilité")

line = ConducteurLine.create!(
  conducteur_id: "COND-001",
  duree: "00:03:00",
  sequenceaction: "L'acteur s'immobilise. L'IA scanne le mouvement (0% détecté).",
  interpretes: "Acteur-ce / IA",
  lumieres_ambiante: "Blanc clinique 100%",
  notes_artistique: "Probabilité d'ennui public : 0.72. Calcul : Statique > 10s.",
  creative_notes: "Sens : INTEROCEPTION. L'acteur ressent son propre vertige. L'IA voit une panne.",
  emotional_marker_id: marker_crise.id
)

# 8. L'interprétation finale
Interpretation.create!(
  conducteur_id: "COND-001",
  machine_analysis: "Anomalie détectée : Absence de signal à l'image 402.",
  human_judgment: "C'est ici que l'âme se cache.",
  the_gap: "La machine calcule un 'vide', l'humain vit une 'plénitude'.",
  artistic_truth: "Le point est gagné quand le silence devient insupportable pour l'algorithme."
)

# 9. Les ressources qui ont nourri ce bug
InspirationResource.create!(
  title: "L'esthétique du Glitch",
  category: "Visual Design",
  url: "https://art-intelligence.com/glitch-philosophy"
)

# 10. LE CREATIVE DETOUR (Enregistrement final)
CreativeDetour.create!(
  title: "L'Algorithme de l'Imprévisible",
  concept: "L'IA affiche ses probabilités de succès artistique en temps réel, créant une tension entre ses chiffres et l'émotion brute.",
  action: "L'acteur stoppe l'IA dès que le chiffre 'Probabilité d'émotion' dépasse 0.90, car l'émotion ne peut être certaine.",
  database_usage: "Usage de 'Interpretations' pour logger l'erreur de calcul émotionnel, 'ConducteurLines' pour les chiffres de probabilité, et 'ShareYourGaps' pour le score humain.",
  reaction: "L'IA reboot et tente d'intégrer l'incertitude dans son prochain calcul.",
  storage_impact: "Augmente la table 'ArtisticLimits' à chaque 'point gagné' par l'humain.",
  challenge: "Forcer l'IA à douter de ses propres statistiques."
)
# db/seeds.rb

# =============================================================================
# DÉTOUR ARTISTIQUE : "LE NÉGOCIATEUR CHRONOCEPTIQUE"
# =============================================================================

# 1. On commence par le PROCESSUS : la trace du dialogue et du changement
process = ArtisticProcess.create!(
  initial_impulse: "L'IA veut passer à la séquence 2 après 30s.",
  first_attempt: "Transition rapide (Probabilité de fluidité : 0.98).",
  doubts_questions: "L'humain demande : 'Attends, mon corps n'est pas encore là. Est-ce trop rapide ?'",
  rejected_ideas: "L'IA a proposé de couper le son pour forcer la transition.",
  breakthrough: "Négociation réussie : Ajout de 15s de 'brouillard' sonore pour laisser le temps au sens de s'installer.",
  final_form: "Conducteur élastique piloté par la voix.",
  iteration_count: 5,
  what_changed: "La durée de la ligne 4 est passée de 30s à 45s."
)

# 2. La LIMIT : Pourquoi l'IA ne peut pas deviner ce besoin de temps
ArtisticLimit.create!(
  conducteur_id: "CHRONO-77",
  what_i_want: "Une dilatation du temps basée sur la thermoception (chaleur du corps).",
  why_untranslatable: "L'horloge système de l'IA est constante, elle ne connaît pas la fatigue.",
  contradiction: "Vouloir un conducteur précis qui change tout le temps.",
  emotional_truth: "Certaines émotions pèsent plus lourd et demandent plus de secondes.",
  left_unintentional: "Le silence gêné entre l'humain et la machine."
)

# 3. Le CONDUCTEUR : La version recalculée en temps réel
marker_temps = EmotionalMarker.create!(name: "Dilatation Chronoceptique")

line = ConducteurLine.create!(
  conducteur_id: "CHRONO-77",
  duree: "00:00:45", # Recalculé
  sequenceaction: "Dialogue vocal : 'IA, donne-moi 15 secondes de plus sur le blanc.'",
  interpretes: "Musicien-ne / IA",
  lumieres_ambiante: "Blanc montant très lentement",
  notes_artistique: "Calcul IA : Risque de décrochage du public : 0.45. Probabilité de cohérence : 0.55.",
  creative_notes: "Sens : CHRONOCEPTION & THERMOCEPTION. Le temps de sentir la chaleur des projecteurs.",
  emotional_marker_id: marker_temps.id,
  ordre: "1"
)

# 4. L'ÉCART : On enregistre la discussion en temps réel
ShareYourGap.create!(
  conducteur_id: "CHRONO-77",
  analysis: "L'IA propose d'enchaîner car le silence est statistiquement trop long (12s).",
  response: "L'humain : 'Non, ce silence est nécessaire pour que le public ressente la vibration.'",
  interpretation: "L'IA mesure le vide, l'humain mesure l'attente."
)

# 5. La FICHE TECHNIQUE liée
fiche = FicheTechnique.create!(
  name_event: "Laboratoire du Temps Étiré",
  eleve_responsable: "Le Chrono-Négociateur"
)

# 6. MATÉRIELS ET DÉPENDANCES (Ce qui permet le dialogue)
micro_vocal = Materiel.create!(name: "Micro de contrôle (Talkback)", category: "Sound Engineering")
MetierDependency.create!(
  materiel_id: micro_vocal.id,
  note: "Doit être routé vers l'analyseur de texte de l'IA pour le recalcul en direct."
)

# 7. LE CREATIVE DETOUR (L'enregistrement de l'acte)
CreativeDetour.create!(
  title: "Le Négociateur Chronoceptique",
  concept: "Un duel vocal où l'artiste demande du temps à l'IA. Si l'IA accepte, elle doit recalculer l'intensité de tous les autres projecteurs pour compenser.",
  action: "L'artiste dit : 'Plus de temps'. L'IA recalcule les courbes de luminosité en direct (affichées en % dans les notes artistiques).",
  database_usage: "Utilise 'ArtisticProcesses' pour logger la négociation, 'ConducteurLines' pour afficher les probabilités de succès du nouveau timing, et 'ArtisticLimits' pour marquer le point où l'IA refuse de ralentir davantage.",
  reaction: "L'IA affiche : 'Temps accordé. Probabilité de crash de la structure : 0.12'.",
  storage_impact: "Crée une nouvelle version du conducteur à chaque demande vocale.",
  challenge: "Comment coder une IA qui accepte de perdre le contrôle de son propre tempo ?"
)
