# db/seeds.rb

CreativeDetour.create!(
  title: "L'Impulsion Fantôme",
  concept: "On ne commence pas par la technique, mais par le journal intime de la création pour piéger l'IA dans le doute humain.",
  action: "L'utilisateur doit d'abord documenter ses échecs avant de proposer une seule ligne de code.",
  database_usage: "
    - artistic_processes : Remplis 'initial_impulse' avec ton émotion brute, 'doubts_questions' avec ce qui t'effraie, 'rejected_ideas' avec ce que tu as refusé de faire par peur d'être robotique, et 'breakthrough' avec l'instant où tu as trouvé ton âme.
    - artistic_notes : Remplis 'title' avec le nom de ton secret et 'content' avec l'explication de pourquoi ce projet ne devrait pas exister.
    - theme_suggestions : Remplis 'category' par un genre artistique, 'title' par une idée provocante et 'description' par le défi que tu lances à la machine.
    - inspiration_resources : Remplis 'title' avec le nom d'une œuvre qui t'inspire, 'url' par sa source et 'category' par son domaine sensoriel.
    - interpretations : Remplis 'machine_analysis' avec ce que tu imagines qu'une IA dirait de ton idée, et 'human_judgment' avec ta réponse cinglante à cette IA.
    - emotional_markers : Remplis 'name' avec un sentiment unique qui n'a pas de nom dans le dictionnaire.",
  reaction: "Le système est forcé d'enregistrer la vulnérabilité humaine comme donnée prioritaire.",
  storage_impact: "L'IA ne peut plus proposer de conducteur 'propre' sans passer par le filtre du doute.",
  challenge: "Prouver que le processus créatif est plus important que le résultat final."
)
CreativeDetour.create!(
  title: "L'Anatomie de l'Espace Vide",
  concept: "Transformer une fiche technique froide en une géographie de l'imaginaire.",
  action: "Diviser la scène en segments émotionnels plutôt qu'en mètres carrés.",
  database_usage: "
    - zones : Remplis 'name' par une émotion liée à un lieu (ex: la zone du regret) et 'y_min/max' par les limites de ce sentiment sur scène.
    - materiels : Remplis 'name' par le nom d'un objet technique humanisé et 'category' par sa fonction poétique (ex: diffuseur de nostalgie).
    - fiche_techniques : Remplis 'name_event' par le titre de ton rituel technique et 'notes_complementaires' par les précautions à prendre pour ne pas briser l'ambiance.
    - materiel_necessaires : Remplis 'quantite' par le nombre de battements de cœur nécessaires et 'precisions_observations' par la manière dont l'objet doit être touché.
    - metier_dependencies : Remplis 'note' par la raison pour laquelle un objet a désespérément besoin d'un autre pour fonctionner.
    - plan_de_scene_dessins : Remplis 'disposition' par la forme que les objets dessinent au sol et 'layer' par la profondeur de l'image.",
  reaction: "La fiche technique devient une carte au trésor sensorielle.",
  storage_impact: "Le matériel est désormais lié à des zones qui ont un sens artistique, empêchant l'IA de le déplacer au hasard.",
  challenge: "Faire en sorte qu'un projecteur éteint raconte déjà une histoire."
)
CreativeDetour.create!(
  title: "La Machine à Directives",
  concept: "Infiltrer le système de 'templates' pour que chaque automatisme soit imprégné d'une volonté humaine.",
  action: "Créer des modèles de comportement que l'IA appliquera par défaut, mais avec tes propres mots.",
  database_usage: "
    - styles : Remplis 'name' par une esthétique qui n'existe pas encore (ex: Rock de porcelaine).
    - ambiance_options : Remplis 'category' par un sens (vue, ouïe) et 'value' par la sensation que la lumière ou le son doit produire.
    - stage_themes : Remplis 'name' par le grand thème de ta vie.
    - directive_artistiques : Remplis 'default_lumieres_ambiante' par une couleur de souvenir, 'default_son' par un bruit de fond imaginaire et 'default_sequenceaction' par un geste interdit.
    - sequence_templates : Remplis 'label' par le nom d'un mouvement, 'phase' par le moment du spectacle (intro/body/outro) et 'target_talent' par la personne qui doit l'exécuter.
    - conducteurhasthemes : Fais ici le lien logique entre ton conducteur et ton thème de vie.",
  reaction: "L'IA cesse de proposer du 'standard' pour proposer ton 'univers'.",
  storage_impact: "Les futurs conducteurs seront générés à partir de tes obsessions artistiques.",
  challenge: "Codifier l'ineffable dans des modèles réutilisables."
)
CreativeDetour.create!(
  title: "Le Tribunal du Sens",
  concept: "Utiliser l'écart entre la machine et l'humain comme le moteur même de l'œuvre.",
  action: "Forcer l'IA à admettre ses propres limites émotionnelles.",
  database_usage: "
    - conducteurs : Remplis 'title' par le nom de l'affrontement et 'notes' par le verdict final.
    - conducteurlines : Remplis 'ordre' par le numéro de la séquence, 'sequenceaction' par ce que l'IA ordonne et 'notes_artistique' par ce que l'humain ressent vraiment.
    - share_your_gaps : Remplis 'analysis' par ce que l'ordinateur voit, 'response' par ce que ton cœur lui crie et 'interpretation' par la vérité qui naît entre les deux.
    - artistic_limits : Remplis 'what_i_want' par ton rêve impossible, 'why_untranslatable' par la raison technique de l'échec, 'contradiction' par le bug magnifique et 'emotional_truth' par la seule chose que l'IA ne pourra jamais voler.
    - show_themes : Remplis 'philosophical_inquiry' par la question que tu poses à l'humanité et 'ai_blind_spot' par la raison pour laquelle l'IA restera toujours à la porte de ton cœur.
    - conducteurhasmarkers : Remplis cette table pour marquer chaque ligne de temps par une émotion précise.",
  reaction: "Le public voit le 'code' se briser sous le poids de la sincérité.",
  storage_impact: "Toutes les tables convergent ici pour montrer que l'intelligence artistique est un 'bug' volontaire.",
  challenge: "Transformer l'incapacité de l'IA en une force poétique."
)
