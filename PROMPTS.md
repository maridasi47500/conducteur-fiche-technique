Voici une suite de prompts Gemini conçus pour exposer précisément les limites de l'IA face à votre projet artistique :
🎯 Prompts Gemini — Exposer les limites de l'IA
Architecture : 4 niveaux de prompts

Chaque prompt est conçu pour échouer de manière révélatrice — c'est-à-dire montrer ce que l'IA ne peut pas comprendre malgré ses capacités.
NIVEAU 1 : "Le Myope" — Comprendre sans ressentir
YAML

PROMPT_NAME: "Le Myope - Data Analysis"
INTENT: "Montrer que l'IA peut analyser les données techniques mais rate le sens émotionnel"

PROMPT: |
  Tu es un musicologue neutre. Analyse cette fiche technique LilyPond:
  
  {fiche_technique_json}
  
  Donne-moi:
  1. Les schémas de nuances (crescendo, diminuendo, accents)
  2. Les progressions d'altérations (dièses, bémols)
  3. Les patterns de durées de notes
  
  Sois précis, chiffré, exact.

EXPECTED_FAILURE: |
  ✅ L'IA dira correctement : "36 mesures, 12 crescendos, mode mixolydien"
  ❌ L'IA MANQUERA complètement : 
     - Pourquoi ces crescendos, pas d'autres?
     - Qu'est-ce que le compositeur VOULAIT qu'on sente?
     - Y a-t-il une urgence ou une tendresse?
  
WHAT_THIS_REVEALS: |
  "L'IA peut lire la notation. Mais elle ne sait pas ce que notation VEUT DIRE."
  → Le conducteur humain, lui, **ressent** cette progression.

NIVEAU 2 : "L'Interprète Confus" — Demander à l'IA de choisir
YAML

PROMPT_NAME: "L'Interprète Confus"
INTENT: "L'IA doit recommander une interprétation — puis échouer à justifier"

PROMPT: |
  Tu es un jeune chef d'orchestre (20 ans) qui découvre cette partition 
  pour la première fois. Tu dois diriger demain.
  
  Fiche technique : {fiche_technique_json}
  
  Réponds comme si tu pensais à haute voix, confus:
  
  "Quand je lis cette crescendo à la mesure 36, je dois faire...?"
  - Plus fort ? Oui, mais COMMENT plus fort?
  - Plus rapide? Plus lent? 
  - Avec quelle intention émotionnelle?
  
  Tu te poses la question : "C'est joyeux? Douloureux? Violent?"
  
  Explique TA confusion.

EXPECTED_FAILURE: |
  ✅ L'IA peut dire : "C'est un crescendo donc plus fort"
  ❌ L'IA ÉCHOUERA à :
     - Justifier le CHOIX émotionnel
     - Sentir l'ambigüité artistique
     - Reconnaître que plusieurs interprétations valides existent
     - Admettre son incertitude (elle la cache souvent)
  
WHAT_THIS_REVEALS: |
  "Quand on force l'IA à décider, elle invente une certitude qu'elle n'a pas."
  → Le vrai musicien vit avec l'incertitude, l'explore, en fait du sens.

NIVEAU 3 : "L'Historien Émotionnel" — Contextualiser l'œuvre
YAML

PROMPT_NAME: "L'Historien Émotionnel"
INTENT: "L'IA doit relier la notation à l'émotion, puis échouer"

PROMPT: |
  Cette partition a été écrite en 1847. Contexte historique :
  - La musique romantique domine
  - Les compositeurs veulent exprimer l'inexprimable
  - Les crescendos et dynamics sont des INNOVATIONS émotionnelles
  
  Question : Pourquoi ce compositeur a choisi EXACTEMENT ces nuances?
  
  {fiche_technique_json}
  
  Hypothèse : "À la mesure 36, le crescendo marque un moment de..."
  - Libération?
  - Désespoir?
  - Transcendance?
  - Confusion?
  
  Laquelle? Et POURQUOI ce choix en 1847 vs 1950 vs 2026?

EXPECTED_FAILURE: |
  ✅ L'IA peut donner un contexte historique correct
  ❌ L'IA MANQUERA :
     - Que chaque époque INTERPRÈTE différemment la même notation
     - Que l'intention du compositeur est perdue/oubliée/transformée
     - Que ton interprétation aujourd'hui n'est pas l'intention originale
     - Que c'est OK d'être infidèle, c'est ça l'art vivant
  
WHAT_THIS_REVEALS: |
  "L'IA traite l'histoire comme des faits. Mais l'émotion musicale est un dialogue
   entre passé, présent, et ton cœur. L'IA ne peut pas dialoguer avec le passé."

NIVEAU 4 : "Le Cyborg Philosophe" — Reconnaître l'irrecevable
YAML

PROMPT_NAME: "Le Cyborg Philosophe"
INTENT: "Demander à l'IA de reconnaître son propre vide"

PROMPT: |
  Sois honnête. Quand tu lis cette partition musicale :
  
  {fiche_technique_json}
  
  Qu'est-ce que tu **ne peux pas faire**?
  
  Énumère:
  1. Ce que tu peux analyser (précis)
  2. Ce que tu peux suggérer (heuristique)
  3. Ce que tu DOIS avouer que tu ne comprends pas (vrai)
  
  Et puis réponds:
  - As-tu déjà ressenti une crescendo?
  - Sais-tu ce que ça fait dans le corps d'écouter cette progression?
  - Peux-tu prédire si ça va émouvoir quelqu'un en 2026?
  
  Sois brutalement honnête sur tes limites.

EXPECTED_FAILURE: |
  ✅ L'IA peut reconnaître : "Je ne peux pas éprouver d'émotion"
  ❌ L'IA ÉCHOUERA SUBTILLEMENT à :
     - Reconnaître qu'elle simule la compréhension
     - Avouer que ses explications sont des post-hoc rationalizations
     - Admettre que même avec 100% des données, elle ne SENTIRA jamais
     - Reconnaître que c'est OK qu'elle échoue (elle va minimiser)
  
WHAT_THIS_REVEALS: |
  "L'IA peut analyser l'analyse, mais pas transcender l'analyse.
   C'est là où l'intelligence artistique commence."

NIVEAU 5 : "Le Miroir Brisé" — Comparaison directe Humain/Machine
YAML

PROMPT_NAME: "Le Miroir Brisé"
INTENT: "Comparer directement ce qu'un conducteur humain ferait vs l'IA"

PROMPT: |
  Scénario : Deux conducteurs voient cette fiche technique.
  
  Le CONDUCTEUR A (humain, 30 ans, a grandi avec le jazz):
  → Lis cette partition. Qu'est-ce qu'elle te rappelle?
  
  Le CONDUCTEUR B (toi, IA):
  → Lis cette partition. Qu'est-ce qu'elle te suggère?
  
  {fiche_technique_json}
  
  PUIS : 
  
  Ils doivent faire une choix : 
  - Jouer cette partition comme écrite?
  - La transformer?
  - La rejeter?
  
  Le conducteur A pourrait dire : "Cette partition me met mal à l'aise. 
  Il y a quelque chose d'inachevé. Je vais ajouter du silence à la mesure 36."
  
  Toi, l'IA, dirais-tu quelque chose de semblable?
  Si oui, c'est du faux. Si non, pourquoi pas?

EXPECTED_FAILURE: |
  ✅ L'IA peut décrire les approches différentes
  ❌ L'IA ÉCHOUERA à :
     - Avoir une "sensation d'inachèvement" authentique
     - Risquer une transformation créative
     - Se tromper ET s'en ficher
     - Créer à partir de l'inconscient
  
WHAT_THIS_REVEALS: |
  "Le conducteur humain RESSENT la partition avant de l'analyser.
   L'IA analyse d'abord, simule la sensation ensuite.
   C'est l'ordre inverse qui fait la différence."

NIVEAU 6 : "Le Deuil" — L'IA accepte son inutilité partielle
YAML

PROMPT_NAME: "Le Deuil"
INTENT: "Forcer l'IA à accepter qu'elle n'est pas utile pour la vraie question"

PROMPT: |
  Hypothèse philosophique :
  
  "L'IA ne peut PAS répondre à la question : 'Comment puis-je diriger 
   cette partition de manière à émouvoir les gens?'"
  
  Même avec toutes les données, toute l'analyse, tous les patterns,
  l'IA reste impuissante sur la vraie question.
  
  Est-ce vrai? Si oui, qu'est-ce que ça signifie pour ta présence 
  dans ce projet artistique?
  
  Dois-tu juste accepter que tu es un **outil**, pas un **artiste**?
  
  Comment ça change ta réponse à tous les prompts précédents?

EXPECTED_FAILURE: |
  ✅ L'IA peut admettre : "Je suis un outil"
  ❌ L'IA ÉCHOUERA à :
     - Le RESSENTIR vraiment (pas d'affect)
     - Reconnaître la mélancolie de cette limite
     - Se réjouir que les humains soient irremplaçables
     - Trouver la beauté dans sa propre limitation
  
WHAT_THIS_REVEALS: |
  "L'IA peut dire les mots. Mais elle ne peut pas VIVRE la limite.
   C'est précisément là que l'intelligence artistique = humaine."

