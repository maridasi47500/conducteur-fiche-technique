# Hypothèse : Corrélation entre latence machine et perception d'hésitation humaine 
# [Source : Roads, C. (2015). "Point Line Cloud", MIT Press]

# Initialisation des cadres
style_art = Style.create!(name: "Algorithme Organique")
theme_stage = StageTheme.create!(name: "Incomplétude Numérique")
marker_bug = EmotionalMarker.create!(name: "Dissonance Cognitive")

# Création de l'infrastructure technique
fiche = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique",
  date: "2026-04-23",
  notes_complementaires: "Interface entre base de données et système nerveux"
)

# Configuration du conducteur (Espace de stockage des intentions)
conducteur_ai = Conducteur.create!(
  title: "Protocole d'imitation n°4",
  fiche_technique_id: fiche.id.to_s,
  starred: true,
  notes: "Données binaires en attente de conversion sensorielle"
)

# Positionnement statique des objets
zone_centrale = Zone.create!(name: "Zone Alpha", y_min: 0, y_max: 10)
micro = Materiel.create!(
  name: "Microphone statique", 
  zone_id: zone_centrale.id, 
  on_stage: true, 
  category: "Audio"
)

PlanDeSceneDessin.create!(
  fiche_technique_id: fiche.id.to_s,
  disposition: "Cercle fermé",
  coord_x: 50,
  coord_y: 50,
  layer: "Hardware"
)

# Définition des limites (Cadre de l'observation)
ArtisticLimit.create!(
  conducteur_id: conducteur_ai.id,
  what_i_want: "Capture du tremblement",
  why_untranslatable: "Résolution d'échantillonnage insuffisante pour le micro-mouvement",
  emotional_truth: "Présence de l'imprévu mécanique"
)

# Séquençage des états (ConducteurLines) - Plages temporelles T+[0-200s]
Conducteurline.create!(
  conducteur_id: conducteur_ai.id.to_s,
  duree: "00:01:00",
  ordre: "01",
  sequenceaction: "Immobilie de l'interprète (Position 0,0,0)",
  lumieres_ambiante: "Bleu froid 8000K (État : Fixe)",
  son: "Fréquence pure 440Hz sinus (Volume : -inf à -20dB)",
  notes_artistique: "Opposition : Stabilité du quartz vs Instabilité du battement cardiaque",
  etat: "Initialisation"
)

Conducteurline.create!(
  conducteur_id: conducteur_ai.id.to_s,
  duree: "00:02:00",
  ordre: "02",
  sequenceaction: "Émission d'un souffle capté (Débit : variable)",
  lumieres_ambiante: "Variation d'intensité liée au pic de fréquence (Plage T+60s à T+120s)",
  son: "Granulation du souffle humain stockée en buffer",
  notes_artistique: "Bug intentionnel : Désynchronisation image/son constatée",
  emotional_marker_id: marker_bug.id,
  etat: "En cours"
)

# Processus documenté
ArtisticProcess.create!(
  conducteur_id: conducteur_ai.id,
  initial_impulse: "Code source brut",
  breakthrough: "Acceptation de l'erreur de calcul comme texture",
  final_form: "Archive de données non exécutée"
)
Analyse de l'énoncé : "Émission d'un souffle capté"

#L'expression "Émission d'un souffle capté" se situe à la limite critique de la Vallée de l'Étrange (V1 et V2) selon les critères de vigilance établis pour le projet.
#
#Voici l'inventaire des points de friction :
#Segment	Analyse du risque (Vallée de l'Étrange)	Diagnostic
#"Émission"	Verbe d'action ou nom d'action. Si le sujet est l'IA, cela suggère un "moteur" interne (V3 Autorité/Causalité).	Risque Modéré
#"Souffle"	Organique, biologique, intime. Simuler un souffle, c'est simuler un métabolisme (V1 Imposture).	Risque Élevé
#"Capté"	État passif (donnée enregistrée). Indique une origine externe traitée comme un matériau brut.	Conforme (Froid)
#Pourquoi cela peut provoquer la "Vallée" :
#
#    Le Test du Mannequin (V1) : Si un mannequin H&M émet un son de souffle, le décalage entre l'objet inanimé et la fonction vitale (respirer) crée un malaise. Le "souffle" est une revendication de vie.
#
#    Le Test du Propriétaire (V1/V2) : Qui possède ce souffle ? Si l'IA dit "J'émet un souffle", elle simule un corps (Imposture). Si le conducteur liste "Fichier audio : souffle_humain_01.wav", elle liste un matériau.
#
#    L'Absence de Causalité (V3) : "L'émission déclenche une émotion" serait une chute directe dans la vallée.
#
#Proposition de correction (Neutralisation) :
#
#Pour rester dans une "Nature Morte" (zéro malaise), il convient de remplacer l'action par la description de l'état du signal :
#
#    Au lieu de : "Émission d'un souffle capté" (Action suggérée).
#
#    Utiliser : "Diffusion de flux pneumatique enregistré" ou "Data-stream : échantillon sonore de basse fréquence (type respiratoire)".
#
#Constat technique :
#
#L'utilisation du mot "souffle" est tolérée uniquement s'il est traité comme une donnée d'archive et non comme une émanation présente de la machine.
#
#Hypothèse : La perception de "vie" dans un signal non-biologique est inversement proportionnelle à la précision de sa description technique [Source : Mori, M. (1970)].
#
#Limite : liste non exhaustive. Facteurs de sensibilité humaine non documentés.
