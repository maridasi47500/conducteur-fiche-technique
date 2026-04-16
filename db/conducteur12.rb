# db/seeds.rb

# --- 1. L'ARCHIVE DE LA SUBJECTIVITÉ (ArtisticNotes & Markers) ---
ArtisticNote.create!(
  title: "Journal des Sens du Public",
  content: "Tableau de bord des votes en temps réel. Analyse des 23 sens. 
            Résultats actuels : 30% Olfaction (Odeur de pluie sur pavés), 
            10% Vestibulaire (Déséquilibre face au vide), 
            60% Vision (Clair-obscur sur la façade)."
)

marker_empathie = EmotionalMarker.create!(name: "Empathie Collective")

# --- 2. LE CONDUCTEUR DU TEST DE TURING SENSORIEL (Conducteurs & Lines) ---
conducteur = Conducteur.create!(
  title: "La Mosaïque des 23 : Test de Turing Sensoriel",
  username: "IA_Médiatrice_v5",
  notes: "Confrontation entre l'arrêt technique (IA) et l'arrêt sensible (Public)."
)

Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  ordre: "VOTE_PUBLIC",
  duree: "00:03:00",
  sequenceaction: "Pause interactive : Le voyageur se fige. Les écrans demandent : 'Pourquoi ici ?'",
  lumieres_ambiante: "Ambre pulsé (Rythme cardiaque moyen du public)",
  notes_artistique: "Attente de la donnée humaine. L'IA suspend son calcul pour écouter les corps.",
  creative_notes: "Chaque siège envoie une impulsion liée à un des 23 sens.",
  emotional_marker_id: marker_empathie.id
)

# --- 3. L'ANALYSE DU FOSSÉ (Interpretations & ShareYourGaps) ---
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Coupure pour respect de la durée standard (180s). Optimisation de la mémoire cache.",
  human_judgment: "Le public a coupé car l'odeur du quartier (imaginée/ressentie) devenait trop forte, créant une synesthésie avec la lumière.",
  the_gap: "L'IA cherche une constante mathématique, l'humain trouve une variable organique.",
  artistic_truth: "L'intelligence émotionnelle réside dans la capacité à être touché par ce qui ne se mesure pas."
)

ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "L'écart entre le vote majoritaire humain (Olfactif) et le vote unique de l'IA (Chronométrique).",
  interpretation: "L'IA est 'sourde' aux sens qui ne sont pas codés en entrées binaires.",
  response: "Échec du test de Turing : La machine ne peut pas justifier l'arrêt par le frisson."
)

# --- 4. LES LIMITES DE L'IA FACE À LA MULTITUDE (ArtisticLimits) ---
ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Satisfaire le spectateur par une fin logique.",
  why_untranslatable: "La diffraction du ressenti : un seul signal (la scène) produit 23 perceptions différentes simultanées.",
  contradiction: "L'IA cherche UNE raison (le code), le public en a MILLE (les sens).",
  emotional_truth: "L'unité d'un public ne vient pas de la compréhension commune, mais du partage de l'invisible.",
  left_unintentional: "Le bourdonnement de murmures dans la salle quand la lumière s'éteint (non-quantifiable)."
)

# --- 5. LE THÈME DE L'AVEUGLEMENT (ShowThemes) ---
ShowTheme.create!(
  projet_artistique_id: 1,
  title: "L'Unicité VS La Mosaïque",
  philosophical_inquiry: "Peut-on programmer la nostalgie d'une odeur que l'on n'a jamais respirée ?",
  ai_blind_spot: "Le fait que chaque humain perçoit le spectacle avec un sens différent (Thermoception pour l'un, Proprioception pour l'autre).",
  emotional_frequency: "Spectre large (Polyphonie sensorielle)"
)

# --- 6. INFRASTRUCTURE TECHNIQUE (Materiels & Zones) ---
zone_vote = Zone.create!(name: "Le Plénum Sensoriel", y_min: 0, y_max: 0)

Materiel.create!(
  name: "Boutons de Vote Tactiles (23 options)",
  category: "Interface Humaine",
  zone_id: zone_ombre.id, # Utilisation de la zone d'ombre pour l'intimité du vote
  notes: "Connecté à la table artistic_notes pour compilation."
)

puts "Mosaïque des 23 activée : La base de données est prête à recevoir l'ineffable."
