# db/seeds.rb

puts "--- Début de la germination artistique : Le Fragment Fantôme ---"

# 1. Créer une [artistic_notes] comme graine du projet.
seed_note = ArtisticNote.create!(
  title: "Le dernier reflet",
  content: "Une lueur qui refuse de s'éteindre quand on débranche la prise."
)

# 2. Définir le cadre thématique et philosophique [show_themes]
style_ambient = Style.create!(name: "Ambient Sculptural")

# On crée une Zone spécifique pour le reflet
zone_fond = Zone.create!(name: "Fond de scène (L'Ailleurs)", y_min: 0, y_max: 50)

theme = ShowTheme.create!(
  title: "L'Électricité de l'Absence",
  philosophical_inquiry: "L'IA peut-elle rêver de courants résiduels ?",
  emotional_frequency: "Basse, continue, presque imperceptible (Mélancolie 440Hz)",
  ai_blind_spot: "L'oubli : la capacité à laisser une donnée s'effacer lentement sans la supprimer."
)

# 3. Établir les limites de la traduction machine [artistic_limits]
# Ce sont les points de friction entre l'émotion et le SQL
ArtisticLimit.create!(
  what_i_want: "Capturer la persistance rétinienne du spectateur.",
  why_untranslatable: "Le capteur numérique s'arrête à 0 ou 1, il n'a pas de mémoire organique.",
  contradiction: "Vouloir mesurer le temps d'un souvenir avec une horloge système.",
  emotional_truth: "La mélancolie est un signal analogique qui ne finit jamais vraiment.",
  left_unintentional: "Le léger sifflement des condensateurs dans le silence."
)

# 4. Définir les Directives Artistiques pour automatiser le ressenti
stage_theme_obs = StageTheme.create!(name: "Obscurité Rémanente")

directive = DirectiveArtistique.create!(
  name: "Halo de Persistance",
  stage_theme: stage_theme_obs,
  default_lumieres_effet: "Extinction lente (60s) jusqu'à la limite du noir",
  default_son: "Echo de piano inversé, comme une note qui revient vers son origine",
  default_notes_technicien: "Maintenir la tension électrique au minimum vital sans couper le flux."
)

# 5. La Fiche Technique : Le corps physique de l'idée
fiche = FicheTechnique.create!(
  name_event: "La Nuit des Processeurs",
  eleve_responsable: "Le Veilleur de Nuit",
  date: "13/04/2026",
  notes_complementaires: "La salle doit être totalement isolée de la lumière extérieure pour que l'œil perçoive le vide."
)

miroir = Materiel.create!(
  name: "Miroir motorisé",
  zone: zone_fond,
  category: "Optique",
  on_stage: true
)

projecteur = Materiel.create!(
  name: "Projecteur asservi ultra-précis",
  category: "Lumière",
  power_needed: true
)

# Dépendance métier poétique
MetierDependency.create!(
  materiel: miroir,
  required_item_id: projecteur.id,
  note: "Le projecteur doit viser l'invisible (le miroir) pour créer le reflet fantôme."
)

MaterielNecessaire.create!(
  fiche_technique_id: fiche.id,
  materiel_id: miroir.id,
  quantite: "1",
  precisions_observations: "Doit être parfaitement poli pour ne pas trahir le code source."
)

PlanDeSceneDessin.create!(
  fiche_technique_id: fiche.id,
  disposition: "Asymétrique",
  coord_x: 100,
  coord_y: 10,
  layer: "Reflets"
)

# 6. Le Conducteur : La conversation entre l'IA et l'Humain
marker_regret = EmotionalMarker.create!(name: "Regret Lumineux")

conducteur = Conducteur.create!(
  title: "Symphonie pour un pixel mort",
  fiche_technique_id: fiche.id,
  tempo_range: "Adagio Electronique",
  notes: "Projet né de la note : '#{seed_note.title}'"
)

# Ligne de conducteur illustrant la "Reaction" attendue (contradiction technique)
Conducteurline.create!(
  conducteur_id: conducteur.id,
  duree: "00:05:00",
  sequenceaction: "L'interprète regarde son ombre disparaître alors que la lumière s'éteint",
  lumieres_ambiante: "Cyan profond (à 1%)",
  lumieres_effet: "Brillance interne (Contradiction : intensité source à 0%)",
  son: "Fréquence de 528Hz (Fréquence de réparation cellulaire)",
  notes_technicien: "ATTENTION : La machine demande 0% d'intensité mais exige une 'brillance'. Interprétez cela comme une lueur de fin de vie des lampes.",
  emotional_marker_id: marker_regret.id
)

# 7. L'Écart : Analyse de l'échec créatif de la machine
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Signal faible détecté. Erreur de logique : demande de lumière dans un état OFF.",
  human_judgment: "C'est le moment le plus intense précisément parce que l'œil cherche ce qui n'est plus là.",
  the_gap: "L'IA ne comprend pas que le noir n'est pas l'absence de donnée, mais une donnée en soi.",
  artistic_truth: "Le silence et l'obscurité sont des constantes non-négociables."
)

ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "La machine propose d'augmenter la luminosité pour corriger le signal faible.",
  response: "Je refuse catégoriquement.",
  interpretation: "L'obscurité est l'espace où l'imaginaire du spectateur prend le relais du processeur."
)

# 8. Traces du processus
ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Une LED qui clignote seule dans un rack serveur la nuit.",
  rejected_ideas: "Utiliser un écran LED géant (Trop de lumière, tue le mystère).",
  doubts_questions: "Comment coder la disparition sans utiliser la commande 'Delete' ?",
  breakthrough: "Utiliser le reflet d'une source cachée plutôt que la source elle-même.",
  final_form: "Une performance de 20 minutes qui se termine dans un noir total de 5 minutes."
)

puts "--- Germination terminée. Le projet 'Symphonie pour un pixel mort' est prêt à être interprété. ---"
