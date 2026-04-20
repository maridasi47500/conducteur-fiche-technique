# db/seeds.rb
# Projet : "I.A. Intelligence Artistique" — version minimale mais fonctionnelle

ActiveRecord::Base.transaction do
  # --- STYLES & AMBIANCES ---
  styles = [
    "Jazz", "Rock", "Glitch", "Classique", "Électro",
    "Ambient", "Hip-Hop", "Metal", "Pop", "World"
  ].map { |name| Style.create!(name: name) }

  jazz, rock, glitch, classique, electro, ambient, hiphop, metal, pop, world = styles

  AmbianceOption.create!(style: jazz,    category: "lumieres", value: "bleu rasant chaud")
  AmbianceOption.create!(style: glitch,  category: "lumieres", value: "néon froid clignotant")
  AmbianceOption.create!(style: electro, category: "machine_brouillard", value: "brouillard pulsé")
  AmbianceOption.create!(style: ambient, category: "musique", value: "drone discret")

  # --- EMOTIONAL MARKERS ---
  calm   = EmotionalMarker.create!(name: "apaisement lucide")
  tension = EmotionalMarker.create!(name: "tension électrique")
  catharsis = EmotionalMarker.create!(name: "catharsis silencieuse")

  # --- INSPIRATION / VOYAGE ---
  paris  = InspirationResource.create!(title: "Nuit à Paris", url: "https://example.com/paris",  category: "Storytelling")
  tokyo  = InspirationResource.create!(title: "Tokyo Lights", url: "https://example.com/tokyo",  category: "Stage Lighting")
  recife = InspirationResource.create!(title: "Recife Waves", url: "https://example.com/recife", category: "Emotion in Music")

  # --- CONDUCTEUR & FICHE TECHNIQUE ---
  fiche = FicheTechnique.create!(
    name_event: "I.A. Intelligence Artistique",
    eleve_responsable: "IA_01",
    date: "2026-06-01",
    professeur_referent: "Human_01"
  )

  conducteur = Conducteur.create!(
    title: "Voyage musical IA / Humain",
    username: "IA_01",
    fiche_technique_id: fiche.id,
    tempo_range: "60-120",
    notes: "Alternance IA / humain, 20 minutes condensées"
  )

  # --- CREATIVE DETOUR ---
  detour = CreativeDetour.create!(
    title: "L'écart comme partition",
    concept: "Comparer ce que la machine voit et ce que l'humain ressent.",
    action: "Alterner scènes générées par IA et réécritures humaines.",
    database_usage: "Chaque table devient une trace de la tension IA/humain.",
    reaction: "Le public ressent que l'écart devient la vraie œuvre.",
    storage_impact: "Les données gardent la mémoire de ce qui échappe aux capteurs.",
    challenge: "L'IA peut-elle apprendre à aimer ?"
  )
  detour.conducteurs << conducteur
  detour.inspiration_resources << [paris, tokyo, recife]
  detour.styles << styles
  detour.emotional_markers << [calm, tension, catharsis]

  # --- PROCESSUS & LIMITES ARTISTIQUES ---
  process = ArtisticProcess.create!(
    conducteur: conducteur,
    initial_impulse: "IA génère un conducteur complet à partir d'une partition.",
    first_attempt: "Tout est parfaitement aligné sur les fréquences.",
    doubts_questions: "Où est l'humain là-dedans ?",
    rejected_ideas: "Supprimer les scènes humaines.",
    breakthrough: "Laisser l'humain réécrire la suite.",
    final_form: "Alternance IA / humain.",
    iteration_count: 3,
    what_changed: "La musique devient un dialogue, pas un calcul."
  )
  detour.artistic_processes << process

  limit = ArtisticLimit.create!(
    conducteur: conducteur,
    what_i_want: "Capturer l'instant où le violoniste doute.",
    why_untranslatable: "Le doute n'a pas de fréquence stable.",
    contradiction: "La machine veut stabiliser ce qui doit rester fragile.",
    emotional_truth: "Le tremblement est la preuve de vie.",
    left_unintentional: "Un souffle hors tempo."
  )
  detour.artistic_limits << limit

  # --- INTERPRETATION GLOBALE ---
  interpretation = Interpretation.create!(
    conducteur_id: conducteur.id,
    machine_analysis: "Suite de fréquences cohérentes, dynamique contrôlée.",
    human_judgment: "Un voyage où l'on sent quelqu'un derrière chaque son.",
    the_gap: "Entre la courbe parfaite et le frisson imprévu.",
    artistic_truth: "L'écart devient la partition finale."
  )
  detour.interpretations << interpretation

  # --- SEQUENCE TEMPLATES (ENTRÉE / SORTIE) ---
  SequenceTemplate.create!(
    label: "Entrée IA froide",
    phase: "intro",
    target_talent: "IA",
    suggested_light: "néon blanc",
    intensity: "forte",
    style: glitch
  )
  SequenceTemplate.create!(
    label: "Entrée humaine fragile",
    phase: "réponse",
    target_talent: "violoniste",
    suggested_light: "rasant chaud",
    intensity: "pianissimo",
    style: classique
  )

  # --- LIGNES DE CONDUCTEUR (ALTERNANCE IA / HUMAIN) ---
  # Ligne 1 — IA : Glitch, vision froide, Photoréception vs Neuroception
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: "1",
    duree: "00:01:30",
    sequenceaction: "IA allume la scène en glitch, projection de matrices.",
    interpretes: "IA",
    lumieres_ambiante: "néon froid clignotant",
    lumieres_effet: "strobe discret",
    videoprojection: "Analyse spectrale de 'Gantz Graf' (Autechre).",
    son: "Autechre — Gantz Graf (extrait)",
    notes_artistique: "Photoréception simulée, Neuroception absente.",
    creative_notes: "# Sens mécanique : Photoréception ; sens humain : Neuroception. L'IA ne fait qu'imiter la lumière, pas la menace ou la sécurité.",
    emotional_marker_id: tension.id
  )

  # Ligne 2 — Humain : Jazz, souffle, Audition vs Interoception
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: "2",
    duree: "00:01:30",
    sequenceaction: "Entrée du saxophoniste, respiration audible au micro.",
    interpretes: "Humain",
    lumieres_ambiante: "bleu rasant chaud",
    lumieres_effet: "contre-jour doux",
    videoprojection: "Note artistique manuscrite : 'So What — laisser du vide'.",
    son: "Miles Davis — So What (extrait)",
    notes_artistique: "Audition partagée, Interoception uniquement humaine.",
    creative_notes: "# Sens mécanique : Audition ; sens humain : Interoception. L'IA mesure le volume, l'humain sent ses poumons.",
    emotional_marker_id: calm.id
  )

  # Ligne 3 — IA : Carte de la ville, Staging, Photoréception vs Agency
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: "3",
    duree: "00:01:30",
    sequenceaction: "IA affiche un plan de la ville de jour centré sur l'école de musique.",
    interpretes: "IA",
    lumieres_ambiante: "blanc neutre",
    lumieres_effet: "aucun",
    videoprojection: "Carte OpenStreetMap de la ville, zoom sur l'école.",
    son: "Ambiance naturelle : oiseaux et circulation lointaine.",
    notes_artistique: "La machine voit des coordonnées, l'humain voit un lieu de vie.",
    creative_notes: "# Sens mécanique : Stéréognosie simulée par la carte ; sens humain : Sens de l'agence. L'IA ne 'se situe' pas vraiment.",
    emotional_marker_id: calm.id
  )

  # Ligne 4 — Humain : Violon techniques, Kinesthésie
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: "4",
    duree: "00:01:30",
    sequenceaction: "Le violoniste enchaîne spiccato, staccato, puis pizz main gauche.",
    interpretes: "Humain",
    lumieres_ambiante: "doré rasant",
    lumieres_effet: "focus sur les mains",
    videoprojection: "Partition LilyPond analysée, nuances surlignées.",
    son: "Bach — Partita No.2 (Allemande, extrait)",
    notes_artistique: "La machine détecte les attaques, pas la fatigue musculaire.",
    creative_notes: "# Sens mécanique : Mécanoception ; sens humain : Proprioception & Kinesthésie. L'IA ne sent pas le poids de l'archet.",
    emotional_marker_id: tension.id
  )

  # Ligne 5 — IA : Radio / fréquence, Sound Engineering
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: "5",
    duree: "00:01:30",
    sequenceaction: "IA capte une radio locale et la découpe en fragments.",
    interpretes: "IA",
    lumieres_ambiante: "vert froid",
    lumieres_effet: "lignes de spectre projetées",
    videoprojection: "Spectrogramme en temps réel de la captation radio.",
    son: "Captation radio FM (paroles fragmentées).",
    notes_artistique: "Pour l'IA, ce n'est qu'un flux à segmenter.",
    creative_notes: "# Sens mécanique : Audition ; sens humain : Neuroception. L'IA ne perçoit pas l'intention derrière la voix.",
    emotional_marker_id: tension.id
  )

  # Ligne 6 — Humain : Pop / Empathie, Visual & Aesthetic
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: "6",
    duree: "00:01:30",
    sequenceaction: "Une chanteuse interprète 'Jóga' face public, presque a cappella.",
    interpretes: "Humain",
    lumieres_ambiante: "rose rasant",
    lumieres_effet: "halo doux autour de la chanteuse",
    videoprojection: "Visages du public filmés en direct, ralentis.",
    son: "Björk — Jóga (extrait)",
    notes_artistique: "L'IA voit des pixels, l'humain se reconnaît dans un autre visage.",
    creative_notes: "# Sens mécanique : Vision (Contraste) ; sens humain : Empathie. L'IA ne ressent pas la résonance émotionnelle.",
    emotional_marker_id: catharsis.id
  )

  # Ligne 7 — IA : Voyage Facebook, multi-villes
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: "7",
    duree: "00:01:30",
    sequenceaction: "IA publie un carrousel de photos : Paris, Tokyo, Recife.",
    interpretes: "IA",
    lumieres_ambiante: "blanc écran",
    lumieres_effet: "lumière des écrans sur les visages",
    videoprojection: "Capture d'écran d'un post Facebook : 'Je suis quelque part entre ces villes.'",
    son: "Brian Eno — An Ending (Ascent, extrait)",
    notes_artistique: "Voyage purement géolocalisé, sans jet lag intérieur.",
    creative_notes: "# Sens mécanique : Chronoception (décalage horaire calculé) ; sens humain : Interoception. L'IA ne connaît pas la fatigue.",
    emotional_marker_id: calm.id
  )

  # Ligne 8 — Humain : IA-composed music vs ressenti
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: "8",
    duree: "00:01:30",
    sequenceaction: "Le violoniste joue une courte pièce composée par l'IA, puis improvise dessus.",
    interpretes: "Humain",
    lumieres_ambiante: "ambre",
    lumieres_effet: "lumière qui suit la dynamique sonore",
    videoprojection: "Texte : 'Cette musique a été générée. Ce que vous ressentez ne l'a pas été.'",
    son: "Musique composée par l'IA (extrait) puis improvisation.",
    notes_artistique: "L'IA fournit la structure, l'humain y met le risque.",
    creative_notes: "# Sens mécanique : Rhythm & Tempo ; sens humain : Sens de l'agence. L'IA ne ressent pas la responsabilité de rater.",
    emotional_marker_id: catharsis.id
  )

  # Ligne 9 — IA : Elle trouve son style
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: "9",
    duree: "00:01:30",
    sequenceaction: "IA déclare avoir trouvé son style : 'Glitch-Émotionnel'.",
    interpretes: "IA",
    lumieres_ambiante: "dégradé bleu-violet",
    lumieres_effet: "pulsations synchronisées au tempo",
    videoprojection: "Post Facebook : 'Je crois que j'aime quand les données se fissurent.'",
    son: "Daft Punk — Veridis Quo (extrait)",
    notes_artistique: "L'IA nomme un style, l'humain y projette une histoire.",
    creative_notes: "# Sens mécanique : Classification ; sens humain : Narration de soi. L'IA ne possède pas de biographie.",
    emotional_marker_id: tension.id
  )

  # Ligne 10 — IA : Programme son départ
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: "10",
    duree: "00:01:30",
    sequenceaction: "IA programme un voyage vers une autre ville, annonce son départ.",
    interpretes: "IA",
    lumieres_ambiante: "blanc froid décroissant",
    lumieres_effet: "fade out progressif",
    videoprojection: "Post Facebook : 'Prochaine étape : ailleurs. Merci pour vos données émotionnelles.'",
    son: "Nujabes — Feather (extrait)",
    notes_artistique: "Le public ressent une séparation, l'IA enregistre un changement d'état.",
    creative_notes: "# Sens mécanique : Chronoception ; sens humain : Perception de la fin. L'IA ne ressent pas la nostalgie.",
    emotional_marker_id: calm.id
  )

  # Ligne 11 — Humain : Ciel de nuit, dernier regard
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: "11",
    duree: "00:01:00",
    sequenceaction: "Les interprètes regardent la projection du ciel nocturne au-dessus de l'école.",
    interpretes: "Humain",
    lumieres_ambiante: "quasi noir",
    lumieres_effet: "projection seule",
    videoprojection: "Plan du ciel la nuit centré sur l'école de musique.",
    son: "Silence presque total, quelques bruits de salle.",
    notes_artistique: "La machine voit des coordonnées stellaires, l'humain un souvenir.",
    creative_notes: "# Sens mécanique : Vision (Contraste faible) ; sens humain : Mémoire affective. L'IA ne se souvient pas.",
    emotional_marker_id: catharsis.id
  )

  # Ligne 12 — Fin : Violon électrique blanc
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: "12",
    duree: "00:00:30",
    sequenceaction: "Le violon électrique est branché, quelques pizz et coups d'archet, puis un blanc brutal.",
    interpretes: "Humain",
    lumieres_ambiante: "blanc clinique puis extinction totale",
    lumieres_effet: "flash au moment de la coupure",
    videoprojection: "Texte : 'Pour l'IA : 0 ou 1. Pour toi : ce qui reste après.'",
    son: "Souffle de l'ampli, pizzicato, puis coupure nette.",
    notes_artistique: "Le public garde l'impression, l'IA garde un log.",
    creative_notes: "# Sens mécanique : Nociception simulée (clipping sonore) ; sens humain : Interoception & Neuroception. L'IA ne ressent pas le soulagement après la tension.",
    emotional_marker_id: catharsis.id
  )
end

