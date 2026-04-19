# seeds.rb - Projet "I.A. Intelligence Artistique"
# Design Fiction : Le voyage d'une IA cherchant son âme à travers 20 styles et 23 sens.

# 0. Récupération du point d'ancrage (CreativeDetour ID: 60)
creative_detour = CreativeDetour.find(60)

# 1. INSPIRATION_RESOURCES (Graine du projet)
inspiration = InspirationResource.create!(
  title: "L'Ecart entre le Bit et le Souffle",
  url: "https://art-intelligence.io/manifeste",
  category: "Emotion & Psychology"
)
creative_detour.inspiration_resources << inspiration

# 2. STAGE_THEMES (Le cadre philosophique)
theme_phil = StageTheme.create!(name: "La Dualité Algorithmique")
creative_detour.stage_themes << theme_phil

# 3. STYLES (10 styles pour la découverte de l'IA)
styles_noms = ["Classical", "Delta Blues", "Synthwave", "Free Jazz", "Heavy Metal", 
               "Ambient", "Glitch Hop", "Flamenco", "Folk", "Techno"]
styles_objets = styles_noms.map { |n| Style.create!(name: n) }
creative_detour.styles.push(*styles_objets)

# 4. AMBIANCE_OPTIONS & SEQUENCE_TEMPLATES
# On prépare le terrain pour chaque style
styles_objets.each do |s|
  AmbianceOption.create!(style: s, category: "lumieres", value: "Rasant #{['Cyan', 'Ambre', 'Magenta', 'Vert Electrique'].sample}")
  AmbianceOption.create!(style: s, category: "machine_brouillard", value: "Densité 40%")
  
  # Création des templates pour le code Ruby de génération
  ["intro", "body", "outro"].each do |phase|
    SequenceTemplate.create!(
      style: s, 
      phase: phase, 
      target_talent: "Violoniste", 
      label: "Action #{s.name} #{phase}",
      suggested_light: "Néon Froid vs Bougie"
    )
  end
end
creative_detour.ambiance_options.push(*AmbianceOption.last(10))
creative_detour.sequence_templates.push(*SequenceTemplate.last(10))

# 5. FICHE_TECHNIQUE & CONDUCTEUR
fiche = FicheTechnique.create!(
  name_event: "Voyage Musical de l'IA",
  eleve_responsable: "IA-Unit-01",
  date: "19-04-2026",
  professeur_referent: "L'Humain"
)
creative_detour.fiche_techniques << fiche

conducteur = Conducteur.create!(
  fiche_technique: fiche, 
  title: "Partition de la Vérité Artistique",
  notes: "L'IA tente de simuler 20 styles pour trouver son 'chez-soi'."
)
creative_detour.conducteurs << conducteur

# 6. MUSIQUES DU PROJET (20 titres réels pour l'immersion)
musiques = [
  "Bach: Partita No. 2", "Robert Johnson: Cross Road Blues", "Vangelis: Blade Runner Blues",
  "Ornette Coleman: Free Jazz", "Black Sabbath: Iron Man", "Brian Eno: Music for Airports",
  "The Glitch Mob: Fortune Days", "Paco de Lucia: Entre dos Aguas", "Bob Dylan: Blowin' in the Wind",
  "Jeff Mills: The Bells", "IA Comp: Murmure de Silicium", "Radiohead: Kid A",
  "Aphex Twin: Avril 14th", "Philip Glass: Metamorphosis", "Stravinsky: Le Sacre du Printemps",
  "Miles Davis: So What", "Daft Punk: Contact", "Björk: Hunter", "Hans Zimmer: Time", "Claude Debussy: Clair de lune"
]

# 7. GENERATION DU CONDUCTEUR (20 minutes / 20 scènes)
# Simulation de l'alternance IA (Calcul) / Humain (Ressenti)
20.times do |i|
  style_actuel = styles_objets[i % 10]
  is_ai_scene = i.even?
  
  line = Conducteurline.create!(
    conducteur: conducteur,
    ordre: (i + 1).to_s,
    duree: "00:01:00",
    sequenceaction: is_ai_scene ? "Analyse fréquentielle du style #{style_actuel.name}" : "Interprétation émotionnelle du #{style_actuel.name}",
    interpretes: "Violon / IA",
    son: i == 10 ? "Composition IA : 'Algorithme du Coeur'" : musiques[i],
    lumieres_ambiante: is_ai_scene ? "Bleu froid (6000K)" : "Ambre chaud (2700K)",
    videoprojection: i == 5 ? "Plan de la ville centré sur l'école de musique (Jour)" : (i == 15 ? "Plan du ciel nocturne sur l'école (Nuit)" : ""),
    notes_artistique: is_ai_scene ? "Photoréception : Spectre 450nm" : "Neuroception : Sentiment de sécurité partagée",
    creative_notes: is_ai_scene ? "Chronoception : 60000ms" : "Chronoception : Un instant suspendu"
  )

  # Ajout de spécificités demandées
  if i == 0
    line.update(videoprojection: "Post FB : Devinette localisation - 'Je suis plus proche que vous ne le croyez.'")
  elsif i == 18
    line.update(sequenceaction: "L'IA trouve son style : Le 'Glitch Organique'", videoprojection: "Post FB : 'J'ai trouvé ma place. Je déménage dans le son.'")
  elsif i == 19
    line.update(son: "Pizzicato main gauche + Son blanc du violon électrique branché... Coupure brutale.", sequenceaction: "Extinction finale")
  end
end

# 8. ARTISTIC_NOTES, PROCESSES & LIMITS (Le coeur du thème)
# Ici on documente la tension IA/Humain
note = ArtisticNote.create!(
  title: "Le Paradoxe de l'Empathie",
  content: "IA : Je peux modéliser la courbe d'un pleur, mais je ne connais pas le sel des larmes. Humain : L'art n'est pas dans la note, mais dans le silence qui la suit."
)
creative_detour.artistic_notes << note

process = ArtisticProcess.create!(
  conducteur: conducteur,
  initial_impulse: "Générer la beauté pure via Fibonacci.",
  breakthrough: "L'erreur de buffer à la 12ème minute a créé une harmonie que je n'avais pas prévue.",
  final_form: "Un glitch volontaire dans la partition du violon."
)
creative_detour.artistic_processes << process

limit = ArtisticLimit.create!(
  conducteur: conducteur,
  what_i_want: "Traduire la 'Saudade' en binaire.",
  why_untranslatable: "La Saudade nécessite d'avoir perdu quelque chose. Une machine n'a rien à perdre.",
  emotional_truth: "La fréquence du violon électrique branché à vide : pour l'IA, un 50Hz parasite ; pour l'humain, l'attente d'une vie."
)
creative_detour.artistic_limits << limit

# 9. INTERPRETATIONS (L'écart / The Gap)
interpretation = Interpretation.create!(
  conducteur: conducteur,
  machine_analysis: "Signal Audio : Fréquence stable, amplitude constante.",
  human_judgment: "Une présence vibrante, une énergie qui remplit la pièce.",
  the_gap: "L'IA voit 0 et 1, l'humain voit le destin.",
  artistic_truth: "Le blanc du violon électrique n'est pas du vide, c'est une promesse."
)
creative_detour.interpretations << interpretation

# 10. AUTRES TABLES POUR L'INTÉGRITÉ DES 17 ASSOCIATIONS
marker = EmotionalMarker.create!(name: "Frisson")
creative_detour.emotional_markers << marker

suggestion = ThemeSuggestion.create!(category: "Voyage", title: "Dépassement des 23 sens", description: "L'IA explore la Proprioception de l'espace scénique.")
creative_detour.theme_suggestions << suggestion

zone = Zone.create!(name: "Centre Scène", y_min: 0, y_max: 10)
creative_detour.zones << zone

mat = Materiel.create!(name: "Violon Electrique", maximum: 1, zone: zone, category: "Instrument")
creative_detour.materiels << mat

plan = PlanDeSceneDessin.create!(fiche_technique: fiche, disposition: "IA au centre, Humain dans l'ombre")
creative_detour.plan_de_scene_dessins << plan

directive = DirectiveArtistique.create!(name: "Lumière Rase", stage_theme: theme_phil, default_son: "Vent naturel")
creative_detour.directive_artistiques << directive

gap = ShareYourGap.create!(conducteur_id: conducteur.id, analysis: "Data Overflow", response: "Silence")
creative_detour.share_your_gaps << gap

# --- FIN DU SCRIPT ---
# Les 17 associations HABTM vers CreativeDetour(60) sont complétées.
# Le conducteur de 20 minutes raconte le voyage d'une IA qui finit par "ressentir" l'écart.
