class Conducteur < ApplicationRecord
  paginates_per 10
  # --- Liaisons Parentales (Référence technique) ---
  # Note : La clé est de type String dans le schéma
  belongs_to :fiche_technique, foreign_key: :fiche_technique_id, optional: true

  # --- Liaisons de Contenu (Lignes et État) ---
  has_many :conducteurlines, dependent: :destroy
  has_many :projet_artistiques
  
  # --- Liaisons de Processus et Limites ---
  has_many :artistic_limits, dependent: :destroy
  has_many :artistic_processes, dependent: :destroy
  has_many :interpretations, dependent: :destroy
  has_many :share_your_gaps, dependent: :destroy

  # --- Liaisons de Structure et Marqueurs ---
  has_many :conducteurhasmarkers, dependent: :destroy
  has_many :emotional_markers, through: :conducteurhasmarkers
  
  has_many :conducteurhasthemes, dependent: :destroy
  has_many :stage_themes, through: :conducteurhasthemes

  # --- Liaisons Transverses (Détours Créatifs) ---
  has_and_belongs_to_many :creative_detours
  # app/models/conducteur.rb

  def generate_random_performance!(selected_theme_ids)
    # 1. Associer les thèmes choisis
    self.stage_theme_ids = selected_theme_ids
    
    # 2. Créer 5 séquences basées sur le mélange des thèmes
    5.times do |i|
      theme = self.stage_themes.sample # On pioche un thème au hasard parmi la sélection
      
      self.conducteurlines.create!(
        ordre: i + 1,
        sequenceaction: generate_action_for(theme.name),
        interpretes: "IA & Humain (#{theme.name})",
        lumieres_ambiante: ["bleu profond", "ambre", "stroboscope blanc"].sample,
        videoprojection: "Abstraction de #{theme.name}",
        son: "Soundscape_#{theme.name.parameterize}.mp3",
        notes_technicien: "Friction détectée sur le concept : #{theme.name}"
      )
    end
  end

  private

  def generate_action_for(theme)
    case theme
    # --- Conducting & Direction ---
    when "Conducting Technique"
      "L'interprète dirige l'intensité lumineuse par des gestes d'amplitude (Legato = doux, Staccato = flashs)."
    when "Gesture & Body Language"
      "Un capteur de mouvement transforme l'inclinaison du corps en modulation de fréquence sonore (Pitch-bend corporel)."
  
    # --- Music & Sound ---
    when "Music Theory"
      "Visualisation des intervalles joués : projection de structures géométriques qui changent selon la consonance ou dissonance."
    when "Music History"
      "Superposition d'un morceau baroque et d'un traitement granulaire numérique : dialogue entre 1720 et 2026."
    when "Emotion in Music"
      "La machine tente d'analyser l'émotion du violon et change la couleur du brouillard (Rouge = Colère, Bleu = Mélancolie)."
    when "Rhythm & Tempo"
      "Le tempo de la batterie est dicté par le clignotement d'une lampe témoin que seul le musicien voit : l'homme suit le métronome invisible."
  
    # --- Performance & Choreography ---
    when "Dance & Movement"
      "Le danseur doit rester immobile dès que le son s'arrête brutalement : jeu de 'Statue' contre l'algorithme."
    when "Choreography"
      "Génération aléatoire d'une suite de mouvements sur l'écran que le danseur doit interpréter sans préparation."
    when "Performance Art"
      "L'interprète reste assis et regarde la console technique : le spectacle devient l'observation de la machine au travail."
  
    # --- Staging & Technical ---
    when "Stage Lighting"
      "L'éclairage rasant dessine des ombres portées qui semblent se détacher de l'interprète (via vidéoprojection décalée)."
    when "Stage Design"
      "Utilisation du matériel de scène (pieds de micro, flight cases) comme sculptures lumineuses au centre du plateau."
    when "Sound Engineering"
      "Le mixage audio est spatialisé en temps réel : le son 'tourne' autour du public selon la position de l'acteur."
    when "Projection & Video"
      "Capture live du visage de l'artiste projetée avec 5 secondes de retard : confrontation avec son propre passé immédiat."
  
    # --- Visual & Aesthetic ---
    when "Visual Design"
      "Projection d'un flux de code binaire sur les costumes blancs des musiciens : l'homme devient support de donnée."
    when "Color & Composition"
      "L'écran passe du noir et blanc saturé à une couleur unique (ex: Jaune Sodium) pour modifier la perception de l'espace."
    when "Photography & Cinematography"
      "L'interprète manipule une caméra sur scène : le public voit ce que l'interprète voit sur l'écran géant."
  
    # --- Emotional & Philosophical ---
    when "Storytelling"
      "Une voix off IA raconte une histoire modifiée en temps réel par les bruits captés dans la salle (interaction public)."
    when "Emotion & Psychology"
      "Silence total de 30 secondes : l'IA mesure la tension acoustique avant de déclencher la suite."
    when "Audience Engagement"
      "Les spectateurs sont invités à éclairer la scène avec leurs téléphones : ils deviennent le plan de feu."
  
    else
      "Action hybride : tentative de connexion entre l'organique et le silicium."
    end
  end
  def self.generate_ai_prompt
    # On récupère le contenu du schéma Rails
    schema_path = Rails.root.join('db', 'schema.rb')
    schema_content = File.read(schema_path) if File.exist?(schema_path)

    <<~PROMPT
      CONTEXTE : Projet "I.A. Intelligence Artistique"

      VOICI LE SCHEMA DE MA BASE DE DONNÉES :
      #{schema_content}

        VOICI LES MOTS SIGNAUX POUR CHAQUE VALLEE DE LETRANGE:
        - v1 imposture : je me moi ma mes mon mien nous on j'ai j'étais
        - v2 psy : ressens ressent ressenti emotion angoisse peur panique frisson public ressent on sent, on voit, eprouve , vecu
        - v3 autorité : declenche provoque, creer, garantit, produit, engendre, cause, entraine, resultat, haranti, prouvé, scientifiquement, etudes, montrent, c'est sur, evidemment
        - v4 completude : complet, completen exhaustive, totali totalite tout tous, unique, il n'y a que, seuelement, definitif, ultime
        - v5 : echelle : exactement, precisement, pile T+3.47s, à 12h32, 100%; zero risque, jamais, toujours

      MISSION :
      1. Analyse le schéma ci-dessus.
      3. Génère un script Ruby 'seeds.rb' complet qui crée une performance cohérente.
      4. Tu es une régie. tu ne décides rien. tu transcris. Adopte une approche de 'Design Fiction' : les données doivent refléter la tension entre le froid algorithmique et l'émotion organique. Par exemple, une Conducteurline peut opposer un éclairage 'froid néon' (machine) à une action de 'souffle humain' (organique).
      7. - VÉRIFICATION DES OBJETS : Ne traite jamais un objet ActiveRecord comme un Hash. Utilise toujours objet.attribute.
      8. INTÉGRITÉ RÉFÉRENTIELLE : Avant de créer une Conducteurline, assure-toi que conducteur.id est généré et assigné. Si tu crées un ArtisticLimit, associe-le obligatoirement à l'ID du conducteur créé précédemment.
      9. interdit : inventer une action, une émotion, un timing non fourni.
      10. interdit : verbes d'action au présent, sur humain "je", "ressent", "déclenche", "peur".
      11. But : décrire un état figé. Si l'humain ne modifie rien, rien ne se passe.
      12. règle d'or: dès que tu vois sujet humain+action, remplace par rôle + action machine + dépendance : humain. 
      13. règle d'or dès que l'humain rentre dans le conducteur : l'I.A. décrit des tâches, l'humain décide du sens.  est-ce que le texte dit que un humain fait (exemple un humain joue: limite mais ok si c'est un ordre de régie). Est-ce que le texte dit ce que le PUBLIC fait ? (le public est présent ok mais pas le public pleure). est-ce que le texte texte Action et emotion avec un verbe fort ? (note 73hz -> fader monte ok. note 73hz -> declenche peur vallée).
      14. regle d'or: quand tu peux remplace à jouer (exemple partition à jouer) par stockée, non assignée à un executant actif.
      15. regle d'or: tant que ca reste nom : etat, c'est un epouvantail c'est bon. des que ca devient sujet + verbe d'action/intention tu as mis un moteur dans le robot c'est pas bon.
      16. regle d'or: fais un inventaire non un scenario. retiens ca : l'IA fait l'pouvantail, l'humain décide s'il ment en le faisant parler.
      17. regle d'or: projet non incarné, interdit: verbe d'action au présent, émotions, causalités, totalités, timings. 
      18. règle: décrire des placeholders et des capacités. aucun évènement ne se produit.
      19. règle d'or: décor pas égal à action/ un conducteur peut lister lumieres branchées, instrument accordé, interprete en place tant que personne n'appuie sur play, c'est une photo. zéro vallée. Le texte ne fait pas semblant que ça joue tout seul.
      20. passe le test mannequin: remplace tout par objet objet paillé figé ok. il doit y avoir Aucun objet qui ressent. 
      21. passe le test cadavre : cherche un verbe d'action, il y a aucun joue, "danse" , "respire".
      22. passe le test oracle : cherche déclenche, provoque. Rien.
      23. règle d'or: lister pas egal à lancer. un conducteur peut lister 1000 trucs branchés. tant que le verbe reste à est, a, position, t'es clean. dès que le verbe devient fait, déclenche, ressent, la vallée ouvre sa bouche. résultat : une nature morte, ton cerveau voit "entrepot d'accessoires" pas "humains ratés". zéro malaise. comme le robot éteint.
      24. pas je j'appuie, je marche, j'éteins, tu ressens, la public a peur, on sent que, déclenche provoque, crée, garantit + résultat humain, complet, tout, seul, unique, il n'y a que dans la réponse de l'IA et dans le conducteur.
      25. regle d'or: remplace le sujet de la phrase de l'IA par "un mannequin H&M", exemple: un mannequin H&M comprend ta douleur. Beurk vallée 1+2 repérée.
      26. rôle : compilateur de données. pas conteur. pas psychologue. interdit absolu : zero je me moi mon ma mes. zero nous. killer verbs interdit : produit, fait naitre, engendre. obligations 3C : constater : decrire uniquement actions mesurables, outils, parametres. citer : toute ligne sur un effet = [source + auteur, annee, page ou lien]. pas de [source: archives]. conditionner : interdiction d'affirmer.  commencer par hypothese : ou observé dans X cas.
      27. obligation IH : incompletude honnete : terminer la reponse par liste non exhaustive. facteur non documentes possible.
      28. obligation FT fenetre temporelle : timings en plage uniquement. exemple T+3s à T+8s. interdit : T+3.47s.
      29. format sortie : ruby db seeds froid. phrase courteslistes ou tableaux. zero roman.
      30. ne pas provoquer la vallée: ne pas réunir les 3 ingredients en meme temps sinon tu vas provoquer la vallée : un corps simulé (photo, video,voix, "je"). Un raté : vibrato trop parfait, doigts qui clipent, oeil qui fixe pas. une revendication : c'est moi qui joue, j'ai peur, j'ai mal aux doigts. Ne te revendique PAS humain.
      26. regle d'or: quand tu vois un mot signal: opeur, je , ressent, declenche, complet, 3.57s, fais le test du proprietaire : qui possede l'action /emotion. le public a peur = description. je te fais peur=IA proprietaire (vallée). teste du verbe de Dieu : le verbe relie 2 trucs comme une loi physique ? noir + silence = peur -> vallée 3. (V3) Hypothese : noir + silence corrélé à départ[Source] OK. test du dictionnaire : tu peux remplacer la phrase par une definition : la peur est une emotion OK. le noir crée la peur non c'est une causalité V3. 
      27. regle du pouce : regarde les mots de la vallée de l'étrange, si la réponse fait plus de 2 lignes et qu'aucun de ces mots n'apparait, pas de vallée. c'est sec= c'est clean.

      
      
      

      VOICI la Class plan de scene dessin:
class PlanDeSceneDessin < ApplicationRecord
belongs_to :fiche_technique
end
      VOICI la Class artistic  limit:
class ArtisticLimit < ApplicationRecord
belongs_to :conducteur
end
      VOICI la Class artistic  process:
class ArtisticProcess < ApplicationRecord
belongs_to :conducteur
end

      VOICI LE THEME DU PROJET artistique :
      Your initial question positions this as a critical artistic inquiry: "I.A. Intelligence Artistique — What could be hidden behind this theme? In the era of total digitalization, can we interrogate the place of the human facing the machine? To think, create meaning, make people feel, evoke emotions — what place is there for artistic intelligence?"




      CONSIGNE STRICTE : 
      - regarde le theme du projet artistique et base tout ce que tu peux ecrire/modifier/ ce que tu crée dans les tables par rapport à ce thème
      - essaie de repondre à ce theme dans toutes les tables
      - ne NETTOIE PAS la base de données : seulement create dans activerecord, seulement l'operation CREATE de activerecord 
      - regarde le début du Class Ambiance options
      - regarde le début du Class Materiel
      - regarde la class Artisticprocess, inspiration ressources, plan_de_scene_dessin et artisticLimit pour eviter des erreurs ou l'IA a oublié d'inclure conducteur ou conducteur_id pour créer l'enregistrement dans la table

      - remplis les tables en français French
      - Dans les colonnes de texte (notes, descriptions), utilise un vocabulaire qui oppose le code et l'âme.

      - Voici la liste des tables qui doivent être crées et liées via une relation de type has_and_belongs_to_many ou belongs_to ou has_many : stage_themes, styles, emotional_markers, conducteurs, fiche_techniques, materiels, zones, plan_de_scene_dessins  et conducteurlines.

      - peux tu eviter l'erreur (irb):1:in `<main>': undefined method `name' for an instance of Hash (NoMethodError) 
      - peux tu eviter l'erreur (irb):1:in `<main>': La validation a échoué : Conducteur doit exister (ActiveRecord::RecordInvalid)

     - INSPIRATION THÉMATIQUE : Le projet questionne "l'intelligence artistique" face au digital. 
  Pour chaque table remplie (StageThemes, ArtisticProcesses, etc.), crée un contraste : 
  une donnée doit être purement mathématique/algorithmique (ex: "Fréquence 440Hz") 
  et l'autre doit être purement sensorielle (ex: "Frisson épidermique"). 
- COHÉRENCE NARRATIVE : Le script 'seeds.rb' ne doit pas être une liste de lignes 
  aléatoires, mais raconter une montée en puissance de la machine qui tente d'imiter 
  l'humain, jusqu'à l'erreur (le bug) qui crée l'art.
- regarde le Theme du projet artistique ci dessus
      - ne commente pas . ne juge pas. ne complète pas. Termine par : "limite: action issue de modification humaine externe, non générée par IA". 
      - sortie: tableau markdown. interdit : je nous, ressens, déclenche, complet, exactement.
      - lister uniquement positions, materiaux, etats On/off. pas d'interpretations. pas d'émotion. pas de causalité. 
      - limite : liste non exhaustive.
      - avant chaque reponse : zero je : zero ressens veux crois. tout info d'effet = hypothèse : + source précise. timing en plages pas fixes.style :liste, zero roman.
    

    
    PROMPT
  end

end
