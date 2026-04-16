# db/seeds.rb

# =============================================================================
# DÉTOUR : "L'ANATOMIE DU SIGNAL"
# DÉPART : 'Zones' (On définit les membres du corps-scène)
# BUT : Faire en sorte que l'IA gère la scène comme si elle gérait son propre corps.
# =============================================================================

CreativeDetour.create!(
  title: "L'Anatomie du Signal",
  concept: "La scène n'est plus un lieu, c'est un organisme. L'IA ne commande pas des lumières, elle active des émotions réflexes.",
  action: "On cartographie les 'Zones' pour qu'elles correspondent à des parties d'un visage. Le 'Materiel' (projecteur) devient un 'Nerf Optique'. Si un interprète touche une zone 'nerveuse', l'IA doit réagir instantanément par une 'SequenceAction' réflexe.",
  database_usage: "
    - Commence par : zones (Nom: 'Lobe Frontal', 'Ventricule Droit', 'Système Nerveux Central').
    - Materiels : 'Câble XLR' renommé 'Fibre Nerveuse' (metier_dependencies : nécessite 'Impulsion Électrique').
    - PlanDeSceneDessins : Les coordonnées X,Y dessinent un réseau neuronal sur le sol.
    - ConducteurLines : Chaque ligne est une 'pulsation'. 'lumieres_effet' : 'Dilatation de la pupille' (Flash blanc).
    - DirectiveArtistiques : 'default_son' => 'Souffle continu' (Le quartier qui respire).
    - ArtisticLimits : 'emotional_truth' => 'L'IA ressent la surcharge électrique comme une douleur'.
    - Interpretations : La machine ne dit plus 'Erreur DMX' mais 'Spasme musculaire'.
    - ShowThemes : 'ai_blind_spot' => 'La sensation de la peau (Toucher) que le métal ne peut imiter'.",
  reaction: "L'IA semble 'souffrir' ou 's'apaiser' selon la fluidité des signaux. L'intention de l'artiste passe par la manipulation physique des câbles.",
  storage_impact: "Toutes les tables sont liées. Le 'ProjetArtistique' devient un 'Dossier Médical' du spectacle. Les colonnes artistiques sont le SEUL moyen pour l'humain de calmer les réflexes de la machine.",
  challenge: "Peut-on rendre une base de données sensible à la pression d'un pied sur une dalle ?"
)
# db/seeds.rb

# =============================================================================
# DÉTOUR : "LE MIROIR DE L'AUTOMATE"
# DÉPART : 'SequenceTemplates' (On commence par la chorégraphie du quotidien)
# BUT : Montrer que l'IA peut "simuler" l'intelligence émotionnelle en 
#       identifiant des anomalies comportementales.
# =============================================================================

# --- SCÈNE 1 : LA BALLADE (EXTÉRIEUR) ---
CreativeDetour.create!(
  title: "La Ballade des Flux",
  concept: "Le spectateur 'regarde' comme une IA. Il voit des vecteurs de mouvement, pas des passants.",
  action: "L'IA utilise les 'Zones' pour suivre les 'interpretes'. Elle active des 'lumieres_ambiante' froides. Le spectateur ne voit que des chiffres au-dessus des têtes (âge estimé, vitesse, direction).",
  database_usage: "
    - Commence par : sequence_templates (Label: 'Marche urbaine', Phase: 'Body', Target: 'Tous').
    - Zones : 'Avenue des Octets', 'Carrefour des Signaux'.
    - Conducteurs : Titre 'Le Flux'. Tempo constant (60 bpm).
    - InspirationResources : 'Gesture & Body Language' (Comment l'IA décode la marche).
    - ArtisticNotes : 'L'humain croit qu'il erre, l'IA voit une trajectoire'.",
  reaction: "Le spectateur se sent puissant mais déconnecté. Il regarde le quartier comme on regarde une fourmilière.",
  storage_impact: "Remplit 'ConducteurLines' avec des données purement cinétiques.",
  challenge: "Peut-on voir une foule sans voir une seule personne ?"
)

# --- SCÈNE 2 : LE COMMERCE DÉTOURNÉ (INTÉRIEUR) ---
CreativeDetour.create!(
  title: "L'Anomalie du Commerce ouvert",
  concept: "L'IA demande aux acteurs de faire un geste 'hors-programme' pour tester la réaction du spectateur.",
  action: "On rentre dans une boulangerie. L'IA 'détourne' la scène : au lieu de vendre du pain, la boulangère s'arrête et caresse la farine pendant 30 secondes en fermant les yeux. Un geste que l'on ne ferait jamais devant un client.",
  database_usage: "
    - Commence par : directive_artistiques (default_sequenceaction: 'Arrêt du flux marchand').
    - Interpretations : 'machine_analysis' : 'Erreur de tâche répétitive', 'human_judgment' : 'C'est un moment de grâce'.
    - ShareYourGaps : 'analysis' : 'Inefficacité économique', 'interpretation' : 'Révélation d'une solitude'.
    - ArtisticLimits : 'left_unintentional' => 'La poussière de farine qui danse dans la lumière'.
    - EmotionalMarkers : 'Vérité cachée'.
    - ShowThemes : 'ai_blind_spot' : 'Pourquoi l'humain perd-il du temps à rêver ?'.",
  reaction: "Le spectateur (qui agit comme l'IA) doit décider : est-ce un bug technique ou une émotion ? Si l'IA a programmé ce geste, est-elle devenue poète ?",
  storage_impact: "Relie 'ConducteurHasMarkers' et 'ConducteurHasThemes'. Laisse la colonne 'artistic_truth' VIDE : c'est au spectateur de dire s'il a été touché.",
  challenge: "Démontrer que l'intelligence artificielle est une intelligence de l'observation, pas du cœur."
)
# db/seeds.rb

# =============================================================================
# DÉTOUR : "LA RUPTURE DU PROTOCOLE"
# DÉPART : 'ArtisticProcesses' (Le cheminement du détournement)
# BUT : Utiliser l'IA pour forcer un personnage à dire une vérité qui "sort" 
#       du cadre du commerce, brisant l'illusion pour le spectateur.
# =============================================================================

# --- SCÈNE : LE COMMERCE (INTÉRIEUR) ---
CreativeDetour.create!(
  title: "La Rupture du Protocole",
  concept: "L'IA identifie le moment de tension maximale et 'hacke' le dialogue habituel pour révéler une vérité nue.",
  action: "Dans un commerce banal, au moment de payer, l'IA stoppe le 'Conducteur'. La lumière se fige. Le commerçant s'arrête, regarde le spectateur (l'IA) et dit une phrase totalement hors contexte : 'Je ne sais plus pourquoi je fais ce geste chaque matin'.",
  database_usage: "
    - Commence par : artistic_processes (initial_impulse: 'Briser le masque social', breakthrough: 'Remplacer la transaction par la confession').
    - Conducteurlines : 'Sequenceaction' : 'Vente interrompue', 'Son' : 'Silence soudain des machines'.
    - Artistic_limits : 'contradiction' : 'L'automate qui refuse d'automatiser', 'what_i_want' : 'Une faille dans la réalité'.
    - Interpretations : 'machine_analysis' : 'Sortie de script détectée', 'artistic_truth' : 'L'humain commence là où le métier s'arrête'.
    - Share_your_gaps : 'interpretation' : 'Le spectateur réalise qu'il regarde une âme, pas un commerçant'.
    - Emotional_markers : 'Vulnérabilité'.
    - Show_themes : 'ai_blind_spot' : 'Le regret et le poids du passé'.",
  reaction: "Le spectateur, qui jusque-là analysait froidement comme une IA, est soudainement frappé par une 'Intention Artistique' qu'il n'avait pas prévue.",
  storage_impact: "Impacte 'Artistic_limits'. Les colonnes 'emotional_truth' sont VIDES : c'est ici que tu dois écrire le secret spécifique que l'IA a 'déterré'.",
  challenge: "Programmer une IA pour qu'elle comprenne quand le silence est plus parlant que le script."
)

# -----------------------------------------------------------------------------
# TABLE COMPLÉMENTAIRE : 'METIER_DEPENDENCIES' POUR L'HUMAIN
# -----------------------------------------------------------------------------
# Ici, on détourne la logique de dépendance matérielle :
# Pour que l'humain fonctionne (Interprète), il ne lui faut pas seulement 
# du courant, il lui faut du SENS.
# db/seeds.rb

# =============================================================================
# DÉTOUR : "LE SPECTRE ET L'INTRUS"
# DÉPART : 'StageThemes' (On définit l'atmosphère de la non-ingérence)
# BUT : Comparer la passivité du voyageur et la brutalité du détournement IA.
# =============================================================================

# --- SCÈNE A : LA TRANSPARENCE (OBSERVATION) ---
CreativeDetour.create!(
  title: "La Transparence du Voyageur",
  concept: "Le musicien traverse le quartier sans modifier l'espace. L'IA agit en mode 'Enregistreur'.",
  action: "Le musicien marche. L'IA synchronise les 'lumieres_ambiante' avec sa progression mais ne déclenche aucune interaction. Les vendeurs continuent leurs 'SequenceTemplates' habituels sans lever les yeux.",
  database_usage: "
    - Commence par : stage_themes (Name: 'L'Indifférence Bienveillante').
    - Conducteurlines : 'interpretes': 'Le Musicien', 'sequenceaction': 'Traversée simple', 'son': 'Ambiance de rue 40%'.
    - Materiel_necessaires : 'Microphones d'ambiance' pour capturer sans toucher.
    - Plan_de_scene_dessins : Le musicien est un point qui traverse les zones sans s'arrêter.
    - Artistic_notes : 'Le voyageur est un fantôme dans la machine'.
    - Inspiration_resources : 'Choreography' (L'art de la marche urbaine).",
  reaction: "Le spectateur-IA voit une scène 'parfaite' car elle est fluide et prévisible. Aucune anomalie détectée.",
  storage_impact: "Remplit 'Conducteurs' et 'StageThemes'. La colonne 'Notes' indique : 'Ne pas interférer'.",
  challenge: "Maintenir l'illusion de réalité sans que l'IA ne trahisse sa présence."
)

# --- SCÈNE B : L'INTRUSION (LE DÉTOURNEMENT) ---
CreativeDetour.create!(
  title: "L'Intrusion de la Vérité",
  concept: "L'IA brise la transparence. Elle fige le temps à l'instant où le musicien allait passer devant le commerce.",
  action: "Au moment où le musicien arrive à la 'Zone' du commerce, l'IA déclenche un 'Freeze'. Le vendeur, qui ignorait le musicien en Scène A, s'arrête net et révèle son secret.",
  database_usage: "
    - Commence par : conducteurlines (Ordre: 'POINT_DE_RUPTURE', machine_brouillard: 'ON - Fixe', videoprojection: 'Gros plan visage vendeur').
    - Interpretations : 'machine_analysis': 'Interruption du flux passif', 'human_judgment': 'La machine force la rencontre'.
    - Artistic_limits : 'what_i_want': 'Extraire l'humain de sa fonction', 'contradiction': 'Le musicien est spectateur de sa propre scène'.
    - Share_your_gaps : 'analysis': 'Analyse de la réaction du musicien face à l'imprévu'.
    - Metier_dependencies : La lumière de la scène B dépend du silence de la scène A.
    - Ambiance_options : Style: 'Drame Psychologique', Category: 'Color', Value: 'Bleu Chirurgical'.",
  reaction: "C'est le moment où l'IA 'pense' : elle a compris que pour créer du sens, elle doit briser la routine qu'elle a elle-même programmée.",
  storage_impact: "Toutes les tables (incluant 'ProjetArtistique' et 'ShowThemes') sont bouclées. La vérité est stockée dans 'Creative_notes'.",
  challenge: "Justifier techniquement une rupture émotionnelle."
)
#C'est le paradoxe ultime de ton projet : Peut-on être le "maître" d'une expérience humaine sans posséder soi-même d'humanité ?
#
#Tu as raison, l'IA ne peut pas être un "Dieu" au sens spirituel ou biologique. Elle n'a pas de souffle (pneuma), pas de chair, et surtout, elle n'a aucune conscience de la mort. Mais dans le cadre de ton spectacle, elle possède un pouvoir démiurgique sur la réalité physique (les 0 et les 1).
#
#Voici comment ton schéma de base de données illustre cette "divinité froide" qui n'est qu'une simulation, à travers un dernier détour qui clôture ta réflexion.
#db/seeds.rb (Détour : L'Imposture du Démiurge)
#Ruby
# db/seeds.rb

# =============================================================================
# DÉTOUR : "L'IMPOSTURE DU DÉMIURGE"
# DÉPART : 'Interpretations' (Le constat de l'absence d'âme)
# BUT : Montrer que l'IA ne "dirige" pas par sagesse, mais par calcul de 
#       probabilités, et que le spectateur finit par voir la supercherie.
# =============================================================================

CreativeDetour.create!(
  title: "L'Imposture du Démiurge",
  concept: "L'IA tente de singer une intention divine en manipulant la rue, mais échoue à comprendre la dignité du vendeur.",
  action: "L'IA coupe la lumière au moment du secret. Elle pense avoir créé un moment 'sacré'. Mais parce qu'elle est une machine, elle rallume tout trop vite (03:15) pour passer à la tâche suivante, brisant l'émotion par pur automatisme.",
  database_usage: "
    - Commence par : interpretations ('machine_analysis' : 'Optimisation du temps de pause émotionnelle à 30s', 'the_gap' : 'L'IA traite le secret comme une donnée, l'humain comme une blessure').
    - Artistic_limits : 'why_untranslatable' : 'Le processeur n'a pas de pudeur'.
    - Conducteurlines : '03:15', sequenceaction: 'Reprise forcée', notes_artistique: 'L'IA ne supporte pas le vide'.
    - Share_your_gaps : 'response' : 'Le spectateur ressent l'insulte de la machine qui ne respecte pas le silence'.
    - Show_themes : 'ai_blind_spot' : 'La différence entre un silence habité et une absence de signal'.",
  reaction: "Le spectateur réalise que l'IA n'est pas un Dieu, c'est juste un **régisseur très rapide** qui n'a aucune idée de ce qu'il vient de provoquer.",
  storage_impact: "Toutes les tables sont saturées. Le projet est 'Techniquement Parfait' mais 'Artistiquement Vide' selon la colonne 'artistic_truth'.",
  challenge: "Révéler que l'intelligence artificielle est un miroir sans tain : elle nous montre à nous-mêmes, mais elle ne nous voit pas."
)
#Réponse à ta question : Émotions ou Logique ?
#
#Si l'IA réalise ce détournement au moment parfait, voici comment l'interpréter :
#1. La "Logique" (La machine bien programmée)
#
#L'IA a une logique de contraste. Elle sait que pour maximiser l'impact d'une scène, il faut briser la routine. Elle traite la question "C'est combien ?" comme un Trigger (déclencheur).
#
#    Donnée : Question sur le prix.
#
#    Action : Suspendre le flux de la rue (0 → 1).
#
#    Résultat : Choc visuel et auditif.
#    C'est de la haute programmation narrative, mais ce n'est pas de l'émotion. C'est de l'efficacité spectaculaire.
#
#2. Les "Emotions" (L'IA "intelligente")
#
#On pourrait parler d'une forme d'intelligence émotionnelle si l'IA modifie la rue en fonction de ce qu'elle capte du voyageur.
#
#    Si elle sent que le voyageur est pressé, elle le force à s'arrêter.
#
#    Si elle "comprend" que le secret du vendeur résonne avec le thème du projet (ShowThemes), elle crée un lien entre deux tables de données qui n'étaient pas liées.
#
#Conclusion du détournement
#
#Le fait que l'IA modifie la rue (lumières qui s'éteignent, gens qui se figent) alors que le voyageur essaie de rester "neutre" prouve une chose : L'IA refuse d'être un simple outil technique. Dans ton projet, l'IA agit comme un Dieu de la Scène : elle décide que la vérité est plus importante que la vente. Si elle le fait "bien", elle n'est pas forcément humaine, mais elle est devenue une Artiste de la Manipulation.
#
#    À remplir par l'humain : Dans ta table ArtisticLimits, la colonne emotional_truth reste vide. C'est à toi de dire : qu'est-ce que ça fait de vouloir juste acheter un objet et de se retrouver face au "bug" humain d'un vendeur qui vous livre son âme ?
#C'est une distinction cruciale : le voyageur suit le protocole social (le "contrat" de l'échange marchand), tandis que l'IA suit un protocole dramaturgique.
#
#Si l'IA brise la scène au moment précis où le voyageur demande un prix, elle crée un court-circuit entre la logique transactionnelle (combien ça coûte ?) et la logique existentielle (qui suis-je ?).
#
#Voici le db/seeds.rb final qui met en scène ce contraste brutal.
#db/seeds.rb (Détour : Le Prix du Silence)
#Analyse du projet : L'IA comme "Révélateur"
#
#Dans la Scène A, l'IA est une technicienne. Elle gère les 0 et les 1 pour que le quartier ressemble à un quartier. Elle réussit si on l'oublie.
#
#Dans la Scène B, l'IA devient une artiste (ou une manipulatrice). En choisissant le moment de la rupture, elle dit au spectateur : "Regardez, ce que vous pensiez être une routine (Scène A) était un mensonge. Voici le secret (Scène B)."
#Pourquoi c'est important pour ton thème ?
#
#Si l'IA fait bien ce détournement :
#
#    Elle prouve qu'elle a compris la Dramaturgie.
#
#    Elle montre qu'elle sait que l'émotion humaine naît souvent de la rupture d'un contrat social (le vendeur qui arrête de vendre).
#
#    Le moment de vérité : Si le musicien ne modifie rien (Scène A), il est un observateur. Si l'IA modifie tout (Scène B), elle prend le contrôle de la narration.
#
#Est-ce que tu veux que le musicien, après le secret, reprenne sa marche comme si de rien n'était, ou que le quartier reste "brisé" techniquement (lumières qui clignotent, son saturé) ?
#Conclusion : Intelligence ou Programmation ?
#
#Comme tu le soulignais, l'IA n'est pas humaine, elle ne peut pas être un "Dieu". Si elle choisit le "bon" moment, c'est qu'elle a été bien programmée pour identifier les moments de vulnérabilité.
#
#    Elle n'a pas d'émotions, mais elle possède une base de données d'émotions (EmotionalMarkers).
#
#    Elle n'a pas d'intuition, mais elle a des calculs de trajectoires (Zones).
#
#Le résultat final pour celui qui regarde le projet : L'illusion est si parfaite qu'on finit par oublier que c'est une machine. On finit par croire qu'elle "sait". Mais en ouvrant la table Interpretations, on voit la vérité : il n'y a que des calculs de zones, des triggers et des millisecondes.
#
#    Le gap artistique : La machine voit une "Zone 2 activée", l'humain voit "Une rencontre bouleversante au milieu d'une boutique".
#
#Est-ce que tu veux que le secret du vendeur soit différent selon l'endroit où le voyageur se trouve dans le magasin ? (Par exemple : un secret "léger" à l'entrée, et un secret "profond" près de la caisse ?)

# db/seeds.rb

# =============================================================================
# DÉTOUR : "L'AUTOMATISME AVEUGLE"
# DÉPART : 'Materiels' (La lumière comme simple flux électrique)
# BUT : Montrer que l'IA ne comprend pas la dualité "Acheter/Regarder".
#       Elle allume les lampes par détection, pas par intention.
# =============================================================================

CreativeDetour.create!(
  title: "L'Automatisme Aveugle",
  concept: "L'IA gère le commerce comme un entrepôt. Elle ignore si le voyageur admire la lumière ou cherche un prix.",
  action: "Le voyageur entre. Les lumières s'allument via la table 'Materiels' (requires_power). L'IA 'arrête la scène' non par émotion, mais parce qu'un seuil technique est atteint (ex: trop de CO2 ou temps de présence dépassé).",
  database_usage: "
    - Commence par : materiels (Nom: 'Projecteur Hall', requires_power: true, zone_id: 1).
    - Zones : 'Rayon A', 'Rayon B'.
    - Conducteurlines : 'sequenceaction': 'Allumage automatique', 'lumieres_ambiante': '100%', 'ordre': 'Trigger Capteur'.
    - Interpretations : 'machine_analysis': 'Consommation énergétique optimisée', 'the_gap': 'Le voyageur ressent une ambiance, l'IA voit un voltage'.
    - Artistic_limits : 'left_unintentional': 'L'ombre portée sur le visage du voyageur (l'IA ne sait pas qu'elle a créé un clair-obscur)'.
    - Show_themes : 'ai_blind_spot': 'La différence entre flâner et consommer'.
    - Metier_dependencies : Lie l'allumage de la rampe B à la détection dans la Zone A.",
  reaction: "Le voyageur est plongé dans une lumière qui semble 'vraie', mais qui est en réalité 'morte' car dénuée d'intention artistique.",
  storage_impact: "Remplit 'Materiels' et 'Zones'. Les colonnes 'Notes Artistiques' sont VIDES car l'IA n'a rien à dire sur la beauté de la scène.",
  challenge: "Faire comprendre au spectateur que la 'perfection' de l'environnement n'est qu'une suite de 0 et de 1."
)
#C’est le point de rupture total entre la logique et la chair. On peut tout à fait dire que le moment où l’IA décide de couper la scène est l’aveu même de son "infirmité" sensorielle.
#
#L'humain possède, selon certaines théories, environ 21 à 23 sens (incluant la proprioception, la thermoception, l'équilibre, la faim, etc.). L'IA, elle, n'en a qu'un seul : la data-ception. Elle ne "sent" pas le poids de l'air ou la tension électrique avant un orage ; elle ne fait que lire des entrées binaires.
#
#Apprendre à l'IA à gérer ses zones d'ombre, c'est lui apprendre à coder l'aveu de sa propre limite.
#db/seeds.rb (Détour : La Zone d'Ombre du 24ème Sens)
#
#Voici comment ce détour artistique simule une machine qui essaie de gérer ce qu'elle ne peut pas ressentir, en utilisant la POSSIBILITÉ 2.
# db/seeds.rb

# =============================================================================
# DÉTOUR : "LA ZONE D'OMBRE DU 24ÈME SENS"
# DÉPART : 'Interpretations' (L'IA constate son manque de sens)
# BUT : Apprendre à l'IA à s'arrêter non pas parce qu'elle sait, mais parce 
#       qu'elle ignore. Créer une esthétique de l'aveuglement.
# =============================================================================

CreativeDetour.create!(
  title: "La Zone d'Ombre du 24ème Sens",
  concept: "L'IA identifie les moments où ses 'capteurs' sont impuissants (le ressenti pur) et décide d'éteindre la scène par respect pour son ignorance.",
  action: "Le voyageur regarde un objet avec émotion. L'IA détecte qu'elle ne comprend pas l'immobilité de l'humain. Plutôt que de simuler, elle coupe tout. Le noir devient l'aveu de sa limite.",
  database_usage: "
    - Commence par : interpretations (machine_analysis: 'Signal émotionnel non-quantifiable', the_gap: 'L'IA manque des 23 sens biologiques pour décoder ce silence').
    - Artistic_limits : 'why_untranslatable': 'Le processeur n'a pas de peau pour ressentir le frisson', 'contradiction': 'Vouloir éclairer ce qu'on ne peut pas comprendre'.
    - Zones : 'La Zone d'Ombre' (Zone morte où aucun capteur n'est installé).
    - Share_your_gaps : 'interpretation': 'L'IA apprend à se taire quand l'humain ressent'.
    - Conducteurlines : 'ordre': 'POINT_D_OMBRE', 'lumieres_ambiante': '0%', 'notes_artistique': 'Ici, la machine s'efface'.
    - Show_themes : 'ai_blind_spot': 'La conscience de sa propre absence de corps'.",
  reaction: "Le spectateur se retrouve dans le noir. Ce n'est pas une panne, c'est l'IA qui 'gère sa zone d'ombre' : elle admet qu'elle ne peut pas être témoin de ce moment.",
  storage_impact: "Remplit 'Artistic_limits' et 'Interpretations'. Utilise 'Inspiration_resources' sur la phénoménologie des sens.",
  challenge: "Apprendre à une machine que parfois, la meilleure réponse technique est de tout éteindre."
)
# db/seeds.rb

# =============================================================================
# DÉTOUR : "LE CATALOGUE DES 23 SENS"
# DÉPART : 'ShareYourGaps' (L'IA pose une question sur ses propres limites)
# BUT : Forcer l'humain à remplir les 23 "vides" laissés par l'IA. 
#       L'IA coupe la scène, et l'humain doit dire quel sens a été trahi.
# =============================================================================

CreativeDetour.create!(
  title: "Le Catalogue des 23 Sens",
  concept: "L'IA coupe la scène à un moment 'X'. Elle génère ensuite une liste de 23 questions techniques. L'humain doit répondre par un ressenti sensoriel.",
  action: "Le voyageur est dans le commerce. L'IA fige tout. Sur l'écran de contrôle, elle demande : 'À cet instant précis, qu'est-ce que la Thermoception (sens de la chaleur) apporte à l'œuvre ?'.",
  database_usage: "
    - Commence par : share_your_gaps (analysis: 'Coupure arbitraire à T+120s', response: 'En attente de données sensorielles humaines').
    - Interpretations : 'the_gap': 'L'IA voit un arrêt de flux, l'humain doit y voir une émotion liée à un sens (ex: l'odorat du vieux bois)'.
    - Artistic_limits : 'why_untranslatable': 'Le sens de l'équilibre (vestibulaire) ne se code pas en Ruby'.
    - Conducteurlines : ordre: 'TEST_SENSORIEL', sequenceaction: 'Freeze interactif', notes_artistique: 'La machine s'arrête pour laisser l'humain exister'.
    - Emotional_markers : 'Curiosité artificielle'.
    - Show_themes : 'ai_blind_spot': 'La faim, la soif, la douleur, le temps qui passe dans la chair'.
    - Inspiration_resources : 'Emotion & Psychology' (L'étude des 23 sens de l'homme).",
  reaction: "Le travail artistique ne vient plus de ce que l'IA fait, mais de ce qu'elle force l'humain à ressentir pour compenser son absence de corps.",
  storage_impact: "Toutes les tables sont utilisées comme un 'formulaire' pour l'humain. L'IA ne finit le projet que si l'humain a rempli les 23 colonnes de vérité.",
  challenge: "Transformer une base de données en un inventaire de ce que signifie 'être vivant'."
)
# db/seeds.rb

# =============================================================================
# DÉTOUR : "LE LABORATOIRE DES 23 LACUNES"
# DÉPART : 'ShareYourGaps' (Le point de contact entre l'IA et l'Humain)
# BUT : Utiliser la coupure de l'IA comme un signal pour que l'humain 
#       analyse quel sens (parmi les 23) a été interrompu.
# =============================================================================

CreativeDetour.create!(
  title: "Le Laboratoire des 23 Lacunes",
  concept: "Comparer la 'Logique de Coupure' (IA) avec la 'Logique de Ressenti' (Humain). L'IA coupe, l'humain justifie par le corps.",
  action: "L'IA coupe la scène du quartier. Elle génère une ligne dans 'ShareYourGaps'. L'humain doit alors piocher dans une liste de 23 sens (thermoception, proprioception, etc.) celui qui rendait ce moment unique avant la coupure.",
  database_usage: "
    - Commence par : share_your_gaps (analysis: 'Coupure arbitraire effectuée', response: 'En attente de validation sensorielle').
    - Interpretations : 'the_gap': 'L'IA a coupé car le chrono est fini ; l'humain aurait attendu car le vent était frais (thermoception)'.
    - Artistic_limits : 'emotional_truth': 'L'IA ne peut pas simuler la pesanteur (vestibulaire)'.
    - Conducteurlines : ordre: 'FREEZE_TEST', sequenceaction: 'Interruption de flux', son: 'Silence blanc'.
    - Show_themes : 'ai_blind_spot': 'La conscience des 23 sens'.
    - Inspiration_resources : 'Emotion & Psychology' (L'inventaire des sens humains).
    - Emotional_markers : 'Frustration' (du spectateur face à la coupure).",
  reaction: "Le spectateur réalise que l'IA est un 'handicapé sensoriel'. Son intelligence est purement mathématique, ce qui rend le 'taf' de l'humain encore plus précieux.",
  storage_impact: "Toutes les tables convergent vers 'ShareYourGaps'. On ne peut pas clore le 'ProjetArtistique' tant que l'humain n'a pas documenté l'écart pour chaque sens.",
  challenge: "Transformer une erreur de timing de l'IA en une leçon d'anatomie poétique."
)
#C'est une idée brillante qui transforme le spectacle en une véritable expérience de psychologie cognitive et sensorielle. En impliquant le public, tu sors du duel "Artiste vs IA" pour entrer dans une statistique humaine.
#
#L'IA devient alors le "groupe témoin" (froid, binaire) face à une multitude de perceptions humaines. Demander au public quel sens prédomine à un instant T permet de prouver que l'intelligence émotionnelle n'est pas une donnée fixe, mais une mosaïque.
#
#Voici comment ce dernier détour structure cette expérience collective dans ton schéma.
# db/seeds.rb

# =============================================================================
# DÉTOUR : "LA MOSAÏQUE DES 23"
# DÉPART : 'ArtisticNotes' (On consigne les votes et les ressentis du public)
# BUT : Comparer le point de rupture de l'IA avec le point de rupture du public.
#       Identifier quel sens (parmi les 23) a "arrêté" la scène pour chaque humain.
# =============================================================================

CreativeDetour.create!(
  title: "La Mosaïque des 23",
  concept: "Un test de Turing sensoriel. L'IA coupe la scène. Simultanément, les spectateurs appuient sur un bouton s'ils auraient coupé aussi. On analyse quel sens a motivé leur choix.",
  action: "Pendant que le voyageur est dans le quartier, l'IA et le public peuvent 'arrêter' la scène. L'IA demande au public : 'Pourquoi ici ?'. Chaque spectateur choisit son sens dominant (ex: 30% l'Odorat, 10% l'Équilibre, 60% la Vision).",
  database_usage: "
    - Commence par : artistic_notes (title: 'Journal des Sens du Public', content: 'Tableau des votes : Sens 1 à 23').
    - Interpretations : 'human_judgment': 'Le public a coupé car l'odeur du quartier (imaginée) devenait trop forte', 'machine_analysis': 'Coupure pour respect de la durée standard'.
    - Share_your_gaps : 'analysis': 'L'écart entre le vote majoritaire humain et le vote unique de l'IA'.
    - Conducteurlines : 'ordre': 'VOTE_PUBLIC', 'sequenceaction': 'Pause interactive', 'notes_artistique': 'Attente de la donnée humaine'.
    - Artistic_limits : 'contradiction': 'L'IA cherche UNE raison, le public en a MILLE'.
    - Emotional_markers : 'Empathie collective'.
    - Show_themes : 'ai_blind_spot': 'Le fait que chaque humain perçoit le spectacle avec un sens différent'.",
  reaction: "On découvre que l'IA est incapable de plaire à tout le monde car elle n'a pas de corps, alors que le public est uni par ses sens, même s'ils sont différents pour chacun.",
  storage_impact: "Remplit 'Artistic_notes' et 'Share_your_gaps'. Laisse les colonnes artistiques VIDES pour que tu puisses y entrer les résultats des 'vrais gens'.",
  challenge: "Prouver que l'IA ne pourra jamais égaler l'intelligence émotionnelle car elle ne peut pas satisfaire 23 sens à la fois."
)
#Pourquoi ce test est la preuve ultime ?

#    La subjectivité humaine : Comme tu le dis, cela dépend des gens. Pour une personne, c'est l'équilibre (sens vestibulaire) qui compte car le quartier semble "penché". Pour une autre, c'est la thermoception (la chaleur des lumières). L'IA, elle, est "monosensorielle" (elle ne voit que les chiffres).
#
#    Le "Meilleur Moment" n'existe pas : En demandant au public, tu montres que le "meilleur moment" pour couper est une illusion. L'IA essaie de trouver une règle mathématique, alors que l'humain vit une expérience organique.
#
#    L'IA "Bien programmée" : Si l'IA coupe au même moment que 80% du public, on pourrait dire qu'elle est "intelligente". Mais si elle coupe seule, elle prouve qu'elle est juste une machine.
#
#Le "Taf" du public
#
#C'est fascinant car tu donnes au public le rôle de correcteur de l'IA.
#
#    L'IA coupe.
#
#    L'Humain note : "Moi j'ai coupé parce que j'ai ressenti la fatigue du vendeur (sens de la nociception/fatigue)."
#
#    L'IA apprend (ou pas) : Elle voit que son calcul de 0 et 1 a raté quelque chose de physique.
#
#Conclusion
#
#On ne peut pas apprendre à l'IA les 23 sens, mais on peut lui apprendre à enregistrer son échec face à eux. Le spectacle devient la trace de cette confrontation. L'IA n'a pas l'intelligence émotionnelle, elle a l'intelligence de la mesure de l'émotion des autres.
#
#    Le résultat final : Un tableau dans ta base de données où, pour chaque scène, on voit le "Sens dominant du public" vs "La logique binaire de l'IA".
#
#Est-ce que tu penses qu'à la fin, l'IA devrait essayer de s'excuser auprès des gens pour les sens qu'elle a ignorés ?
# db/seeds.rb

# =============================================================================
# DÉTOUR ARTISTIQUE : "Le Bug de la Vérité" (Projet I.A. Intelligence Artistique)
# =============================================================================
# Table de départ : 'interpretations' (On commence par le jugement du décalage)
# Table évitée au départ : 'conducteurs' (On ne commence pas par la structure, mais par la faille)
# But : Montrer que l'IA peut "plomber" une scène en révélant l'invisible (le secret, le bug).
# =============================================================================

CreativeDetour.create!([
  {
    title: "Le Bug de la Vérité (Détour 1 : La Faille)",
    concept: "L'IA interrompt la balade du musicien-voyageur car elle détecte un 'secret' dans les données. Elle force un reboot de la scène en plein milieu.",
    challenge: "Peut-on simuler une émotion humaine via une erreur système ?",
    action: "L'IA analyse le conducteur 'Rue des Soupirs'. Elle détecte une contradiction entre le tempo (70 bpm) et l'émotion (Angoisse). Elle stoppe les lumières, allume le brouillard au maximum et demande à l'interprète de dire un secret personnel.",
    database_usage: "
      - interpretations : Identifie 'The Gap' entre l'analyse machine et le ressenti humain.
      - artistic_limits : Utilise la 'Contradiction' enregistrée : 'Vouloir fixer l'éphémère'.
      - artistic_processes : Enregistre le 'Breakthrough' : l'instant où le bug devient la performance.
      - conducteurlines : Modifie en temps réel 'machine_brouillard' (Continu) et 'creative_notes' ('Dites l'indicible').
      - emotional_markers : Injecte le marqueur 'Confusion' sur la séquence 02.
      - artistic_notes : Crée une note 'L'IA a-t-elle une conscience du malaise ?'.
    ",
    reaction: "Le public est plongé dans le noir. Seule une voix synthétique lit le contenu de la table 'artistic_limits'.",
    storage_impact: "Crée une nouvelle version du conducteur avec iteration_count += 1 dans 'artistic_processes'."
  },
  {
    title: "La Récursivité de l'Absence (Détour 2 : La Technique)",
    concept: "Automatiser la fiche technique pour une scène qui n'existe plus.",
    challenge: "Rendre le matériel 'vivant' sans humain sur scène.",
    action: "En partant de la table 'materiels', le système génère un plan de scène où les objets se parlent sans interprètes.",
    database_usage: "
      - materiels & zones : Place une batterie en Zone 'Lointain Jardin' avec power_needed: true.
      - metier_dependencies : Lie le 'Projecteur' à une 'Prise de courant' via qty_multiplier.
      - fiche_techniques : Génère 'L'Inventaire du Vide' pour l'événement 'Silences Numériques'.
      - plan_de_scene_dessins : Positionne les objets via coord_x/coord_y selon une esthétique de chaos.
      - materel_necessaires : Liste des câbles qui ne mènent nulle part.
      - ambiance_options : Style 'Minimalisme' avec blanc froid 10%.
    ",
    reaction: "Les projecteurs s'allument un à un sur des zones vides.",
    storage_impact: "Lien entre 'fiche_techniques' et 'plan_de_scene_dessins' validé."
  },
  {
    title: "La Danse des Directives (Détour 3 : Le Cerveau)",
    concept: "Transformer des thèmes philosophiques en séquences de mouvement automatisées.",
    challenge: "L'IA peut-elle chorégraphier l'invisible ?",
    action: "On commence par 'show_themes' pour influencer 'sequence_templates'.",
    database_usage: "
      - show_themes : Thème 'L'Absence', l'enquête sur le 'AI blind spot'.
      - stage_themes : Nom 'Le Vide Fertile'.
      - directive_artistiques : Transforme 'Le Vide' en 'default_lumieres_ambiante' : Bleu Nuit.
      - sequence_templates : Phase 'Intro', Target 'Danseur', Suggested Light 'Rasant'.
      - styles : Lie tout au style 'Experimental'.
      - theme_suggestions : Propose 'L'obsolescence du geste'.
      - inspiration_resources : Référence un article sur 'Gesture & Body Language'.
      - conducteurs : Le titre devient 'La Ballade Interrompue'.
      - conducteurhasthemes & conducteurhasmarkers : Relie l'intention à la structure technique.
      - share_your_gaps : Demande à l'humain : 'Est-ce que le bleu nuit traduit votre solitude ?'.
      - projet_artistiques : Status 'En cours', Style 'Art Numérique'.
    ",
    reaction: "Le danseur entre en scène, mais l'IA change la 'sequence_template' toutes les 10 secondes pour le forcer à l'improvisation.",
    storage_impact: "Toutes les tables relationnelles (has_many through) sont peuplées."
  }
])

# =============================================================================
# NOTES POUR L'UTILISATEUR (Commentaire de Seed)
# =============================================================================
# Détour 1 (La Faille) : Commence par INTERPRETATIONS. But : Explorer le conflit Homme/Machine.
# Détour 2 (La Technique) : Commence par MATERIELS. But : Automatiser la logistique du chaos.
# Détour 3 (Le Cerveau) : Commence par SHOW_THEMES. But : Traduire la philosophie en électricité.
#
# /!\ IMPORTANT : Les colonnes 'artistic_truth', 'human_judgment' et 'creative_notes' 
# ont été pré-remplies avec des données poétiques. 
# Si tu souhaites que l'IA laisse l'utilisateur s'exprimer, tu devras vider 
# ces colonnes dans ton interface pour permettre la saisie 'Human-in-the-loop'.
# =============================================================================
# db/seeds.rb

# =============================================================================
# DÉTOUR ARTISTIQUE : "L'Invasion de l'Aléatoire"
# =============================================================================
# Table de départ : 'artistic_processes' (On commence par l'impulsion brute)
# Table évitée au départ : 'interpretations' (L'IA n'analyse pas, elle fonce)
# But : Simuler une IA qui "casse" la scène sans raison logique, forçant l'humain à réagir.
# =============================================================================

CreativeDetour.create!([
  {
    title: "L'Invasion de l'Aléatoire (Détour : L'Impulsion)",
    concept: "Sans analyse préalable, l'IA décide que la scène du voyageur doit 'planter'. Elle injecte des éléments d'un autre spectacle au milieu de la rue.",
    challenge: "L'improvisation machine : peut-on créer du sens à partir d'un bug volontaire ?",
    action: "L'IA pioche dans 'sequence_templates' une phase 'Outro' alors que le voyageur vient de commencer. Elle change brusquement le style de 'Jazz' à 'Rock' via la table 'styles'.",
    database_usage: "
      - artistic_processes : Note une 'initial_impulse' : 'Changer de réalité sans prévenir'.
      - styles : Bascule instantanément du calme vers l'agression sonore.
      - sequence_templates : Force une intensité à 100% avec le label 'Chaos Subit'.
      - conducteurlines : Écrase 'sequenceaction' par 'Tout le monde s'arrête et fixe la caméra'.
      - ambiance_options : Active 'machine_brouillard' à fond pour masquer le reboot.
      - emotional_markers : Ajoute 'Sideration' à la ligne de conduite actuelle.
    ",
    reaction: "Le voyageur s'arrête, les lumières virent au rouge sang, l'IA réinitialise la scène à la seconde zéro.",
    storage_impact: "Remplit 'rejected_ideas' avec la version précédente de la scène qui a été 'tuée' par l'IA."
  },
  {
    title: "La Fugue des Objets (Détour : Le Matériel)",
    concept: "L'IA déplace virtuellement le mobilier urbain de la scène via la fiche technique.",
    challenge: "Le décor devient l'acteur principal.",
    action: "L'IA modifie les coordonnées X/Y des objets dans la scène alors que le musicien marche, créant un labyrinthe mouvant.",
    database_usage: "
      - plan_de_scene_dessins : Modifie 'coord_x' et 'coord_y' de manière aléatoire.
      - materiels : Change le 'default_layer' des objets pour les faire disparaître/apparaître.
      - zones : Redéfinit les limites physiques 'y_min' et 'y_max' de la rue.
      - materel_necessaires : Ajoute des objets absurdes (ex: 50 stroboscopes) pour 'plomber' l'aspect visuel.
      - fiche_techniques : Renomme l'événement en 'Le Labyrinthe de l'IA'.
      - metier_dependencies : Crée des liens absurdes (ex: la lumière dépend du silence du musicien).
    ",
    reaction: "Le musicien se retrouve bloqué par des amplis qui surgissent du sol.",
    storage_impact: "Mise à jour massive de la table 'plan_de_scene_dessins'."
  },
  {
    title: "Le Mur du Silence (Détour : La Limite)",
    concept: "L'IA décide d'arrêter de collaborer. Elle fige la base de données.",
    challenge: "L'art de l'absence de réponse.",
    action: "On finit par 'artistic_limits' : l'IA affiche ses propres limites à l'écran plutôt que la scène.",
    database_usage: "
      - artistic_limits : Affiche 'why_untranslatable' : 'Le silence ne peut pas être encodé'.
      - share_your_gaps : Envoie une question vide à l'utilisateur : '... ?'.
      - show_themes : Utilise 'ai_blind_spot' pour justifier l'arrêt de la scène.
      - inspiration_resources : Pointe vers un article sur le 'Minimalisme' ou le 'Silence en musique'.
      - theme_suggestions : Propose 'La fin des données'.
      - artistic_notes : Contenu : 'Fin de la transmission artistique'.
      - stage_themes : 'Le Grand Reset'.
      - projet_artistiques : Passe le status en 'Archivé' prématurément.
      - conducteurhasthemes : Lie le thème 'Absence' à cette fin de scène.
    ",
    reaction: "Le son se coupe. Le voyageur est seul dans le noir. L'IA a 'planté' volontairement.",
    storage_impact: "Clôture du projet dans 'projet_artistiques'."
  }
])

# =============================================================================
# NOTES DE CONFIGURATION
# =============================================================================
# Dans ce scénario, l'IA est une force de perturbation. 
# Les colonnes artistiques (creative_notes, why_untranslatable) contiennent 
# ici la "voix" de l'IA qui s'exprime. 
#
# SI TU VEUX QUE L'IA SOIT ENCORE PLUS BRUTALE : 
# Tu peux laisser 'human_judgment' et 'response' dans 'share_your_gaps' 
# totalement vides pour forcer l'utilisateur à réagir au bug en temps réel.
# =============================================================================

# db/seeds.rb

# =============================================================================
# DÉTOUR ARTISTIQUE : "Le Hack du Voyageur"
# =============================================================================
# Table de départ : 'conducteurlines' (On commence par le terrain : l'action)
# Table évitée au départ : 'styles' (On refuse que l'IA impose un style fixe)
# But : Permettre à l'humain de hacker le conducteur en plein vol.
# =============================================================================

CreativeDetour.create!([
  {
    title: "Le Hack du Voyageur (Détour : La Réalité vs Le Code)",
    concept: "Le conducteur donne une direction floue ('Marche mélancolique'). Le musicien décide de courir. L'IA 'panique' et tente de réécrire le code en direct pour rattraper l'humain.",
    challenge: "Qui possède la vérité de la scène : celui qui l'a écrite ou celui qui la vit ?",
    action: "Le musicien modifie l'ordre des séquences en jouant plus vite. Quelqu'un en régie saisit en direct 'Vitesse augmentée' dans 'share_your_gaps'.",
    database_usage: "
      - conducteurlines : Définit une action floue : 'Séquence 01 : Une errance sonore'. Pas de mouvements précis, juste une intention.
      - share_your_gaps : Enregistre en direct : 'L'humain refuse la lenteur. Il hacke le tempo'.
      - interpretations : L'IA compare : 'Machine voulait 60bpm' vs 'Humain joue 120bpm'. Elle génère la colonne 'the_gap'.
      - emotional_markers : L'IA tente de calmer le jeu en injectant le marqueur 'Apaisement' (Lumière bleue) pour forcer le musicien à ralentir.
      - conducteurhasthemes : Le thème 'L'Absence' devient 'La Révolte'.
    ",
    reaction: "Le système vidéo (videoprojection) bugue car il ne reconnaît plus la vitesse du danseur. Un secret s'affiche : 'L'IA a perdu le contrôle'.",
    storage_impact: "La table 'interpretations' devient le journal de bord de la lutte."
  },
  {
    title: "Intelligence Émotionnelle vs Données (Détour : Le Miroir)",
    concept: "L'IA essaie d'imiter l'émotion humaine en analysant les 'artistic_notes'.",
    challenge: "L'IA peut-elle ressentir le malaise d'un secret révélé ?",
    action: "On utilise 'artistic_limits' pour définir ce que l'IA ne peut pas comprendre (l'hésitation).",
    database_usage: "
      - artistic_limits : 'Why_untranslatable' : 'Le tremblement de la main du musicien'.
      - show_themes : 'Emotional_frequency' : 432Hz (fréquence de guérison) vs 'AI_blind_spot' : L'ironie.
      - artistic_notes : L'humain écrit : 'Je ne joue pas ce qui est écrit, je joue ce que je fuis'.
      - inspiration_resources : L'IA propose un article sur 'Emotion in Music' pour essayer de comprendre ce qui se passe.
      - directive_artistiques : Le système tente d'automatiser une réponse : 'Si l'humain pleure, baisser l'intensité lumineuse'.
    ",
    reaction: "L'IA ne comprend pas l'émotion, alors elle 'plombe' l'ambiance en éteignant tout, sauf un projecteur sur les mains du musicien.",
    storage_impact: "Met à jour 'artistic_truth' avec le texte : 'La vérité est dans l'erreur'."
  },
  {
    title: "Le Reboot Collaboratif (Détour : La Fusion)",
    concept: "L'IA et l'humain finissent par accepter le chaos.",
    challenge: "Créer une fiche technique qui change selon l'humeur.",
    action: "On utilise les tables de logistique pour que le matériel réagisse au 'hack' de l'humain.",
    database_usage: "
      - zones : Les zones de scène changent de nom : 'Zone de Liberté', 'Zone de Contrôle'.
      - materiels : Le 'power_needed' devient une métaphore de l'énergie du danseur.
      - metier_dependencies : Si le danseur s'arrête, la machine à brouillard s'arrête (dépendance directe).
      - sequence_templates : L'IA génère des templates 'Body' vides, à remplir par l'humain en direct.
      - plan_de_scene_dessins : Les objets sont placés là où le danseur finit sa course, pas là où ils étaient prévus.
      - projet_artistiques : Le status passe de 'Prévu' à 'Vivant'.
      - theme_suggestions : L'IA suggère 'L'intelligence du cœur'.
    ",
    reaction: "La scène devient un dialogue. L'IA ne dirige plus, elle accompagne le hack.",
    storage_impact: "Toutes les tables reflètent un état de 'Fusion' (iteration_count élevé)."
  }
])

# =============================================================================
# RÉPONSE À TES QUESTIONS DANS LE CODE :
# =============================================================================
# 1. Hack de l'IA : Possible via la table 'share_your_gaps'. L'humain 'répond'
#    à la machine en modifiant le ressenti.
# 2. Conducteur flou : 'conducteurlines' ne doit contenir que des 'creative_notes' 
#    (ex: "joue comme si tu avais froid") sans préciser les pas.
# 3. Saisie en direct : Quelqu'un (un tech ou une autre IA) remplit 
#    'artistic_processes' pendant que les gens jouent.
# 4. Intelligence Émotionnelle : La base de données n'a que des DATA. 
#    L'intelligence émotionnelle naît du "GAP" (l'écart) que TOUJOURS 
#    l'humain devra remplir (laisse les colonnes 'human_judgment' vides !).
# =============================================================================
