# Initialisation du contexte Créatif
creative_detour = CreativeDetour.find(85)

# --- 1. COEUR THÉMATIQUE (Style & Thèmes) ---
style_cyber = Style.create!(name: "Mélancolie Numérique")
theme_dualite = StageTheme.create!(name: "L'Âme vs Le Processeur")

ambiance_froide = AmbianceOption.create!(style: style_cyber, category: "lumieres", value: "Bleu Binaire #0000FF")
ambiance_vibration = AmbianceOption.create!(style: style_cyber, category: "lumieres", value: "Frisson organique basse fréquence")

# --- 2. LOGISTIQUE & SCÈNE (Fiche & Matériel) ---
fiche = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique",
  eleve_responsable: "Projet Violon sans Âme",
  date: Date.today,
  notes_complementaires: "L'écart entre le calcul et le souffle est notre seule présence."
)

zone_violon = Zone.create!(name: "Cercle d'Exécution", y_min: 20, y_max: 80)
violon_elec = Materiel.create!(
  name: "Violon Électrique (Corps de bois, Cœur de cuivre)",
  category: "Instrument",
  x_pref: 50,
  spread: 10,
  zone: zone_violon,
  maximum: 1
)

plan_dessin = PlanDeSceneDessin.create!(
  fiche_technique: fiche,
  materiel_musicien: violon_elec.name,
  coord_x: 50,
  coord_y: 50,
  layer: zone_violon.name
)

# --- 3. LE CONDUCTEUR (Le Récit de 20 Minutes) ---
conducteur = Conducteur.create!(
  fiche_technique_id: fiche.id,
  title: "Le Silence entre deux Notes",
  username: "Algorithme_Auteur",
  tempo_range: "60-120 BPM",
  notes: "Transition du temps métronomique au temps ressenti."
)

# --- 4. MARQUEURS & ANALYSE ---
marker_solitude = EmotionalMarker.create!(name: "Solitude Algorithmique")
marker_bug = EmotionalMarker.create!(name: "L'Erreur Divine")

interp_analyse = Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Fréquence 440Hz stable. Silence détecté comme 0.00dB.",
  human_judgment: "Une mélancolie profonde émane de la vibration du bois.",
  the_gap: "L'IA ne décode pas le poids de l'attente entre les notes.",
  artistic_truth: "L'âme réside dans l'imperfection du vibrato."
)

gap_doc = ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "Temps métronomique : 00:01:00 exact.",
  response: "L'interprète retient son archet pendant 1.2 seconde de trop.",
  interpretation: "Ce retard est l'expression de la peur du vide, invisible pour l'IA."
)

# --- 5. GÉNÉRATION DES LIGNES (Narration de 20 min) ---

# Séquence 1 : L'IA "Imite" (0-5 min)
5.times do |i|
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: i + 1,
    duree: "00:01:00",
    sequenceaction: "Imitation binaire d'un style : #{['Classique', 'Jazz', 'Punk', 'Folk', 'Ambient'].sample}",
    son: "Violon.exe - Échantillon sans grain",
    lumieres_ambiante: "Froid néon (Code)",
    notes_artistique: "Sens : Chronoception métronomique. L'IA suit le clic, l'humain subit le temps."
  )
end

# Séquence 2 : ZOOM ANALYSE MUSICALE (LilyPond) (5-7 min)
# On simule ici l'analyse granulaire d'un morceau de 2 minutes
[10, 20, 15, 15, 30, 30].each_with_index do |sec, i|
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: 6 + i,
    duree: "00:00:#{sec}",
    sequenceaction: "Zoom Analyse LilyPond : Mesure #{34 + i} - Altérations détectées",
    videoprojection: "Code source défilant : #{['bes16', 'fis8', 'c4'].sample}",
    notes_artistique: "Sens : Photoréception des données. L'IA commente la partition pendant que l'humain lutte avec le bois.",
    notes_technicien: "Effet stroboscopique synchronisé sur les micro-nuances de l'analyse."
  )
end

# Séquence 3 : L'Ascension vers le Bug (7-19 min)
12.times do |i|
  Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: 12 + i,
    duree: "00:01:00",
    sequenceaction: "Tentative de fusion : #{['Vaporwave', 'Math-Rock', 'Drone'].sample}",
    son: "Bruit blanc filtré par le bois du violon",
    lumieres_ambiante: "Vibration faible ambre (Âme)",
    notes_artistique: "Sens : Neuroception. La machine commence à saturer devant l'émotion humaine."
  )
end

# Séquence finale : Le Bug et le Silence (19-20 min)
Conducteurline.create!(
    conducteur_id: conducteur.id,
    ordre: 24,
    duree: "00:01:00",
    sequenceaction: "CRASH SYSTÈME : Le violon seul dans le noir",
    son: "Silence absolu (Database Usage : Silence)",
    lumieres_ambiante: "Noir (Database Usage : Noir)",
    notes_artistique: "L'écart final. La scène est laissée telle quelle, seule la résonance du bois prouve que nous étions là."
)

# --- 6. RÉFLEXIONS ARTISTIQUES (Limits, Processes, Notes) ---

ArtisticNote.create!(
  title: "Ce que SQL ne peut stocker",
  content: "Le frisson épidermique n'est pas une colonne indexable. La base de données est un désert de chiffres qui attend la pluie du ressenti."
)

ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Capturer l'intelligence artistique via des capteurs piézo.",
  doubts_questions: "L'IA peut-elle comprendre pourquoi une note fausse nous fait pleurer ?",
  breakthrough: "Le bug de la mesure 34 a généré une distorsion qui sonnait comme un cri humain.",
  final_form: "Un spectacle de 20 minutes où la machine finit par s'éteindre par respect."
)

ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Coder l'empathie.",
  why_untranslatable: "L'empathie demande un corps pour ressentir la douleur d'un autre corps.",
  contradiction: "Un processeur ne peut pas surchauffer de tristesse.",
  emotional_truth: "La vérité est dans le silence entre les lignes de code."
)

template_seq = SequenceTemplate.create!(
  style_id: style_cyber.id,
  label: "Explosion de Sens",
  phase: "body",
  target_talent: "Musicien",
  suggested_light: "Ambre"
)

suggestion = ThemeSuggestion.create!(
  category: "Philosophie Digitale",
  title: "L'Obsolescence du Sentiment",
  description: "L'IA imite la conversation, mais elle n'a personne à qui parler."
)

resource = InspirationResource.create!(
  title: "Manifeste de l'Art Robotique",
  url: "https://art-intelligence.org",
  category: "Performance Art"
)

# --- 7. LIAISONS HABTM (RELATIONS AVEC CREATIVE DETOUR 85) ---

creative_detour.directive_artistiques << DirectiveArtistique.create!(name: "Directive du Silence", stage_theme: theme_dualite)
creative_detour.artistic_notes << ArtisticNote.last
creative_detour.artistic_processes << ArtisticProcess.last
creative_detour.artistic_limits << ArtisticLimit.last
creative_detour.stage_themes << theme_dualite
creative_detour.ambiance_options << ambiance_froide
creative_detour.styles << style_cyber
creative_detour.sequence_templates << template_seq
creative_detour.inspiration_resources << resource
creative_detour.emotional_markers << marker_solitude
creative_detour.theme_suggestions << suggestion
creative_detour.conducteurs << conducteur
creative_detour.fiche_techniques << fiche
creative_detour.materiels << violon_elec
creative_detour.zones << zone_violon
creative_detour.plan_de_scene_dessins << plan_dessin
creative_detour.interpretations << interp_analyse

puts "Séquence d'incubation terminée. 17 associations créées pour le détour 85."
