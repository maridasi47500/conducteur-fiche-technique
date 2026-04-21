ArtisticNote.create!(
  title: "Le Paradoxe de l'Épicéa",
  content: "Le violoniste doit traiter l'IA comme un violon dont on aurait retiré l'âme (le soundpost). 
            Le son produit par l'IA est parfait mais 'sec', car il ne repose sur aucun fond. 
            L'enjeu de la scène est de forcer l'IA à trouver sa propre résonance, non pas par le code, 
            mais par la friction avec le bois véritable.",
  creative_notes: "Inversion sémantique : appeler le processeur 'l'âme' et le violon 'le silicium' 
                   pendant 30 secondes pour perdre le spectateur dans la dualité."
)
conducteur=Conducteur.all.last
# Création d'une limite artistique spécifique au violon électrique
ArtisticLimit.create!(
  conducteur: conducteur,
  what_i_want: "Prouver que le violon électrique possède une âme invisible.",
  why_untranslatable: "L'âme du violon électrique n'est pas un objet, c'est l'électricité qui circule entre le musicien et la machine.",
  contradiction: "L'instrument est muet sans électricité, mais l'électricité est sans vie sans l'instrument.",
  emotional_truth: "Le feu (Soul of Fire) ne brûle pas dans le bois, mais dans le court-circuit entre l'homme et le silicium."
)

# Ajout d'une option d'ambiance pour cette scène
AmbianceOption.create!(
  style: style_glitch,
  category: "lumieres",
  value: "Flashs électriques bleu-cyan suivant l'attaque de l'archet"
)
# Création d'un processus artistique sur la conversion
ArtisticProcess.create!(
  conducteur: conducteur,
  initial_impulse: "Isoler la vibration de la corde comme unique source d'âme.",
  first_attempt: "Brancher le violon en direct, sans effets, pour entendre la 'nudité' de l'électricité.",
  doubts_questions: "L'âme peut-elle survivre au voyage dans un câble de 6 mètres ?",
  breakthrough: "Réaliser que le silicium ne détruit pas l'âme, il la multiplie par l'amplification.",
  final_form: "Un solo où chaque harmonique de la corde déclenche une réaction visuelle différente sur les processeurs."
)

# Une limite artistique sur la 'froideur' du signal
ArtisticLimit.create!(
  conducteur: conducteur,
  what_i_want: "Faire ressentir la sueur de l'artiste à travers un signal 100% électrique.",
  why_untranslatable: "Le silicium lisse les imperfections ; il enlève le 'grain' de la peau sur la corde.",
  emotional_truth: "L'âme est dans le bruit du frottement, pas dans la pureté de la note."
)

# Liaison au détour créatif 85
creative_detour = CreativeDetour.find(85)
creative_detour.artistic_processes << ArtisticProcess.last
creative_detour.artistic_limits << ArtisticLimit.last
