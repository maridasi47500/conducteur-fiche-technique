# db/seeds.rb

# --- DÉTOUR CRÉATIF : "L'ÉCHO DANS LE SILICE" ---
# Ce détour simule une phase où l'IA, au lieu de générer un conducteur standard, 
# s'arrête sur ses propres limites pour forcer une collaboration émotionnelle avec l'humain.

CreativeDetour.create!(
  title: "L'Écho dans le Silice : Protocole d'Incertitude",
  
  concept: "Interroger le 'Gap' entre la commande binaire et le ressenti organique. " \
           "L'IA génère une séquence où la lumière et le son ne répondent plus à une logique de spectacle, " \
           "mais tentent de traduire une 'vérité émotionnelle' non-translatable.",
  
  action: "L'utilisateur lance une génération de conducteur. Le système, au lieu de répondre, " \
          "isole un 'Emotional Marker' (ex: Solitude) et refuse de remplir les colonnes techniques tant " \
          "que l'humain n'a pas défini la 'Contradiction' de la scène.",
  
  database_usage: "
    1. Pioche un 'StageTheme' : 'Le Mur de Données'.
    2. Crée une 'ArtisticLimit' : what_i_want='Traduire le souffle', why_untranslatable='Absence de capteur pulmonaire'.
    3. Génère une 'ConducteurLine' liée à un 'EmotionalMarker' (Mélancolie) avec une machine_brouillard réglée sur 'Densité d'oubli'.
    4. Analyse via 'Interpretation' : the_gap='La machine calcule la fréquence, l'humain ressent le frisson'.
    5. Définit une 'DirectiveArtistique' : default_son='Fréquence de 432Hz parasitée par un battement de cœur'.
    6. Vérifie 'Materiel' : nécessite un 'Projecteur asservi' (id: 1) mais avec une 'Zone' d'exclusion pour laisser l'interprète dans l'ombre.
  ".strip,
  
  reaction: "Le technicien reçoit un conducteur 'troué' où les notes_technicien disent : 'Éteignez tout si l'acteur pleure'. " \
            "Cela force une improvisation technique en temps réel, réintroduisant l'aléa humain.",
  
  storage_impact: "Remplissage massif de la table 'ShareYourGaps' (Réponses de l'utilisateur face à l'inconnu) " \
                  "et incrémentation du 'iteration_count' dans 'ArtisticProcess' sans jamais atteindre la 'FinalForm'.",
  
  challenge: "Peut-on programmer une erreur volontaire pour générer de la poésie ?"
)

# Simulation des données poétiques injectées indirectement par ce détour :
# (Ces lignes montrent comment les tables sont utilisées pour nourrir le détour ci-dessus)

# 1. Définition de la limite
ArtisticLimit.create!(
  what_i_want: "Capturer l'instant où l'idée naît",
  why_untranslatable: "Le processeur est trop rapide pour l'hésitation humaine",
  contradiction: "Vouloir fixer l'éphémère dans une base de données SQLite",
  emotional_truth: "La beauté réside dans le bug"
)

# 2. Le conducteur fragmenté
conducteur = Conducteur.create!(title: "Performance : Erreur 404 Sentiment", tempo_range: "Lent / Aléatoire")

Conducteurline.create!(
  conducteur_id: conducteur.id,
  duree: "00:04:04",
  sequenceaction: "L'interprète regarde la console sans bouger",
  lumieres_ambiante: "Bleu froid (0,0,255) à 1%",
  machine_brouillard: "Nappe basse, comme un regret",
  son: "Silence numérique compressé",
  creative_notes: "Ne pas chercher à remplir l'espace, laisser le vide parler.",
  notes_artistique: "Ici, l'IA avoue son impuissance."
)

# 3. L'analyse du fossé (The Gap)
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Stase de données détectée. Rendement 0%.",
  human_judgment: "Une tension insupportable et magnifique.",
  the_gap: "L'IA voit une absence de signal, l'humain voit une présence spirituelle.",
  artistic_truth: "L'art commence là où le calcul s'arrête."
)

puts "Détour artistique 'L'Écho dans le Silice' semé avec succès."
