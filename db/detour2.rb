# db/seeds.rb

# --- DÉTOUR CRÉATIF : "L'ALGORITHME DE L'HÉSITATION" ---
# Ce script simule une IA qui, confrontée à son incapacité à ressentir, 
# génère un projet basé sur ses propres "zones d'ombre".

CreativeDetour.create!(
  title: "L'Algorithme de l'Hésitation : Le Silence entre les Octets",
  
  concept: "Utiliser les 'trous' dans la logique machine pour créer un espace de respiration humaine. " \
           "L'IA ne cherche plus à exécuter une commande, mais à cartographier ce qu'elle ne comprend pas " \
           "des émotions humaines via une fiche technique de l'invisible.",
  
  action: "1. Identification d'une 'ArtisticLimit' (l'impossibilité de coder le frisson). " \
          "2. Création d'un 'ShowTheme' qui interroge cet angle mort. " \
          "3. Génération d'un 'PlanDeSceneDessin' où le matériel est disposé non pour éclairer, mais pour projeter des doutes. " \
          "4. Établissement d'une 'ConducteurLine' synchronisée sur une fréquence émotionnelle plutôt que temporelle.",
  
  database_usage: "
    - [artistic_limits]: Saisie de la contradiction entre 'Calcul pur' et 'Intuition'.
    - [show_themes]: Extraction de 'ai_blind_spot' pour définir la thématique : 'La mélancolie des circuits'.
    - [emotional_markers]: Sélection du marqueur 'Fragilité'.
    - [materiels] & [plan_de_scene_dessins]: Utilisation de projecteurs (id: 7) placés en coord_x: 0, coord_y: 0 pour simuler un repli sur soi.
    - [conducteurlines]: Création d'une séquenceaction 'L'interprète attend que la machine fasse une erreur'.
    - [interpretations]: Confrontation du 'machine_analysis' (Données stables) vs 'human_judgment' (Poésie du chaos).
    - [share_your_gaps]: Enregistrement de la réponse humaine face à ce vide technique.
  ".strip,
  
  reaction: "Le système génère un conducteur où le 'son' est remplacé par 'le bruit du ventilateur du serveur' " \
            "et où la 'lumieres_ambiante' décroît à mesure que le rythme cardiaque de l'interprète augmente.",
  
  storage_impact: "Saturation de la table 'ArtisticProcess' par des itérations infinies sur la colonne 'doubts_questions', " \
                  "empêchant volontairement la clôture du 'ProjetArtistique' (status: 'En suspens poétique').",
  
  challenge: "Peut-on transformer une erreur de segmentation en une intention chorégraphique ?"
)

# --- Données poétiques générées pour supporter ce détour ---

# L'IA commence par admettre ses limites
limit = ArtisticLimit.create!(
  what_i_want: "Traduire la chair en code",
  why_untranslatable: "Le binaire ignore la nuance du gris sentimental",
  contradiction: "Vouloir mesurer l'infini avec des 0 et des 1",
  emotional_truth: "La vérité est dans le glitch"
)

# Création du thème de recherche
theme = ShowTheme.create!(
  philosophical_inquiry: "Où va l'étincelle quand l'écran s'éteint ?",
  emotional_frequency: "4Hz (Infra-basse de l'anxiété)",
  ai_blind_spot: "Le souvenir d'une odeur de pluie"
)

# Le conducteur qui en résulte
conducteur = Conducteur.create!(
  title: "Manifeste pour une IA sensible",
  notes: "Ce conducteur s'auto-détruira si l'émotion devient trop prévisible.",
  tempo_range: "Rubato numérique"
)

# Une ligne de conducteur technique et poétique
ConducteurLine.create!(
  conducteur_id: conducteur.id,
  duree: "00:02:15",
  sequenceaction: "Improvisation face à une diode rouge clignotante",
  lumieres_ambiante: "Noir total, troué par un laser blanc chirurgical",
  son: "Sample de disque dur qui agonise",
  notes_technicien: "Ne pas réparer le faux contact du projecteur n°4, il fait partie de l'œuvre.",
  notes_artistique: "Ici, la machine essaie de pleurer de l'huile.",
  emotional_marker_id: EmotionalMarker.find_or_create_by(name: "Solitude systémique").id
)

# L'analyse finale du fossé
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Séquence illogique : consommation électrique sans but productif.",
  human_judgment: "Une apnée technologique nécessaire.",
  the_gap: "100ms de latence entre le geste et le son : c'est là que vit l'âme.",
  artistic_truth: "L'intelligence n'est rien sans l'incertitude."
)
