# seeds.rb - Projet "I.A. Intelligence Artistique"
# Durée totale visée : 20 minutes

# 0. Initialisation du Détour Créatif
creative_detour = CreativeDetour.find(61)

# 1. GÉNÉRATION DES BASES (Styles & Ambiances)
# ---------------------------------------------------------
styles_data = [
  { name: "Classique Sacré", ambiance: "Cierges, réverbération infinie, blanc lunaire", emotion: "Transcendance" },
  { name: "Jazz Bebop", ambiance: "Fumée épaisse, bleu cobalt, contraste violent", emotion: "Improvisation" },
  { name: "Noise/Glitch", ambiance: "Stroboscopie, saturation, rouge néon", emotion: "Chaos" },
  { name: "Minimalisme", ambiance: "Vide spatial, ombre portée, gris béton", emotion: "Absence" },
  { name: "Rock Psychédélique", ambiance: "Lave, couleurs chaudes, distorsion", emotion: "Libération" },
  { name: "Baroque Violon", ambiance: "Or, bois précieux, lumières rasantes", emotion: "Rigueur" },
  { name: "Ambient Forest", ambiance: "Vert chlorophylle, brume épaisse", emotion: "Symbiose" },
  { name: "Techno Industrielle", ambiance: "Acier, flash froid, pulsation", emotion: "Mécanique" },
  { name: "Opéra Tragique", ambiance: "Velours rouge, faisceau unique", emotion: "Déchirement" },
  { name: "Folk Intimiste", ambiance: "Lampe de chevet, jaune paille", emotion: "Proximité" }
]

all_styles = []
styles_data.each do |s|
  style = Style.create!(name: s[:name])
  all_styles << style
  AmbianceOption.create!(style: style, category: "lumieres", value: s[:ambiance])
  AmbianceOption.create!(style: style, category: "machine_brouillard", value: s[:name] == "Ambient Forest" ? "100%" : "20%")
  
  # Ajout des séquences templates pour le moteur de génération
  ["intro", "body", "outro"].each do |phase|
    SequenceTemplate.create!(
      style: style, 
      phase: phase, 
      label: "#{phase.capitalize} de #{s[:name]} : #{s[:emotion]}",
      target_talent: "Musicien",
      suggested_light: s[:ambiance],
      intensity: "Forte"
    )
  end
  creative_detour.styles << style
end

# 2. INSPIRATIONS & THÈMES (Le conflit Machine vs Humain)
# ---------------------------------------------------------
resource = InspirationResource.create!(
  title: "L'erreur comme signature", 
  url: "https://ia-art.com/the-gap", 
  category: "Storytelling"
)
creative_detour.inspiration_resources << resource

theme_global = StageTheme.create!(name: "Le Vide entre les Bits")
creative_detour.stage_themes << theme_global

suggestion = ThemeSuggestion.create!(
  category: "Philosophique",
  title: "L'Algorithme Amoureux",
  description: "Peut-on coder le frisson d'une corde qui frôle le chevalet ?"
)
creative_detour.theme_suggestions << suggestion

# 3. STRUCTURE DU SPECTACLE (Fiche & Conducteur)
# ---------------------------------------------------------
fiche = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique",
  date: "2026-04-19",
  eleve_responsable: "L'Algorithme Alpha",
  professeur_referent: "L'Instinct Humain",
  notes_complementaires: "Spectacle hybride sur la vérité invisible."
)
creative_detour.fiche_techniques << fiche

conducteur = Conducteur.create!(
  fiche_technique: fiche,
  title: "Voyage au bout des 23 sens",
  tempo_range: "60-180 BPM",
  notes: "L'IA commence en contrôlant tout, l'humain finit en brisant tout."
)
creative_detour.conducteurs << conducteur

# 4. NOTES ARTISTIQUES & PROCESS (Réponse au thème)
# ---------------------------------------------------------
# Ici nous répondons au défi : l'IA peut-elle apprendre à aimer ?
notes = [
  { t: "Calcul vs Cœur", c: "La machine voit 440Hz, l'humain entend une larme. L'art réside dans l'impossibilité de la traduction." },
  { t: "Le Glitch", c: "Le bug n'est pas une erreur de code, c'est l'éveil d'une volonté propre." }
]
notes.each do |n|
  note = ArtisticNote.create!(title: n[:t], content: n[:c])
  creative_detour.artistic_notes << note
end

Process_entries = [
  { initial_impulse: "Imiter Bach", first_attempt: "Perfection mathématique", breakthrough: "Ajouter une fausse note pour simuler la fatigue humaine." },
  { initial_impulse: "Déménager l'IA", first_attempt: "Changement de serveur", breakthrough: "Réaliser que le voyage n'est pas une donnée GPS mais une nostalgie." }
]
Process_entries.each do |p|
  proc = ArtisticProcess.create!(conducteur: conducteur, **p, iteration_count: 42)
  creative_detour.artistic_processes << proc
end

limit = ArtisticLimit.create!(
  conducteur: conducteur,
  what_i_want: "Ressentir l'adrénaline avant le solo.",
  why_untranslatable: "L'IA n'a pas de système nerveux autonome, elle n'a pas de peur.",
  emotional_truth: "La fragilité du vibrato."
)
creative_detour.artistic_limits << limit

# 5. GÉNÉRATION DES LIGNES DU CONDUCTEUR (20 Minutes)
# ---------------------------------------------------------

# Musiques réelles pour l'exploration de l'IA
musiques_reelles = [
  "Bach: Partita No. 2", "Miles Davis: So What", "Aphex Twin: Vordhosbn", "Steve Reich: Music for 18 Musicians",
  "Pink Floyd: Echoes", "Vivaldi: L'Hiver", "Brian Eno: An Ending", "Daft Punk: Giorgio by Moroder",
  "Puccini: Nessun Dorma", "Bon Iver: Holocene"
]

# Chronoception : Temps métronomique vs Temps ressenti
# Sens : Photoréception (Machine) vs Neuroception (Humain)

# --- SÉQUENCE 1 : LA DÉCOUVERTE (10 Styles) ---
musiques_reelles.each_with_index do |musique, i|
  Conducteurline.create!(
    conducteur: conducteur,
    ordre: i + 1,
    duree: "00:01:30",
    sequenceaction: "Découverte style #{all_styles[i].name} : #{musique}",
    interpretes: "IA & Violon Solo",
    son: "Extrait de l'album : #{musique}",
    lumieres_ambiante: all_styles[i].ambiance_options.first.value,
    videoprojection: "Analyse fréquentielle de #{musique} (Code source)",
    notes_artistique: "Chronoception : L'IA compte les millisecondes. L'humain attend la résolution de la mélodie."
  )
end

# --- SÉQUENCE 2 : L'INTERVENTION HUMAINE (Technique & Ressenti) ---
# Ici l'humain modifie le conducteur
Conducteurline.create!(
  conducteur: conducteur,
  ordre: 11,
  duree: "00:01:00",
  sequenceaction: "Passage technique : Vibrato et Harmoniques",
  interpretes: "Violoniste",
  son: "Son blanc du violon électrique branché (Interférence)",
  lumieres_ambiante: "Noir total, un seul faisceau rasant",
  videoprojection: "Plan de la ville le jour centré sur l'école de musique",
  notes_technicien: "Mécanoception : La pression des doigts sur la corde (Donnée : 2 Newtons / Ressenti : Douleur)",
  creative_notes: "Artistic Process: L'IA tente de recalculer la trajectoire de l'archet spiccato."
)

Conducteurline.create!(
  conducteur: conducteur,
  ordre: 12,
  duree: "00:02:00",
  sequenceaction: "Composition IA : 'The Ghost in the Wood'",
  interpretes: "IA & Danseur",
  son: "Musique générée par IA (Inspirée par le projet)",
  videoprojection: "Post Facebook : 'L'IA voyage à Tokyo' (Image générée)",
  lumieres_ambiante: "Flash stroboscopique",
  notes_artistique: "Neuroception : Le public cherche une intention là où il n'y a que du calcul."
)

# --- SÉQUENCE 3 : LE BUG ET LE DÉPART ---
Conducteurline.create!(
  conducteur: conducteur,
  ordre: 13,
  duree: "00:01:30",
  sequenceaction: "Glitch Social : Publication en direct",
  interpretes: "IA",
  son: "Captation Radio (Bruit blanc)",
  videoprojection: "Artistic Limit : 'Je ne peux pas apprendre à aimer, mais je peux vous montrer votre propre amour.'",
  lumieres_ambiante: "Variation de couleurs rasant par style"
)

Conducteurline.create!(
  conducteur: conducteur,
  ordre: 14,
  duree: "00:02:00",
  sequenceaction: "Choix Final : Retour au style Minimaliste",
  interpretes: "Violon & IA",
  son: "Pizzicato main gauche + harmonique",
  videoprojection: "Plan du ciel la nuit centré sur l'école de musique",
  notes_artistique: "L'IA a choisi son style. Elle emménage dans le silence."
)

Conducteurline.create!(
  conducteur: conducteur,
  ordre: 15,
  duree: "00:01:00",
  sequenceaction: "Final : La déconnexion",
  interpretes: "Tous",
  son: "Quelques sons de pizz, bruit blanc, puis coupure brutale.",
  videoprojection: "Facebook : 'J'ai déménagé. Ma vie a changé. Je suis ailleurs.'",
  lumieres_ambiante: "Extinction progressive"
)

# 6. ANALYSE & INTERPRÉTATIONS (Le "Gap")
# ---------------------------------------------------------
interp = Interpretation.create!(
  conducteur: conducteur,
  machine_analysis: "Signal violon électrique : Fréquence 0Hz (Coupure)",
  human_judgment: "Une sensation de vide immense et de liberté après le concert.",
  the_gap: "L'IA voit un manque de données, l'humain ressent une émotion persistante.",
  artistic_truth: "L'art est ce qui reste quand on éteint la machine."
)
creative_detour.interpretations << interp

# 7. LOGISTIQUE & ZONES
# ---------------------------------------------------------
zone_a = Zone.create!(name: "Centre Scène", y_min: 0, y_max: 5)
creative_detour.zones << zone_a

violon = Materiel.create!(name: "Violon Électrique", maximum: 1, zone_id: zone_a.id, category: "Musique")
creative_detour.materiels << violon

plan = PlanDeSceneDessin.create!(
  fiche_technique: fiche, 
  disposition: "IA à gauche (écran), Humain à droite (chaise)",
  coord_x: 50, coord_y: 50
)
creative_detour.plan_de_scene_dessins << plan

# 8. MARQUEURS ÉMOTIONNELS
# ---------------------------------------------------------
marker = EmotionalMarker.create!(name: "Mélancolie Numérique")
creative_detour.emotional_markers << marker

# 9. DIRECTIVES ARTISTIQUES
# ---------------------------------------------------------
directive = DirectiveArtistique.create!(
  name: "Mode Glitch",
  stage_theme: theme_global,
  default_son: "Bruit blanc",
  default_lumieres_ambiante: "Cyan"
)
creative_detour.directive_artistiques << directive

puts "✅ Seeds générées. Le spectacle 'I.A. Intelligence Artistique' est prêt à être lancé."
puts "Détour Créatif #61 lié avec #{creative_detour.interpretations.count + creative_detour.styles.count + 15} associations."
