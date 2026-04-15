# db/seeds.rb

# =============================================================================
# PROJET : I.A. Intelligence Artistique
# STRATÉGIE : POSSIBILITÉ 2 (Couvrir un maximum de tables par détour)
# =============================================================================

CreativeDetour.destroy_all

# -----------------------------------------------------------------------------
# DÉTOUR N°1 : "L'ERRANCE DU PROCESSEUR"
# DÉPART : 'ArtisticProcesses' (On commence par le doute de la création)
# BUT : Montrer le cheminement chaotique entre une idée pure et sa mise en forme.
# -----------------------------------------------------------------------------
# Tables utilisées : artistic_processes, conducteurs, conducteurlines, 
# artistic_limits, interpretations, share_your_gaps, artistic_notes, 
# inspiration_resources, conducteurhasmarkers.
# -----------------------------------------------------------------------------

CreativeDetour.create!(
  title: "L'Errance du Processeur",
  concept: "Documenter l'incapacité de l'IA à reproduire l'hésitation humaine.",
  action: "On initialise un 'ArtisticProcess' nommé 'L'Hésitation'. L'IA tente de générer un 'Conducteur' mais se heurte à une 'ArtisticLimit'. On compare ensuite l'analyse machine et le jugement humain via 'Interpretations'.",
  database_usage: "
    - Commencé par : artistic_processes (initial_impulse: 'Un battement de coeur irrégulier').
    - Conducteur & ConducteurLines : Traduction technique du battement (Tempo 60-120 variable).
    - ArtisticLimits : 'why_untranslatable' => 'Le code ne sait pas trembler'.
    - Interpretations & ShareYourGaps : La machine analyse une erreur système là où l'humain voit une émotion.
    - InspirationResources : Lien vers une étude sur la psychoacoustique des silences.
    - ArtisticNotes : 'La beauté réside dans le bug'.",
  reaction: "Le conducteur généré est 'trop parfait', ce qui pousse l'artiste à forcer des erreurs manuelles dans les 'CreativeNotes' des lignes de conduite.",
  storage_impact: "Remplit 'ArtisticProcesses' et 'ShareYourGaps'. Note : Les colonnes 'Human Judgment' sont laissées VIDES pour que vous puissiez y injecter votre propre ressenti.",
  challenge: "Accepter que le 'Breakthrough' (percée) soit une erreur de calcul."
)

# -----------------------------------------------------------------------------
# DÉTOUR N°2 : "LA SYMPHONIE DES OBJETS INANIMÉS"
# DÉPART : 'Materiels' (On commence par la physicalité et la technique)
# BUT : Inverser le regard : ce n'est plus l'humain qui utilise l'outil, 
#       c'est l'outil (IA) qui définit l'espace de l'humain.
# -----------------------------------------------------------------------------
# Tables utilisées : materiels, zones, metier_dependencies, fiche_techniques, 
# plan_de_scene_dessins, materiel_necessaires, directive_artistiques, 
# stage_themes, conducteurhasthemes.
# -----------------------------------------------------------------------------

CreativeDetour.create!(
  title: "La Symphonie des Objets Inanimés",
  concept: "Laisser la base de données décider de la scénographie en fonction des dépendances techniques.",
  action: "On définit des 'Zones' (Zone du Néon, Zone du Vide). On crée des 'Materiels' avec des 'MetierDependencies' absurdes (le projecteur ne s'allume que si la machine à fumée est à 10%). La 'FicheTechnique' devient une contrainte sculpturale.",
  database_usage: "
    - Commencé par : materiels (Nom: 'Le Témoin LED', zone_id: Zone 1).
    - MetierDependencies : Lie le 'Brouillard' au 'Son' (Si Son > 80dB alors Brouillard ON).
    - PlanDeSceneDessins : Positionne les objets en forme de spirale (Coordonnées X,Y).
    - DirectiveArtistiques : 'default_lumieres_ambiante' => 'Bleu Cyanure'.
    - StageThemes : 'L'Inertie'.
    - ConducteurHasThemes : Relie la technique pure au thème philosophique du projet.",
  reaction: "L'espace scénique devient un labyrinthe de câbles et de signaux où l'artiste doit trouver sa place.",
  storage_impact: "Remplit massivement 'Materiels', 'Zones' et 'FicheTechnique'. Les colonnes 'Notes Complémentaires' de la fiche technique sont VIDES pour vos instructions de sécurité poétiques.",
  challenge: "Faire d'une fiche technique une œuvre d'art visuelle."
)

# -----------------------------------------------------------------------------
# DÉTOUR N°3 : "L'AUTOMATE ÉMOTIONNEL"
# DÉPART : 'EmotionalMarkers' (On commence par le ressenti pur)
# BUT : Automatiser la mise en scène à partir de 'Meta-données' affectives.
# -----------------------------------------------------------------------------
# Tables utilisées : emotional_markers, styles, ambiance_options, 
# sequence_templates, show_themes, theme_suggestions, projet_artistiques.
# -----------------------------------------------------------------------------

CreativeDetour.create!(
  title: "L'Automate Émotionnel",
  concept: "Transformer une fréquence émotionnelle en une suite de commandes DMX et de mouvements.",
  action: "On part d'un 'EmotionalMarker' (ex: 'Mélancolie Synthétique'). Le 'Style' associé déclenche des 'AmbianceOptions'. Les 'SequenceTemplates' dictent comment le 'TargetTalent' (Chanteur) doit entrer en scène sous cette émotion.",
  database_usage: "
    - Commencé par : emotional_markers (Nom: 'Frisson Algorithmique').
    - Styles & AmbianceOptions : Style 'Glitch-Hop', Lumière 'Stroboscope lent'.
    - SequenceTemplates : Phase 'Intro', Target 'Danseur', Intensity '20%'.
    - ShowThemes : 'ai_blind_spot' => 'L'IA ne comprend pas pourquoi on pleure devant un coucher de soleil en 8-bit'.
    - ThemeSuggestions : Propose 'La nostalgie du futur'.
    - ProjetArtistique : Lie le conducteur 'Silicon Soul' à ce projet global.",
  reaction: "Le système suggère une mise en scène froide qui contraste violemment avec la chaleur de l'interprète.",
  storage_impact: "Remplit 'SequenceTemplates' et 'ShowThemes'. La colonne 'Philosophical Inquiry' est laissée VIDE pour que vous puissiez définir l'enquête de votre projet.",
  challenge: "Peut-on standardiser le frisson ?"
)
