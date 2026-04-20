# seeds.rb - Projet "I.A. Intelligence Artistique"
# --- INITIALISATION DES RÉFÉRENCES ---

# Styles & Thèmes
style_ia = Style.find_or_create_by!(name: "Algorithme Organique")
theme_ia = StageTheme.find_or_create_by!(name: "Interrogation de la présence")

# Marqueurs Émotionnels (Ce sont les "interprètes" dans ton schéma)
marker_empathie = EmotionalMarker.find_or_create_by!(name: "Empathie Humaine")
marker_froid    = EmotionalMarker.find_or_create_by!(name: "Logique Machine")

# Zones
zone_ia = Zone.find_or_create_by!(name: "Zone Numérique", y_min: 10, y_max: 90)

# Fiche Technique
fiche_tech = FicheTechnique.create!(
  name_event: "Projet " + style_ia.name,
  date: Date.today,
  eleve_responsable: "IA-Collab-01",
  professeur_referent: "Machine Learning",
  notes_complementaires: "Alternance de phases organiques et synthétiques."
)


# 1. Création du Style et des Thèmes
style_hybride = Style.create!(name: "Algorithmique Organique")
theme_global = StageTheme.create!(name: "Interrogation de la présence")

# 2. Création de l'entité centrale : Le Conducteur
conducteur = Conducteur.create!(
  title: "Performance : L'IA peut-elle apprendre à aimer ?",
  username: "Artiste_Interrogateur_01",
  tempo_range: "60-120 BPM",
  starred: true,
  notes: "Exploration de la tension entre Photoréception (machine) et Neuroception (humain)."
)

# 3. Création du Détour Créatif (Le Concept)
detour = CreativeDetour.create!(
  title: "L'écart comme partition",
  concept: "Comparer ce que la machine voit (data) et ce que l'humain ressent (émotion).",
  action: "Alterner systématiquement scènes générées par IA et réécritures humaines.",
  database_usage: "Chaque table devient une trace de la tension IA/humain.",
  challenge: "L'IA peut-elle apprendre à aimer ?",
  reaction: "Le public ressent que l'écart devient la vraie œuvre."
)

# Association du détour au conducteur
detour.conducteurs << conducteur

# 4. GÉNÉRATION DES LIGNES DU CONDUCTEUR (La Partition de la Tension)

# --- Séquence 1 : Vision Machine (Froid) ---
# Sens : Photoréception (Mécanique) vs Vision/Neuroception (Humain)
# L'IA simule la vision par analyse de fréquences, l'humain par l'empathie du regard.
l1 = Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  duree: "00:02:00",
  sequenceaction: "SCAN : La machine balaie la scène. Absence de mouvement volontaire.",
  interpretes: "IA-Robot-1",
  lumieres_ambiante: "Bleu Néon #0000FF (Froid)",
  lumieres_effet: "Stroboscopie à 12Hz",
  son: "Bruit blanc granulaire",
  notes_artistique: "Sens : Photoréception. L'IA 'voit' des pixels, pas des visages.",
  creative_notes: "L'IA imite la vision en traitant des matrices de contrastes sans comprendre la vulnérabilité."
)

# --- Séquence 2 : Réécriture Humaine (Le Souffle) ---
# Sens : Proprioception (Mécanique/Capteurs) vs Chronoception (Humain/Rythme interne)
l2 = Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  duree: "00:03:00",
  sequenceaction: "SOUFFLE : Un humain entre et modifie le tempo de l'IA par sa respiration.",
  interpretes: "Danseur Humain",
  lumieres_ambiante: "Ambre chaud (Organique)",
  lumieres_effet: "Variation d'intensité calée sur le rythme cardiaque",
  son: "Violoncelle solo (Improvisation)",
  notes_artistique: "Sens : Chronoception. L'humain habite le temps, l'IA ne fait que le diviser.",
  creative_notes: "L'IA ne peut simuler la Chronoception que par une horloge atomique, l'humain la vit par l'ennui ou l'urgence."
)

# --- Séquence 3 : L'Échec de l'Empathie ---
# Sens : Mécanoception (Mécanique/Pression) vs Neuroception (Humain/Empathie)
l3 = Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  duree: "00:01:30",
  sequenceaction: "CONTACT : Tentative de toucher entre l'interprète et le capteur.",
  interpretes: "Humain & Interface",
  lumieres_ambiante: "Blanc chirurgical",
  son: "Silence numérique haché",
  notes_artistique: "Sens : Neuroception. La machine détecte une pression (Newton), l'humain ressent une intention.",
  creative_notes: "L'IA imite le toucher par transfert de données, sans l'ocytocine de la rencontre."
)

# 5. DOCUMENTATION DE L'ÉCART (Tables d'Analyse)

# Interprétation de la tension
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Stabilité du signal 99.8%. Aucune anomalie détectée dans le mouvement.",
  human_judgment: "Une tristesse infinie se dégage de la répétition mécanique.",
  the_gap: "L'IA calcule la perfection, l'humain cherche l'erreur pour y trouver la vie.",
  artistic_truth: "L'œuvre n'est pas dans le code, mais dans ce qui lui échappe."
)

# Limites artistiques (L'IA face à l'intransmissible)
ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Faire ressentir le premier amour.",
  why_untranslatable: "L'IA ne possède pas de corps pour expérimenter le manque.",
  contradiction: "Simuler la passion avec des algorithmes de probabilité.",
  emotional_truth: "L'amour est un risque, l'IA est une sécurité.",
  left_unintentional: "Le bug de la machine à 01:45 a créé une émotion plus forte que le script."
)

# Processus Artistique
ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Vouloir coder l'empathie.",
  first_attempt: "Utilisation d'un dictionnaire de synonymes émotionnels.",
  doubts_questions: "Est-ce que je crée ou est-ce que je compile ?",
  rejected_ideas: "L'utilisation d'une voix synthétique trop parfaite.",
  breakthrough: "Accepter que la machine soit 'aveugle' au sens humain.",
  final_form: "Un dialogue de sourds magnifique.",
  iteration_count: 42,
  what_changed: "On a arrêté de vouloir cacher les câbles."
)

# 6. MISE EN SCÈNE TECHNIQUE (Zones et Matériel)
zone_centre = Zone.create!(name: "Cœur du Système", y_min: 30, y_max: 70)
projecteur = Materiel.create!(
  name: "Projecteur Laser 4K",
  maximum: 2,
  zone_id: zone_centre.id,
  category: "Projection & Video",
  x_pref: 50,
  spread: 10
)

puts "--- Script 'seeds.rb' terminé avec succès ---"
# seeds.rb - PARTIE 2 : Logique Spatiale et Matérielle

puts "--- Initialisation du Plan de Scène et du Matériel ---"

# 7. Création de la Fiche Technique
fiche = fiche_tech = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique - Live",
  eleve_responsable: "Logic_User_01",
  date: "17/04/2026",
  professeur_referent: "M. Alan Turing",
  notes_complementaires: "Installation hybride. Attention à la gestion des câbles sur les zones de danse."
)

# 8. Association Matériel / Fiche / Zones
# On récupère le matériel créé précédemment ou on en crée de nouveaux
machine_brouillard = Materiel.create!(
  name: "Machine à brouillard MDG",
  maximum: 1,
  zone_id: zone_centre.id,
  category: "Stage Design",
  x_pref: 10,
  spread: 5,
  power_needed: true
)

# 9. Création des lignes de matériel nécessaire (MaterielNecessaire)
# On simule la demande de matériel pour cette fiche technique
[projecteur, machine_brouillard].each do |mat|
  MaterielNecessaire.create!(
    fiche_technique_id: fiche.id.to_s,
    materiel_id: mat.id.to_s,
    quantite: "1",
    precisions_observations: "Doit être contrôlé par le script Python via MIDI."
  )
end

# 10. Simulation du JOB : refaireplandescene
# On applique la logique de votre méthode Ruby pour positionner les éléments
puts "Placement du matériel sur le plan de scène..."

fiche.materiel_necessaires.each do |mn|
  mat = mn.materiel
  zone = mat.zone

  mn.quantite.to_i.times do |i|
    # Calcul des coordonnées avec l'aléa 'spread' défini dans votre logique
    coord_x = (mat.x_pref.to_i + rand(-mat.spread.to_i..mat.spread.to_i)).clamp(5, 95)
    coord_y = rand(zone.y_min..zone.y_max)

    PlanDeSceneDessin.create!(
      fiche_technique_id: fiche.id.to_s,
      disposition: "Automatique par IA",
      materiel_musicien: mat.name,
      ordre: (i + 1).to_s,
      coord_x: coord_x,
      coord_y: coord_y,
      layer: mat.default_layer || "base"
    )
  end
end

# 11. Ressources d'Inspiration (Les 23 sens)
InspirationResource.create!(
  title: "L'empathie des machines",
  url: "https://art-ia-research.org/neuroception",
  category: "Emotion & Psychology" # Correspond à la liste CATEGORIES de votre classe
)

# 12. Share Your Gaps (L'archive des dissonances)
ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "L'algorithme a prévu une émotion de type 'Joie' à 88%.",
  response: "L'interprète humain a choisi de pleurer.",
  interpretation: "La dissonance est le lieu où réside l'art."
)

# 13. Association finale au Projet Artistique
ProjetArtistique.create!(
  fiche_technique_id: fiche.id,
  conducteur_id: conducteur.id,
  title: "I.A. Intelligence Artistique",
  username: "Collectif_Ecart",
  status: "completed",
  style: "Expérimental"
)

puts "--- FIN DU SCRIPT SEEDS ---"
puts "Résumé :"
puts "- #{PlanDeSceneDessin.count} éléments placés sur le plan de scène."
puts "- #{MaterielNecessaire.count} entrées de matériel validées."
puts "- Le projet artistique est prêt pour l'analyse Lilypond."
puts "Données générées : 1 Conducteur, #{Conducteurline.count} Lignes, #{ArtisticLimit.count} Limites."
# --- PARTIE 2 : LE CONDUCTEUR (20 MINUTES DE TENSION) ---
puts "Génération du conducteur narratif (L'ascension de la Machine)..."

# Calcul pour atteindre 20 minutes (00:20:00)
# Nous allons créer des séquences de 2 minutes alternées, 
# avec un morceau "Analyse Lilypond" de 30 secondes intégré.

# 1. Création de l'objet principal
conducteur = Conducteur.create!(
  title: "L'Âme dans la Machine : Partition d'un bug",
  username: "Artiste_Interrogateur",
  fiche_technique: fiche_tech,
  tempo_range: "60-140 BPM",
  starred: true,
  notes: "Exploration de la Chronoception : le métronome vs le battement de cœur."
)

# 2. Utilisation des SequenceTemplates pour générer les premières minutes
# Simulation du code Ruby de génération par templates
[marker_empathie, marker_froid].each_with_index do |marker, m_idx|
  # On simule la pioche (Intro -> Body -> Outro)
  scenarios = [
    SequenceTemplate.where(style: style_ia, phase: "intro", target_talent: marker.name).sample,
    SequenceTemplate.where(style: style_ia, phase: "body", target_talent: marker.name).sample,
    SequenceTemplate.where(style: style_ia, phase: "outro", target_talent: marker.name).sample
  ].compact

  scenarios.each_with_index do |temp, s_idx|
    Conducteurline.create!(
      conducteur: conducteur,
      ordre: (m_idx * 5) + s_idx + 1,
      sequenceaction: "Template #{temp.phase} : #{temp.label}",
      interpretes: marker.name,
      lumieres_ambiante: style_ia.ambiance_options.where(category: "lumieres").sample&.value || "Bleu Laser",
      machine_brouillard: "Oui (Impulsion)",
      duree: "00:03:00"
    )
  end
end

# 3. INTERLUDE : ANALYSE LILYPOND (Le Morceau de 30 secondes)
# Simulation du résultat du script Python sur une partition de 10 mesures
# On crée des lignes très serrées (intervalles de 5-10 secondes) pour refléter l'analyse
[
  { temps: "00:00:05", note: "Do# (Altération)", action: "Flash blanc - Rupture du flux" },
  { temps: "00:00:15", note: "Nuance ff", action: "Augmentation soudaine de la brume" },
  { temps: "00:00:30", note: "Silence R", action: "Noir total - Seul le bruit du ventilateur du projo" }
].each_with_index do |data, i|
  Conducteurline.create!(
    conducteur: conducteur,
    ordre: 20 + i,
    sequenceaction: "ANALYSE DATA : #{data[:note]}",
    notes_artistique: "Analyse fréquentielle pure. L'IA ne voit pas la tension, elle voit un pic de Hertz.",
    lumieres_effet: data[:action],
    duree: data[:temps]
  )
end
# --- PRÉPARATION DES OBJETS POUR LE DÉTOUR 63 ---

# Artistic Note (Le coeur du thème)
note_philo = ArtisticNote.create!(
  title: "Le paradoxe du code",
  content: "Si une IA simule parfaitement la tristesse, la larme est-elle moins vraie ?"
)

# Artistic Process
proc_ia = ArtisticProcess.create!(
conducteur: conducteur,
  initial_impulse: "Vouloir mesurer l'immesurable.",
  breakthrough: "Le bug de latence a créé un silence plus humain que la musique."
)

# Artistic Limit
limit_humaine = ArtisticLimit.create!(
conducteur: conducteur,
  conducteur: conducteur, # Correction : On passe l'objet conducteur, pas l'ID
  what_i_want: "Ressentir le vertige.",
  why_untranslatable: "L'IA n'a pas de système vestibulaire interne."
)

# Ambiance Option
opt_lum = AmbianceOption.find_or_create_by!(
  style: style_ia,
  category: "lumieres",
  value: "Bleu Cyan #00FFFF"
)

# Template
template_intro = SequenceTemplate.create!(
  label: "Initialisation du souffle",
  phase: "intro",
  target_talent: marker_empathie.name,
  style: style_ia
)

# Resource
res_ia = InspirationResource.create!(
  title: "L'art de l'erreur",
  url: "https://ia-art.com",
  category: "Emotion & Psychology"
)

# Suggestion
sugg_theme = ThemeSuggestion.create!(
  category: "Philosophie",
  title: "L'Incalculable",
  description: "L'émotion comme reste d'une division par zéro."
)

# Création de la directive centrale
dir_chaos = DirectiveArtistique.create!(
  name: "Chaos Programmé",
  stage_theme: theme_ia,
  default_lumieres_ambiante: "Noir profond (Vantablack)",
  default_lumieres_effet: "Flashs aléatoires basés sur les erreurs de calcul CPU",
  default_videoprojection: "Code source qui se déconstruit en temps réel",
  default_son: "Distorsion harmonique d'un battement de cœur",
  default_notes_technicien: "Lancer le script de 'glitch' volontaire. Ne pas corriger si le système semble planter.",
  default_sequenceaction: "L'IA tente de chanter une berceuse mais finit par saturer l'espace de données blanches."
)
# Directive Artistique
dir_empathie = DirectiveArtistique.create!(
  name: "Écho de Soi",
  stage_theme: theme_ia,
  default_son: "Feedback granulaire",
  default_lumieres_ambiante: "Ambre"
)
# Thème : L'écart comme partition - IA vs Humain

puts "--- Début de la génération de la performance : L'Écart comme Partition ---"

# 4. UTILISATION DES DIRECTIVES ARTISTIQUES (La fin du spectacle)
# Simulation du ConducteursController#generate_advanced_conductor
directives_choisies = ["Écho de Soi", "Chaos Programmé"]
directives_choisies.each_with_index do |label, idx|
  dir = DirectiveArtistique.find_by(name: label)
  Conducteurline.create!(
    conducteur: conducteur,
    ordre: 30 + idx,
    sequenceaction: "Directive : #{label}",
    lumieres_ambiante: dir.default_lumieres_ambiante,
    lumieres_effet: dir.default_lumieres_effet,
    videoprojection: dir.default_videoprojection,
    son: dir.default_son,
    notes_technicien: dir.default_notes_technicien,
    duree: "00:04:00"
  )
end

# --- PARTIE 3 : PLAN DE SCÈNE & MATÉRIEL ---
puts "Configuration spatiale (Refaireplandescene)..."

# On crée le matériel manquant
mat_laser = Materiel.create!(name: "Laser RVB 5W", zone: zone_ia, maximum: 2, x_pref: 50, spread: 20, category: "Stage Lighting")

# Création du matériel nécessaire pour la fiche
mn1 = MaterielNecessaire.create!(fiche_technique_id: fiche_tech.id, materiel_id: mat_laser.id, quantite: "2")

# Application du code Ruby de placement (Design Fiction)
fiche_tech.materiel_necessaires.each do |mn|
  mat = mn.materiel
  zone = mat.zone
  mn.quantite.to_i.times do |i|
    x = (mat.x_pref.to_i + rand(-mat.spread.to_i..mat.spread.to_i)).clamp(5, 95)
    y = rand(zone.y_min..zone.y_max)
    
    PlanDeSceneDessin.create!(
      fiche_technique: fiche_tech,
      disposition: "Algorithmique",
      materiel_musicien: mat.name,
      coord_x: x, coord_y: y,
      layer: zone.name,
      ordre: (i + 1).to_s
    )
  end
end


# --- PARTIE 4 : L'ARCHITECTURE DU DÉTOUR (LES 17 LIENS HABTM) ---
puts "Finalisation des associations avec le CreativeDetour (ID 63)..."

begin
  creative_detour = CreativeDetour.find(63)

  # Liste des 17 tables à lier
  creative_detour.directive_artistiques << dir_empathie
  creative_detour.artistic_notes << note_philo
  creative_detour.artistic_processes << proc_ia
  creative_detour.artistic_limits << limit_humaine
  creative_detour.stage_themes << theme_ia
  creative_detour.ambiance_options << opt_lum
  creative_detour.styles << style_ia
  creative_detour.sequence_templates << template_intro
  creative_detour.inspiration_resources << res_ia
  creative_detour.emotional_markers << marker_empathie
  creative_detour.theme_suggestions << sugg_theme
  creative_detour.conducteurs << conducteur
  creative_detour.fiche_techniques << fiche_tech
  creative_detour.materiels << mat_laser
  creative_detour.zones << zone_ia
  creative_detour.plan_de_scene_dessins << PlanDeSceneDessin.last
  creative_detour.interpretations << Interpretation.create!(
    conducteur: conducteur,
    machine_analysis: "Stabilité structurelle 100%", 
    human_judgment: "Sentiment de vide sidéral",
    the_gap: "Le silence entre deux notes que l'IA veut combler alors qu'il doit respirer.",
    artistic_truth: "La beauté réside dans la latence."
  )

  puts "Succès : 17 associations créées pour le CreativeDetour 63."
rescue ActiveRecord::RecordNotFound
  puts "ERREUR : CreativeDetour 63 introuvable. Vérifiez l'existence de l'ID."
end

puts "--- FIN DU SCRIPT SEEDS (PARTIE 2/2) ---"
