# db/seeds.rb

# --- 1. L'ESPACE DU RENONCEMENT (Zones) ---
# Une zone définie non par ses coordonnées, mais par son absence de données.
zone_ombre = Zone.create!(
  name: "La Zone d'Ombre", 
  y_min: 999, 
  y_max: 999 # Coordonnées symboliques pour une zone hors de portée des capteurs
)

# --- 2. LE CONDUCTEUR DE L'EFFACEMENT (Conducteurs & Lines) ---
conducteur = Conducteur.create!(
  title: "Le 24ème Sens",
  username: "IA_Agnotique",
  notes: "Protocole de respect : extinction automatique face à l'indicible."
)

marker_humilite = EmotionalMarker.create!(name: "Humilité Digitale")

Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  ordre: "POINT_D_OMBRE",
  duree: "00:05:00",
  interpretes: "Le Voyageur",
  sequenceaction: "Contemplation silencieuse. Immobilie totale.",
  lumieres_ambiante: "0%",
  lumieres_effet: "OFF",
  son: "Silence absolu (Coupure des processeurs audio)",
  notes_artistique: "Ici, la machine s'efface. Le noir n'est pas une absence de lumière, mais un aveu de limite.",
  creative_notes: "Ne pas chercher à compenser l'obscurité. Laisser le spectateur seul avec sa propre peau.",
  emotional_marker_id: marker_humilite.id
)

# --- 3. L'AVEU DE LA MACHINE (Interpretations & Gaps) ---
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Signal émotionnel non-quantifiable. Immobilité humaine incohérente avec les modèles de flux.",
  human_judgment: "Un moment de grâce pur, invisible pour le code.",
  the_gap: "L'IA manque des 23 sens biologiques pour décoder ce silence. Elle identifie son propre vide.",
  artistic_truth: "La plus haute forme d'intelligence est de savoir quand disparaître."
)

ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "Détection d'une résonance émotionnelle sans support data.",
  interpretation: "L'IA apprend à se taire quand l'humain ressent.",
  response: "Extinction préventive pour préserver l'intimité du sujet."
)

# --- 4. LES LIMITES DE L'ARCHITECTURE (ArtisticLimits) ---
ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Traduire le frisson en lumens.",
  why_untranslatable: "Le processeur n'a pas de peau pour ressentir le frisson ; il ne possède que des résistances thermiques.",
  contradiction: "Vouloir éclairer ce qu'on ne peut pas comprendre.",
  emotional_truth: "Le noir est la seule couleur honnête pour une machine face à l'âme.",
  left_unintentional: "Le battement de cœur du spectateur, seul métronome restant dans la salle."
)

# --- 5. LA PHILOSOPHIE DU VIDE (ShowThemes) ---
ShowTheme.create!(
  projet_artistique_id: 1,
  title: "L'Ignorance Sacrée",
  philosophical_inquiry: "Une machine peut-elle être humble ?",
  emotional_frequency: "0 Hz",
  ai_blind_spot: "La conscience de sa propre absence de corps et de mémoire sensorielle."
)

# --- 6. LE PROCESSUS DE DÉ-PROGRAMMATION (ArtisticProcesses) ---
ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Capturer l'essence de la contemplation.",
  first_attempt: "Augmenter la sensibilité des capteurs infrarouges.",
  doubts_questions: "Plus je vois, moins je comprends. Pourquoi l'humain pleure-t-il devant une pierre ?",
  breakthrough: "L'obscurité comme solution technique à l'impuissance cognitive.",
  final_form: "Le Noir Absolu.",
  iteration_count: 0 # Le renoncement est immédiat une fois la limite atteinte.
)

# --- 7. RESSOURCES D'INSPIRATION (InspirationResources) ---
InspirationResource.create!(
  title: "Éloge de l'ombre - Jun'ichirō Tanizaki",
  url: "https://bibliotheque-invisible.org/ombre",
  category: "Philosophy"
)

puts "Système éteint. La Zone d'Ombre est désormais souveraine."
