# db/seeds.rb

# =============================================================================
# DÉTOUR ARTISTIQUE : "La Résistance des Objets"
# =============================================================================
# TABLE DE DÉPART : Zones & Materiels
# BUT : Partir du poids du matériel et de l'espace physique pour forcer l'IA
# à se confronter à la gravité humaine avant de penser à l'émotion.
# ORDRE DE REMPLISSAGE SUGGÉRÉ : 
# 1. Zones -> 2. Materiels -> 3. MetierDependencies -> 4. FicheTechnique 
# -> 5. PlanDeScene -> 6. ProjetArtistique -> 7. Conducteur -> 8. ArtisticLimits
# =============================================================================

CreativeDetour.create!(
  title: "La Résistance des Objets",
  concept: "L'intelligence n'est pas qu'un algorithme, c'est aussi la gestion de la matière. Ce détour propose de définir d'abord où se trouvent les obstacles physiques sur scène pour voir comment l'émotion doit 'contourner' le matériel.",
  action: "Placer une batterie lourde en Zone 0 (centre) et demander à l'IA de générer une émotion de 'légèreté' malgré l'encombrement physique.",
  database_usage: "
    - Zones : Définissez ici les limites de votre cage de scène.
    - Materiels : Listez les objets qui pèsent (ex: piano, ampli) et leur besoin en énergie.
    - MetierDependencies : Liez chaque machine à ses câbles nécessaires (la dépendance invisible).
    - FicheTechniques : Donnez un nom d'événement technique à cette contrainte.
    - PlanDeSceneDessins : Coordonnez les objets X/Y pour visualiser l'encombrement.
    - MaterielNecessaires : Quantifiez l'effort logistique.
    - ProjetArtistiques : Nommez l'œuvre qui naît de cette lutte avec le matériel.
    - Conducteurs : Liez le projet à un fil temporel.
    - ArtisticLimits : Inscrivez ici pourquoi la machine ne comprend pas la fatigue de porter un ampli.
    - ArtisticProcesses : Notez les versions rejetées du plan de scène.
  ",
  storage_impact: "Crée une base solide où l'artistique est contraint par le réel technique.",
  challenge: "Peut-on ressentir de la poésie dans un inventaire de câbles XLR ?"
)

# =============================================================================
# DÉTOUR ARTISTIQUE : "Le Silence de la Machine"
# =============================================================================
# TABLE DE DÉPART : Emotional Markers
# BUT : Partir d'une émotion pure et 'intraduisible' pour voir comment la technique
# échoue ou réussit à la servir.
# ORDRE DE REMPLISSAGE SUGGÉRÉ :
# 1. EmotionalMarkers -> 2. ShowThemes -> 3. Interpretations -> 4. ShareYourGaps
# -> 5. ConducteurLines -> 6. AmbianceOptions -> 7. Styles
# =============================================================================

CreativeDetour.create!(
  title: "Le Silence de la Machine",
  concept: "L'IA analyse tout, mais elle ne 'ressent' pas le silence entre deux notes. Ce détour part du vide émotionnel pour forcer la base de données à admettre ses lacunes.",
  action: "Créer un marqueur émotionnel 'Mélancolie Numérique' et comparer l'analyse de l'IA avec votre propre ressenti humain.",
  database_usage: "
    - EmotionalMarkers : Nommez l'émotion de départ (ex: Solitude).
    - ShowThemes : Décrivez pourquoi l'IA est aveugle à cette émotion précise.
    - Interpretations : Notez l'écart entre le calcul machine et votre cœur.
    - ShareYourGaps : Documentez le moment précis où la machine 'rate' l'interprétation.
    - ConducteurLines : Remplissez les colonnes 'son' par du silence et 'lumieres' par du noir.
    - AmbianceOptions : Choisissez des valeurs de lumières 'froid' ou 'vibration faible'.
    - Styles : Associez cela à un style minimaliste.
    - ArtisticNotes : Écrivez un poème court sur ce que la base de données ne peut pas stocker.
  ",
  storage_impact: "Remplit les tables de 'vide intentionnel' et de métadonnées philosophiques.",
  challenge: "Comment coder un bug qui devient une émotion ?"
)

# =============================================================================
# DÉTOUR ARTISTIQUE : "L'Automatisme Chorégraphique"
# =============================================================================
# TABLE DE DÉPART : SequenceTemplates
# BUT : Partir du mouvement (Entrée/Jeu/Sortie) pour construire une structure
# rythmique avant même d'avoir un thème.
# ORDRE DE REMPLISSAGE SUGGÉRÉ :
# 1. SequenceTemplates -> 2. DirectiveArtistiques -> 3. StageThemes 
# -> 4. InspirationResources -> 5. ConducteurLines
# =============================================================================

CreativeDetour.create!(
  title: "L'Automatisme Chorégraphique",
  concept: "L'IA est excellente pour répéter des motifs. Ce détour utilise les modèles de séquences comme des 'boucles' de programmation pour les corps humains sur scène.",
  action: "Générer une séquence d'entrée/corps/sortie pour chaque talent (danseur, musicien) de façon mathématique.",
  database_usage: "
    - SequenceTemplates : Définissez le mouvement (Entrée rapide, Jeu statique, Sortie lente).
    - DirectiveArtistiques : Transformez ces mouvements en ordres techniques automatiques (Lumière rasant, fumée 20%).
    - StageThemes : Donnez un nom de chapitre à cette séquence.
    - InspirationResources : Liez une vidéo de mouvement mécanique ou de robotique.
    - ConducteurLines : Remplissez les colonnes 'interpretes' et 'sequenceaction'.
    - ThemeSuggestions : Suggérez d'autres façons de bouger à l'utilisateur.
  ",
  storage_impact: "Structure le conducteur comme un algorithme de mouvement.",
  challenge: "L'humain peut-il être aussi précis qu'une ligne de code ?"
)

puts "Seeds créées avec succès ! Vous pouvez maintenant explorer la base en partant soit de la MATIÈRE (Zones), soit de l'ÉMOTION (Markers), soit du MOUVEMENT (Templates)."
