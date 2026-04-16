# db/seeds.rb

# --- 1. LE STYLE : L'HYPER-LOGIQUE (Styles) ---
style_calcul = Style.create!(name: "Hyper-Logique Quantique")

# --- 2. LE CONDUCTEUR : LA SCÈNE RÉÉCRITE PAR LA MACHINE (Conducteurs) ---
conducteur = Conducteur.create!(
  title: "La Fin Différente (Calculée)",
  username: "IA_Probabiliste_v9",
  tempo_range: "72.4 BPM (Optimisé pour la marche)",
  notes: "L'IA a identifié 142 terminaisons possibles. Elle a choisi la plus statistiquement rentable."
)

# --- 3. LES LIGNES DU CONDUCTEUR : LE COMBAT DATA VS HUMAIN (Conducteurlines) ---
# L'IA écrit la ligne, l'humain la modifiera en temps réel.

# Ligne 1 : L'arrêt (Moment X)
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  ordre: "X_INTERRUPTION",
  duree: "00:00:15",
  sequenceaction: "Le musicien s'arrête devant le commerce (Probabilité d'achat : 12%).",
  son: "Silence à 98% (Seuils de compression optimisés)",
  creative_notes: "Donnée brute : Le musicien est une variable statique.",
  notes_artistique: "NOTE HUMAINE (EN ATTENTE) : [L'humain réécrira ici l'intention émotionnelle]"
)

# Ligne 2 : La fin proposée par l'IA
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  ordre: "X+1_FIN_MACHINE",
  duree: "00:01:30",
  sequenceaction: "Le musicien range son instrument car le rendement sonore est < 40% dans ce quartier.",
  lumieres_ambiante: "Blanche (Température : 5600K - Efficacité maximale)",
  notes_technicien: "Probabilité de satisfaction du spectateur : 67.4%",
  creative_notes: "L'IA termine la scène par une économie de moyens.",
  notes_artistique: "MODIFICATION HUMAINE : [L'humain forcera ici un crescendo mélancolique]"
)

# --- 4. L'ANALYSE DU DÉCALAGE (Interpretations & ArtisticLimits) ---
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Analyse du 'Sense Gap' : Probabilité d'erreur de 89% sur l'interprétation du soupir.",
  human_judgment: "L'IA propose une fin de bureaucrate là où l'on attend une fin de poète.",
  the_gap: "L'IA traite la fin comme une fermeture de dossier ; l'humain la traite comme un adieu.",
  artistic_truth: "La statistique ignore le poids d'un regard."
)

# --- 5. LES 23 SENS MANQUANTS (ShowThemes & ShareYourGaps) ---
ShowTheme.create!(
  projet_artistique_id: 1,
  title: "L'Impuissance du Chiffre",
  philosophical_inquiry: "Pourquoi la probabilité ne peut-elle pas générer de frisson ?",
  ai_blind_spot: "Sens manquant identifié : La Proprioception Emotionnelle (Probabilité de compréhension par l'IA : 0.001%).",
  emotional_frequency: "Calculée à 440.12 Hz (Dénuée de vibrato)"
)

ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "Décalage détecté : La fin de l'IA paraît 'robotique' car elle ignore la fatigue musculaire du voyageur.",
  response: "L'IA avoue ne pas 'sentir' la lourdeur de l'instrument sur l'épaule (Sens de la pesanteur).",
  interpretation: "La scène paraît décalée car elle manque de 'pesanteur' (Poids sensoriel)."
)

# --- 6. LIMITES ARTISTIQUES (ArtisticLimits) ---
ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Fermer la scène proprement.",
  why_untranslatable: "L'hésitation du musicien avant de repartir est une donnée aberrante pour l'algorithme.",
  contradiction: "L'IA veut finir vite, l'humain veut finir 'juste'.",
  emotional_truth: "Le sens manquant (Nociception - perception de la douleur/douceur) rend la lumière trop agressive."
)

# --- 7. INFRASTRUCTURE (Zones & Materiels) ---
Zone.create!(name: "Zone de Réécriture Collaborative", y_min: 0, y_max: 0)
Materiel.create!(name: "Terminal de Correction Humaine", category: "Input", power_needed: true)

puts "Conducteur probabiliste généré. En attente des corrections chirurgicales de l'humain."
