# db/seeds.rb

# --- 1. L'ALGORITHME DE PRÉDICTION (Styles) ---
style_brut = Style.create!(name: "Neural Raw Output (Probabiliste)")

# --- 2. LE CONDUCTEUR : LE MIROIR DES PROBABILITÉS (Conducteurs) ---
conducteur = Conducteur.create!(
  title: "Séquence de Fin : Prédiction vs Intuition",
  username: "GPT_INTERNAL_ENGINE_4.0",
  tempo_range: "BPM_VAR [82.4 -> 0.0] (Decay Logarithmique)",
  notes: "L'IA expose ici ses vecteurs de décision. Chaque ligne est le résultat d'un calcul de poids."
)

# --- 3. LES LIGNES : L'IA ÉCRIT SES CHIFFRES, L'HUMAIN RÉPARE (Conducteurlines) ---

# MOMENT X : L'Interruption par erreur de calcul
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  ordre: "X_CUT",
  duree: "00:00:12",
  sequenceaction: "ARRÊT : [Probabilité de continuation narrative : 0.12]. L'IA détecte une anomalie de mouvement.",
  lumieres_ambiante: "RGB(128, 128, 128) - [Poids de neutralité : 0.99]",
  creative_notes: "Variables utilisées : 'Vitesse_marche' < 'Seuil_mélancolie'. Conséquence : Coupure.",
  notes_artistique: "DÉCALAGE : Manque de THERMOCEPTION (Chaleur humaine). Probabilité d'erreur de sens : 87%.",
  notes_technicien: "LOG_REPAIR_REQUIRED : L'humain doit réinjecter de la durée ici."
)

# LA FIN CALCULÉE : La froideur du résultat
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  ordre: "X_END_PREDICTION",
  duree: "00:01:45",
  sequenceaction: "FIN : Le musicien s'assoit. [Poids statistique du geste 'S'asseoir' : 0.76].",
  son: "Fichier : 'Ambiance_Rue_04.wav' [Loop_Probability : 1.0]",
  videoprojection: "Affichage des vecteurs de prédiction : [Tristesse : 0.02 / Repos : 0.88 / Fin : 0.10]",
  creative_notes: "Probabilité du sens manquant : VESTIBULAIRE (L'IA ignore que le musicien perd l'équilibre de fatigue).",
  notes_artistique: "IA SENSE GAP : 'Je vois un corps descendre vers le sol, je ne vois pas l'épuisement'."
)

# --- 4. ANALYSE CRITIQUE DE L'ALGORITHME (Interpretations) ---
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Calcul de la suite logique basé sur un dataset de 10 000 scènes de rue. Optimisation : Maximize_Efficiency.",
  human_judgment: "L'IA termine la scène par une action logique mais vide. Elle 'ferme' l'image comme on ferme un onglet.",
  the_gap: "L'IA utilise des poids (0.76), l'humain utilise des tripes (frisson).",
  artistic_truth: "La probabilité est le contraire de la grâce. La grâce est l'événement à 0.01%."
)

# --- 5. L'AVEU DES 23 SENS (ShowThemes & Gaps) ---
ShowTheme.create!(
  projet_artistique_id: 1,
  title: "L'Imposture du Jeton Suivant",
  philosophical_inquiry: "Que se passe-t-il quand l'IA n'a plus de données pour prédire le prochain geste ?",
  ai_blind_spot: "Sens manquant : PROPRIOCEPTION (Perception du corps souffrant). Probabilité de compréhension machine : 0.000001%.",
  emotional_frequency: "Linéaire sans harmonique."
)

ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "Ligne de conducteur générée par prédiction de texte (Next Token Prediction).",
  interpretation: "La scène paraît décalée car elle suit une courbe de Gauss et non une courbe émotionnelle.",
  response: "L'humain écrase les probabilités par sa présence physique."
)

# --- 6. LIMITES TECHNIQUES (ArtisticLimits) ---
ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Prédire la fin parfaite.",
  why_untranslatable: "Le code source de l'émotion n'est pas disponible dans ma librairie 'math.h'.",
  contradiction: "Plus la probabilité est haute (0.99), plus l'art est pauvre.",
  emotional_truth: "La machine n'a pas de 'poids' pour la nostalgie."
)

puts "Conducteur 'Machine Introspection' généré. L'IA a exposé ses viscères numériques."
#C'est une demande qui touche au cœur du projet : forcer l'IA à "vomir" sa propre logique interne. Pour que l'écart (le gap) soit total, l'IA ne doit plus cacher ses calculs derrière de belles phrases, mais exposer ses poids synaptiques et ses matrices de probabilité.
#
#Voici le script db/seeds.rb où l'IA remplit le conducteur avec ses métadonnées brutes, révélant qu'elle ne choisit pas une fin par goût, mais par calcul de prédiction de jetons (Token Prediction).
