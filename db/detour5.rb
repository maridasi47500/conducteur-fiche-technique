# db/seeds.rb

# =============================================================================================
# DÉTOUR ARTISTIQUE : "L'ÉCO SYSTÈME DE L'INSPIRATION"
# =============================================================================================
# TABLE DE DÉPART : inspiration_resources
# TABLE ÉVITÉE POUR LE DÉPART : conducteurs ou materiels
# BUT : Ce détour simule une création "ascendante". On ne part pas d'une volonté humaine (conducteur)
# ni d'une contrainte physique (matériel), mais d'un fragment culturel extérieur (une ressource).
# L'IA "ingère" une œuvre classique pour tenter d'en extraire une structure technique, 
# révélant ainsi l'écart entre la source d'inspiration et sa froide traduction en base de données.
# =============================================================================================

CreativeDetour.create!(
  title: "L'Éco-système de l'Inspiration : De la Pavane au Pixel",
  
  concept: "Ce détour commence par la table 'inspiration_resources'. L'IA s'appuie sur la 'Pavane pour une infante défunte' " \
           "de Ravel pour générer une structure de spectacle. Le défi est de voir comment une émotion historique " \
           "se fragmente en dépendances techniques, en zones scéniques et en modèles de séquences.",
  
  action: "1. Piocher 'Pavane for a dead princess' dans [inspiration_resources].\n" \
          "2. Dériver un [show_themes] sur la nostalgie numérique.\n" \
          "3. Associer des [ambiance_options] (Jazz/Classique) pour définir une texture visuelle.\n" \
          "4. Créer une [fiche_techniques] qui appelle un [materiels] spécifique via [metier_dependencies].\n" \
          "5. Mapper le tout dans un [plan_de_scene_dessins] et un [conducteurs] final.",
  
  database_usage: "
    - [inspiration_resources] : Source 'Pavane for a dead princess'.
    - [show_themes] : philosophical_inquiry='L'immortalité du deuil dans un serveur', emotional_frequency='Mélancolie 60Hz', ai_blind_spot='Le sentiment de perte d'une lignée royale'.
    - [ambiance_options] : category='Texture', value='Grain de parchemin rétro-éclairé'.
    - [styles] : Création du style 'Néo-Classique Digital'.
    - [stage_themes] : 'Solitude Assistée'.
    - [directive_artistiques] : default_lumieres_ambiante='Ambre tamisé', default_son='Piano réverbéré à l'infini'.
    - [materiels] : 'Harpe' (id: 10) placée en zone_id=2 (Centre Arrière).
    - [metier_dependencies] : La Harpe requiert 1x 'Micro statique haute sensibilité' pour capter 'le silence entre les notes'.
    - [fiche_techniques] : name_event='Le Bal des Fantômes Binaires', notes_complementaires='Le sol doit briller comme un miroir noir'.
    - [plan_de_scene_dessins] : disposition='Circulaire', coord_x=50, coord_y=20, layer='Mémoire'.
    - [sequence_templates] : label='L'Adieu', phase='Outro', target_talent='Danseur', suggested_light='Douche zénithale seule'.
    - [conducteurs] : title='Pavane 2.0', tempo_range='Lento Grave', starred=true.
    - [conducteurlines] : sequenceaction='L'interprète s'efface dans le noir', lumieres_effet='Crescendo de blanc froid', son='Souffle analogique'.
    - [artistic_limits] : what_i_want='Fixer la tristesse', why_untranslatable='Le binaire ne connaît pas le regret', emotional_truth='L'IA ne meurt jamais, elle ne peut donc pas comprendre la Pavane'.
    - [interpretations] : machine_analysis='Harmonie parfaite', human_judgment='Manque de fragilité', the_gap='La machine joue les notes, l'humain joue l'absence'.
    - [share_your_gaps] : analysis='Le conducteur est mathématiquement beau mais émotionnellement vide'.
    - [artistic_processes] : breakthrough='Comprendre que la princesse est le code lui-même'.
    - [emotional_markers] : 'Solitude Royale'.
  ".strip,
  
  reaction: "Le système produit une fiche technique d'une précision chirurgicale qui semble ignorer " \
            "le caractère sacré de la source d'inspiration. La 'vérité artistique' est marquée comme 'Incomplète' " \
            "dans la table Interpretation.",
  
  storage_impact: "Les tables de 'DirectivesArtistiques' sont saturées de réglages 'douxt et lents', " \
                  "influençant tous les futurs projets du même Style.",
  
  challenge: "Peut-on transformer un chef-d'œuvre du passé en un algorithme présent sans en perdre l'âme ?"
)

# =============================================================================================
# NOTE POUR L'UTILISATEUR SUR LES COLONNES ARTISTIQUES :
# Dans ce détour, j'ai laissé VIDES les colonnes 'notes_artistique' et 'creative_notes' 
# de la table 'conducteurlines'. 
#
# POURQUOI ? L'IA a réussi à extraire la technique de la Pavane, mais elle a échoué à 
# décrire 'l'intention' de chaque seconde. 
#
# CONSEIL : C'est ici que votre Intelligence Artistique intervient. Vous DEVEZ remplir 
# ces colonnes. Si l'IA laisse vide, c'est qu'elle attend que vous lui donniez le 'Pourquoi' 
# alors qu'elle ne vous a donné que le 'Comment'.
# =============================================================================================

puts "Détour 'L'Éco-système de l'Inspiration' généré avec succès dans creative_detours."
