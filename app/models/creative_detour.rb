class CreativeDetour < ApplicationRecord
  # --- RELATIONS HABTM COMPLETES ---

  # Coeur Artistique
  def clone_with_relations
    clone = self.dup  # duplique les attributs sauf l’ID

    clone.save!       # on sauvegarde AVANT d’ajouter les relations

    # Dupliquer toutes les relations HABTM
    self.class.reflect_on_all_associations(:has_and_belongs_to_many).each do |assoc|
      clone.send(assoc.name) << self.send(assoc.name)
    end

    clone
  end
  def clone_without_relations
    clone = self.dup  # duplique les attributs sauf l’ID

    clone.save!       # on sauvegarde AVANT d’ajouter les relations


    clone
  end
  has_and_belongs_to_many :directive_artistiques

  has_and_belongs_to_many :artistic_notes
  has_and_belongs_to_many :artistic_processes
  has_and_belongs_to_many :artistic_limits
  has_and_belongs_to_many :stage_themes
  has_and_belongs_to_many :ambiance_options
  has_and_belongs_to_many :styles
  has_and_belongs_to_many :sequence_templates

  has_and_belongs_to_many :inspiration_resources
  has_and_belongs_to_many :emotional_markers
  has_and_belongs_to_many :theme_suggestions
  # Technique et Logistique
  has_and_belongs_to_many :conducteurs
  has_and_belongs_to_many :fiche_techniques
  has_and_belongs_to_many :materiels
  has_and_belongs_to_many :zones
  has_and_belongs_to_many :plan_de_scene_dessins
  # Analyse et Réflexion
  has_and_belongs_to_many :interpretations
  has_and_belongs_to_many :share_your_gaps
  # --- Validations (Optionnel mais recommandé) ---
  validates :title, presence: true
  validates :concept, presence: true
  def self.hellothere
    schema_path = Rails.root.join('db', 'schema.rb')
    schema_content = File.read(schema_path) if File.exist?(schema_path)
    <<~PROMPT
      serait il possible de creer les habtm rrelations dans le model des tables qu'on peut creer avec un creative detour (toutes sauf creative detour)
      et les migrations  "rails g migration"

      VOICI LE SCHEMA DE MA BASE DE DONNÉES :
      #{schema_content}
    PROMPT
  end

  def self.generate_ai_prompt_detour
    # On récupère le contenu du schéma Rails
    schema_path = Rails.root.join('db', 'schema.rb')
    schema_content = File.read(schema_path) if File.exist?(schema_path)

    <<~PROMPT
      CONTEXTE : Projet "I.A. Intelligence Artistique"
      DÉTOUR CRÉATIF : 
      CONCEPT : 
      DÉFI : 

      VOICI LE SCHEMA DE MA BASE DE DONNÉES :
      #{schema_content}

      VOICI A QUOI SERVENT LES TABLES DE MA BASE DE DONNÉES ET EXEMPLE DE COMMENT LES REMPLIR:
      Materiels

Ces attributs servent à définir le positionnement spatial et technique d'un objet (par exemple, la batterie) au sein d'un environnement virtuel ou d'un plan de scène
ambiance options
Pour expliquer comment remplir ces options d'ambiance de manière claire (que ce soit pour un utilisateur final ou un technicien), il est préférable de structurer l'explication par Style Musical. exemple jazz lumieres blanc chaud ou rock machine_brouillard oui - continu.Zones

Dans le contexte d'une scène ou d'un espace de performance, les Zones servent à diviser l'espace physique en segments logiques. Cela permet au système (ou aux techniciens) de savoir précisément où se trouvent les éléments et de leur appliquer des réglages spécifiques selon leur position. Styles exemple : style : jazz, ou rock.Emotional markers

la table Emotional Markers sert de "méta-données émotionnelles". Contrairement aux données techniques (comme le choix d'un projecteur ou d'une machine à fumée), elle permet de définir l'intention artistique ou le ressenti d'un moment précis du spectacle. Metier dependencies

Le concept de Metier Dependencies (ou "dépendances métier") dans un logiciel de gestion technique ou de logistique événementielle sert à automatiser la planification en créant des liens logiques entre différents éléments de matériel.Sequence templates

voila comment les musiciens /acteur, chanteurs, danseur peuvent rentrer , ont un jeu/mouvement et sortent de la scène

Les Sequence Templates (ou modèles de séquences) servent à créer des scénarios prédéfinis de mise en scène. Ils permettent de standardiser et d'automatiser l'ambiance visuelle et technique en fonction des moments forts d'un spectacle ou d'un événement. exemple label : entrée phase intro target talent danseur suggested light stroboscope intensity 50%. Phase doit etre 1 fois intro, 1 fois outro, 1 fois body pour 1 target talent. Un target talent peut etre Tous Danseur/se Musicien/ne Acteur/ce Chanteur/se, light peut petre stroboscope , rasant, parled douche, etc. Directive artistiques

La Directive Artistique (modélisée ici par ta table DirectivesArtistiques) est le "cerveau" créatif de ton application. Elle sert à transformer un concept abstrait (ex: "Ombres décalées") en une configuration technique concrète et automatisée.Share your gaps

⚙️ vs 🎨 — Voir l'écart Que dit la machine ? Qu'en pensez-vous ? êtes vous d'accord ? est-ce que la machine a râté ? Choisissez un conducteur : Ce que vous en pensez vraiment : qu'est-ce que le conducteur vous fait ressentir? Inspiration resources exemple. UN projet artistique a un conducteur et une fiche technique. Une fiche technique a des plan de scenes dessin (ou sont les trucs sur la scenes) et materiel necessaire (de quoi j'ai besoin sur scene). Un conducteur a des conducteurlines avec colonne creatives et techniques.Show themes

Projet artistique Le nom du thème (ex: L'Absence) L'enquête : qu'est-ce qu'on cherche ? La "vibration" humaine recherchée pourquoi l'IA ne peut pas comprendre ce thème ? Editing artistic limit
Conducteur
ce que je veux
Capturer l'instant où l'idée naît
pourquoi ça ne peut pas devenir technique
Le processeur est trop rapide pour l'hésitation humaine
Contradiction
Vouloir fixer l'éphémère dans une base de données SQLite
vérité émotionnelle
La beauté réside dans le bug
pourquoi tu ne l'as pas résolu?Artistic processes

Idea 2: "The Unfinished" — Capture Your Creative Uncertainty The concept: Instead of a finished "conductor," create a space for work-in-progress, doubt, contradiction, and transformation. The database captures: What you start with (raw feeling/inspiration) What you question (where you get stuck) What you reject (conductor variations you tried but didn't work) What you finally choose (and why) UI: "Artist's Sketchbook" Code ┌─────────────────────────────────────────┐ │ 📖 MON PROCESSUS CRÉATIF │ ├─────────────────────────────────────────┤ │ │ │ 1️⃣ IMPULSION INITIALE (Jour 1) │ │ "J'ai entendu une vague. Pas claire." │ │ │ │ 2️⃣ PREMIÈRE TENTATIVE │ │ Tempo: 70-90 bpm │ │ Lumière: Bleu froid │ │ [❌ Felt wrong] │ │ │ │ 3️⃣ DOUTES │ │ "Est-ce trop rapide?" │ │ "La couleur n'est pas juste" │ │ "Qu'est-ce qui manque?" │ │ │ │ 4️⃣ IDÉES REJETÉES │ │ ❌ "Ajouter du brouillard" → Non │ │ ❌ "Faire plus loud" → Non │ │ ❌ "Changer de tonalité" → Non │ │ │ │ 5️⃣ PERCÉE (Jour 4) │ │ "Ah! C'est pas une vague ACTIVE. │ │ C'est une vague qui s'essouffle!" │ │ │ │ 6️⃣ FORME FINALE │ │ [Shows final conducteur] │ │ │ │ 📊 TRANSFORMATIONS: 5 versions │ │ │ Idea 1: "The Interpreter's Doubt" — Human Judgment vs AI Suggestion The concept: Create a system where: The machine generates a conducteur (using your seeds) The machine analyzes what it created using Gemini You (the human) judge if the machine understands its own creation The gap becomes visible — and that gap IS the artwork What it captures: AI says: "This crescendo is intense because dynamics increase" You say: "But it's NOT intense—it's constrained intensity. That's the point." The artwork: The moment where human intuition contradicts machine logic UI: Code ┌──────────────────────────────────────────┐ │ CONDUCTEUR: "Les Vagues" │ ├──────────────────────────────────────────┤ │ │ │ ⚙️ LA MACHINE DIT: │ │ "Tempo 60-80 bpm, mouvement fluide" │ │ │ │ 🎨 VOUS PENSEZ: │ │ [Textarea: Votre jugement authentique] │ │ │ │ 📊 L'ÉCART: │ │ [Auto-generated comparison] │ │ │ │ ✓ VÉRITÉ ARTISTIQUE: │ │ [Your final interpretation] │ │ │ └──────────────────────────────────────────┘ 
Exemple table inspiration resources db/seed :
Title:  titre article

Url: url d'un article sur le web

Category: options: Music History   # Conducting & Direction
    "Conducting Technique",
    "Gesture & Body Language",
    
    # Music & Sound
    "Music Theory",
    "Music History",
    "Emotion in Music",
    "Rhythm & Tempo",
    
    # Performance & Choreography
    "Dance & Movement",
    "Choreography",
    "Performance Art",
    
    # Staging & Technical
    "Stage Lighting",
    "Stage Design",
    "Sound Engineering",
    "Projection & Video",
    
    # Visual & Aesthetic
    "Visual Design",
    "Color & Composition",
    "Photography & Cinematography",
    
    # Emotional & Philosophical
    "Storytelling",
    "Emotion & Psychology",
    "Audience Engagement"


      VOICI LE THEME DU PROJET artistique :
      Your initial question positions this as a critical artistic inquiry: "I.A. Intelligence Artistique — What could be hidden behind this theme? In the era of total digitalization, can we interrogate the place of the human facing the machine? To think, create meaning, make people feel, evoke emotions — what place is there for artistic intelligence?"


      MISSION :
      1. Analyse le schéma ci-dessus.
      2. Regarde le thème du projet artistique ci-dessus.
      3. Regarde à quoi servent les tables de ma base de donées  ci-dessus pour les tables que tu ne peux pas deviner et les exemples de comment les remplir.
      4. prends un détour artistique ou creatif en Choisissant dans les tables les plus pertinentes (parmi conducteurlines, interpretations, artistic_limits, stage_themes, toutes les autres tables, etc.) 
      5. ne commence pas par la même table pour faire des detours artistiques différents
      6. en commençant par créer un enregistrement ou piocher au hasard un enregistrement dans une table différente et pour que le  détour artistique entier soit un peu différent
      7. simule l'action d'un projet artistique (un conducteur et une fiche technique final liés entre eux) qui utilise toutes les tables sauf la table creative_detours

      8. crée un db/seed  dans la table creative_detour de ce détour artistique
      9. dans le commentaire du db/seed laisse moi savoir quel detour artistique tu prends en fonction de la table que tu commences par remplir ou tu commences par piocher, quel est le but du detour artistique
      10. dans le commentaire du db/seed laisse moi savoir par quel table tu ne commences pas et par quelle table tu commences, comment s'appelle ce détour, pourquoi et quel est le but du détour

      POSSIBILITE 1:
      - remplis plusieurs 'creative_detours' pour au total de tous les creative detour avoir utilisé au moins 1 fois toutes les autres tables dans la colonne database usage et/ou action et/ou storage_impact
      - tu peux couvrir le minimum de tables jusqu'au maximum de tables dans chaque creative detour, tu peux creer beaucoup de creative detours pour couvrir toutes les tables ou un peu seulement pour couvrir toutes les tables
      - essaye d'utiliser le plus de tables
      POSSIBILITE 2:
      - remplis plusieurs 'creative_detours' pour au total de tous les creative detour avoir utilisé au moins 1 fois toutes les autres tables dans la colonne database usage et/ou action et/ou storage_impact
      - tu peux couvrir le maximum de tables dans chaque creative detour, tu peux creer beaucoup de creative detours pour couvrir toutes les tables et utilser 1 ou plusieurs toutes les autres tables
      - utilise toutes les tables
      - créer plusieurs creative detours sans commencer aucune fois par la meme table
      CONSIGNE STRICTE : 
      - remplis uniquement la table 'creative_detours'
      - utilise toutes les tables sauf 'creative_detours' pour ce détour (dans database usage) (pour éviter les boucles).
      - regarde POSSIBILITE 1 et POSSIBILITE 2 et choisis au hasard entre les 2 possibilités pour faire ce quelle a dit
      - Utilise des données poétiques, pas seulement techniques.
      - rentre les données poétiques dans les colonnes artistiques et les données technique dans les colonnes techniques des tables.
      - laisse vide ou ne laisse pas vide les colonnes artistiques et laisse moi savoir si je dois les remplir quand l'IA les laisse vides
      - utilise toutes les autres tables que creative detour
      - peux tu ecrire un db/seeds en ruby
      - si tu veux dis moi en quoi cette facon de creer ou detour artistique me fait bouger dans la base de données autrement ou a quel endroit je peux commencer à chercher pour remplir la premiere table etc
      - à la place d'écrire un exemple de colonne de table, remplis la colonne de toutes les table une phrase pour me dire ce que je dois remplir dans cette colonne, ne me dis pas un exemple c'est juste pour savoir l'ordre (sans quel ordre je remplis les tables) pour voir si ça m'inspire mieux ou si tu donnes des exemples, faciles comme bonjour, emotions hyper simple, musique hyper simple, titre hyper simple et hyper facile etc.
    PROMPT
  end
  def generate_ai_prompt
    # On récupère le contenu du schéma Rails
    schema_path = Rails.root.join('db', 'schema.rb')
    schema_content = File.read(schema_path) if File.exist?(schema_path)

    <<~PROMPT
      CONTEXTE : Projet "I.A. Intelligence Artistique"
      DÉTOUR CRÉATIF : #{self.title}
      CONCEPT : #{self.concept}
      DÉFI : #{self.challenge}

      VOICI LE SCHEMA DE MA BASE DE DONNÉES :
      #{schema_content}
      DATABASE USAGE :
      "#{self.database_usage}".

      MISSION :
      1. Analyse le schéma ci-dessus.
      2. Choisis les tables les plus pertinentes (parmi conducteurlines, interpretations, artistic_limits, stage_themes, etc.) pour simuler l'action suivante : "#{self.action}".
      3. Génère un script Ruby 'seeds.rb' complet qui crée une performance cohérente.
      4. Adopte une approche de 'Design Fiction' : les données doivent refléter la tension entre le froid algorithmique et l'émotion organique. Par exemple, une Conducteurline peut opposer un éclairage 'froid néon' (machine) à une action de 'souffle humain' (organique).
      5. Pour chaque enregistrement, utilise les colonnes appropriées du schéma pour documenter l'usage de la base : regarde DATABASE USAGE pour savoir comment.
      6. Assure-toi que la "Reaction" attendue est palpable dans les données : "#{self.reaction}".
      7. - VÉRIFICATION DES OBJETS : Ne traite jamais un objet ActiveRecord comme un Hash. Utilise toujours objet.attribute.
      8. INTÉGRITÉ RÉFÉRENTIELLE : Avant de créer une Conducteurline, assure-toi que conducteur.id est généré et assigné. Si tu crées un ArtisticLimit, associe-le obligatoirement à l'ID du conducteur créé précédemment.
      
      
      VOICI LES 23 SENS POUR LA SCENE:
      Pour chaque ligne du conducteur, choisis un sens 'mécanique' (ex: Photoréception) et un sens 'profondément humain' (ex: Neuroception/Empathie). Explique en commentaire Ruby si l'IA peut réellement simuler ce sens ou si elle ne fait qu'imiter une donnée sans la ressentir. VOICI LA LISTE DES SENS:
        1. Conducting & Direction
      
          Proprioception
      
          Kinesthésie
          Chronoception
      2. Music & Sound
      
          Audition (Ouïe)
          Chronoception
          Mécanoception (Tactile)
          Interoception
      3. Performance & Choreography
          Système Vestibulaire (Équilibrioception)
          Proprioception & Kinesthésie
          Nociception
          Thermoception
      4. Staging & Technical
          Photoréception (Vision)
          Équilibrioception 
          Stéréognosie 
          Thermoception 
      5. Visual & Aesthetic
      
          Vision (Cône/Couleur) 
          Vision (Bâtonnets/Contraste) 
          Perception de la profondeur (Stéréopsie) 
      
          Interoception
          Neuroception
          Sens de l'agence (Agency) 
          
      VOICI LE DEBUT DU Class Materiel:
        class Materiel < ApplicationRecord
          # Exemple de validations cohérentes avec votre schéma
          validates :name, presence: true
          validates :maximum, numericality: { only_integer: true, greater_than: 0 }

      VOICI LE DEBUT DU Class AmbianceOption:
        class AmbianceOption < ApplicationRecord
          belongs_to :style
          validates :category, inclusion: { in: %w(lumieres machine_brouillard musique) }

      DEBUT DU Class CreativeDetour:
        class CreativeDetour < ApplicationRecord
        # --- RELATIONS HABTM COMPLETES ---
      
        # Coeur Artistique
        has_and_belongs_to_many :artistic_notes
        has_and_belongs_to_many :artistic_processes
        has_and_belongs_to_many :artistic_limits
        has_and_belongs_to_many :stage_themes
        has_and_belongs_to_many :styles
        has_and_belongs_to_many :inspiration_resources
        has_and_belongs_to_many :emotional_markers
        # Technique et Logistique
        has_and_belongs_to_many :conducteurs
        has_and_belongs_to_many :fiche_techniques 
        has_and_belongs_to_many :materiels
        has_and_belongs_to_many :zones
        has_and_belongs_to_many :plan_de_scene_dessins
        # Analyse et Réflexion
        has_and_belongs_to_many :interpretations
        has_and_belongs_to_many :share_your_gaps
      VOICI la Class plan de scene dessin:
class PlanDeSceneDessin < ApplicationRecord
belongs_to :fiche_technique
end
voici la class inspiration resources : 
class InspirationResource < ApplicationRecord
  validates :title, :url, :category, presence: true
  
  CATEGORIES = [
    # Conducting & Direction
    "Conducting Technique",
    "Gesture & Body Language",
    
    # Music & Sound
    "Music Theory",
    "Music History",
    "Emotion in Music",
    "Rhythm & Tempo",
    # Performance & Choreography
    "Dance & Movement",
    "Choreography",
    "Performance Art",
    # Staging & Technical
    "Stage Lighting",
    "Stage Design",
    "Sound Engineering",
    "Projection & Video",
    # Visual & Aesthetic
    "Visual Design",
    "Color & Composition",
    "Photography & Cinematography",
    
    # Emotional & Philosophical
    "Storytelling",
    "Emotion & Psychology",
    "Audience Engagement"
  ]
    validates :category, inclusion: { in: CATEGORIES }

  def listcategories
    CATEGORIES
  end
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


      CODE RUBY POUR GENERER DES CONDUCTEURS AVEC LES SEQUENCE TEMPLATES ENREGISTRES:
       mystyle=style=Style.find(params[:style_id])
    fiche=FicheTechnique.create(name_event: "Projet "+mystyle.name, date: Date.today, eleve_responsable: "eleve "+mystyle.name, professeur_referent: "professeur "+mystyle.name, notes_complementaires: "yeah")
    projet=ProjetArtistique.create(title: "Projet "+mystyle.name)
    conducteur = Conducteur.create!(fiche_technique: fiche, title: "Conducteur "+projet.title)
    projet.update(conducteur: conducteur)
    params[:marker_ids].each do |metier| 
      # 1. On pioche UNE intro au hasard parmi les intros possibles
      intro = SequenceTemplate.where(style: style, phase: "intro",target_talent: metier).sample
      
      # 2. On pioche DEUX moments de "corps" (body) au hasard
      milieux = SequenceTemplate.where(style: style, phase: "body",target_talent: metier).sample(2)
      
      # 3. On pioche UNE sortie
      outro = SequenceTemplate.where(style: style, phase: "outro",target_talent: metier).sample

      # 4. On assemble le tout dans un tableau ordonné
      mon_scenario = [intro] + milieux + [outro]

      # 5. On crée les lignes du conducteur dans l'ordre du tableau
      next if mon_scenario.length == 0
      mon_scenario.each_with_index do |temp, index|
        next if temp.nil? # Sécurité si une phase est vide
        
        Conducteurline.create!(
          conducteur: conducteur,
          ordre: index + 1,
          sequenceaction: temp.label,
          interpretes: metier,
          lumieres_ambiante: style.ambiance_options.where(category: "lumieres").sample&.value || "blanc",
          machine_brouillard: style.ambiance_options.where(category: "machine_brouillard").sample&.value || "non",
          duree: "00:02:00"
        )
      end
    end


      CONSIGNE STRICTE : 
      - regarde le début du Class Ambiance options
      - regarde le début du Class Materiel
      - regarde le theme du projet artistique et peux tu ecrire/modifier ce que tu crée dans les tables par rapport à ce thème
      - remplis les tables en français French
      - Ne remplis PAS la table 'creative_detours' (pour éviter les boucles).
      - Utilise des données poétiques, pas seulement techniques.
      - utilise toutes les table sauf la table creative_detours
      - Dans les colonnes de texte (notes, descriptions), utilise un vocabulaire qui oppose le code et l'âme.
      - regarde les 23 sens pour la scene, écris si tu penses qu'un des 23 sens est plus utilisé pour une ligne du conducteur ou si l'IA ne peut pas le dire et pourquoi

      - regarde le début du Class CreativeDetour et ajouter des lignes de code pour ajouter chaque creation dans une table en lien avec ce creativeDetour (l'id de ce creative Detour est : #{self.id}) avec une relation Habtm à la fin du code (fais un truc comme creative_detour = CreativeDetour.find(#{self.id}) \ncreative_detour.interpretations << moninterpretation pour chaque table comme pour active record et ruby) (normalement si l'IA a utilisé toutes les tables a la fin du script il y a 17 associations liée avec la table creative_detours) (il y a creative_detour.interpretations << moninterpretation avec 17 tables (ou 17 fois) liées à creative_detours)
      - Voici la liste des tables qui doivent être liées à la table Creative Detour via une relation de type has_and_belongs_to_many : directive_artistiques, artistic_notes, artistic_processes, artistic_limits, stage_themes, ambiance_options, styles, sequence_templates, inspiration_resources, emotional_markers, theme_suggestions, conducteurs, fiche_techniques, materiels, zones, plan_de_scene_dessins et interpretations pour la partie analyse.
      - utiliser autant que possible de conducteurlines (le model s'appelle Conducteurline) jusqu'a atteindre la durée de 20 ("00:20:00")  minutes de conducteur
      - regarde le code ruby pour generer les lignes de conducteurs avec les sequences templates enregistres
      - si tu dois utiliser la table sequence templates ou si tu remplis la table sequence templates, ajoute des lignes au conducteur en utilisant le code ruby pour generer les lignes de conducteurs avec les sequences templates enregistres
      - peux tu eviter l'erreur (irb):1:in `<main>': undefined method `name' for an instance of Hash (NoMethodError) 
      - peux tu eviter l'erreur (irb):1:in `<main>': La validation a échoué : Conducteur doit exister (ActiveRecord::RecordInvalid)
      - regarde la partie DATABASE USAGE et peux tu vraiment essayer d'arranger le contenu des colonnes/lignes enregistrées  comme dans DATABASE USAGE
      - regarde la class Artisticprocess, inspiration ressources, plan_de_scene_dessin et artisticLimit pour eviter des erreurs
     - INSPIRATION THÉMATIQUE : Le projet questionne "l'intelligence artistique" face au digital. 
  Pour chaque table remplie (StageThemes, ArtisticProcesses, etc.), crée un contraste : 
  une donnée doit être purement mathématique/algorithmique (ex: "Fréquence 440Hz") 
  et l'autre doit être purement sensorielle (ex: "Frisson épidermique"). 
- PHILOSOPHIE DES SENS : Si tu choisis la "Chronoception", précise si c'est le temps 
  métronomique de la machine (00:01:00) ou le temps ressenti par l'artiste (l'attente).
- COHÉRENCE NARRATIVE : Le script 'seeds.rb' ne doit pas être une liste de lignes 
  aléatoires, mais raconter une montée en puissance de la machine qui tente d'imiter 
  l'humain, jusqu'à l'erreur (le bug) qui crée l'art.
- regarde le Theme du projet artistique ci dessus
- si possible pour répondre aux question qu'on peut se poser apres création du projet,  peut tu prendre le temps de remplir les lignes artistic process, artistic limit, et artistic notes, pour pouvoir répondre les idées par rapport au Theme du projet artistique ci-dessus plusieurs pour chaque table si possible (en resume pour ARTISTIC NOTES, PROCESSES & LIMITS (Le coeur du thème) peut tu ajouter plus d'idees pour en lien avec le theme artistique du projet ci-dessus?)
    
    PROMPT
  end
end
      #- Si une table semble inutile pour ce détour, ignore-la.
