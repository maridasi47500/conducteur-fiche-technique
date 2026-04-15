# db/seeds.rb

# =============================================================================
# DÉTOUR : "L'INTENTION FANTÔME"
# DÉPART : 'ArtisticLimits' (On commence par ce que l'IA ne peut pas deviner)
# BUT : Montrer que sans la précision humaine, le spectacle n'est qu'une suite
#       de switchs (0/1) sans âme.
# =============================================================================

CreativeDetour.create!(
  title: "L'Intention Fantôme",
  concept: "Un duel entre la partition jouée (donnée) et l'intention de l'artiste (invisible pour l'IA).",
  action: "L'artiste branche une guitare ('Materiels'). La machine détecte un signal et propose une 'DirectiveArtistique' par défaut. L'humain doit alors remplir la colonne 'emotional_truth' pour 'expliquer' à la machine pourquoi ce son doit être déchirant et non juste fort.",
  database_usage: "
    - Commence par : artistic_limits ('what_i_want' : 'Un cri silencieux', 'why_untranslatable' : 'Le 0 et le 1 ne connaissent pas l'agonie').
    - Materiels & MetierDependencies : La 'Guitare' (power_needed: true) liée à l'amplificateur.
    - Conducteurs & ConducteurLines : Une séquence de 04:33 (clin d'œil à John Cage) où 'videoprojection' est 'Noir Absolu'.
    - SequenceTemplates : Phase 'Body', Target 'Musicien', 'suggested_light' : 'Stroboscope' (car l'IA pense que le bruit = chaos).
    - Interpretations : 'machine_analysis' : 'Signal audio instable', 'artistic_truth' : 'L'instabilité est le message'.
    - ShareYourGaps : L'IA demande : 'Pourquoi ne pas compresser le signal ?'. L'humain répond : 'Parce que la douleur ne se compresse pas'.",
  reaction: "La machine finit par exécuter la séquence, mais elle affiche une alerte 'Performance inefficace' car elle ne comprend pas l'énergie dépensée pour si peu de son.",
  storage_impact: "Remplit 'ArtisticNotes' avec une liste de fréquences vs une liste d'émotions. Les colonnes 'Creative Notes' des lignes de conducteur sont remplies de poésie technique.",
  challenge: "Peut-on transformer un '0' en un 'O' d'émerveillement ?"
)

# -----------------------------------------------------------------------------
# DÉTOUR COMPLÉMENTAIRE : "LE MARCHÉ AUX SOUVENIRS" (Commerces du quartier)
# DÉPART : 'AmbianceOptions' (On commence par les textures sensorielles)
# BUT : Simuler l'entrée dans un commerce où l'IA analyse les corps sans voir les histoires.
# -----------------------------------------------------------------------------

CreativeDetour.create!(
  title: "Le Marché aux Souvenirs",
  concept: "L'IA scanne un commerce de quartier et traduit l'ambiance en une fiche technique froide.",
  action: "En entrant dans la boutique, l'IA identifie les 'Zones'. Elle utilise les 'AmbianceOptions' pour définir le 'Style'. Elle compte les 'interpretes' (les clients) comme des objets en mouvement.",
  database_usage: "
    - Commence par : ambiance_options (Style: 'Vintage', Category: 'Lumieres', Value: 'Faible IRC, Jaune').
    - Zones & PlanDeSceneDessins : Cartographie du comptoir et des étagères comme des obstacles scéniques.
    - FicheTechniques & MaterielNecessaires : Liste les 'objets' du magasin comme du 'matériel' (ex: Balance ancienne = objet de décor).
    - ShowThemes : 'ai_blind_spot' : 'L'odeur du vieux papier et la poussière lumineuse'.
    - ThemeSuggestions : Suggère 'Le commerce des souvenirs'.
    - ProjetArtistiques : Statut 'Analysed' mais pas 'Understood'.",
  reaction: "L'IA génère un plan de scène parfait, mais oublie de mentionner que le commerce est fermé depuis 30 ans. Elle ne voit que ce qui est 'allumé'.",
  storage_impact: "Lien final entre toutes les tables. Utilise 'ConducteurHasThemes' pour boucler le voyage.",
  challenge: "Faire comprendre à l'IA que l'image videoprojetée n'est pas la réalité, mais un souvenir."
)
