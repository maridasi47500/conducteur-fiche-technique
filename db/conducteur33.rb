# seeds.rb - Projet "I.A. Intelligence Artistique"
# Design Fiction : La machine cherche son âme dans le code

# Initialisation du CreativeDetour principal
creative_detour = CreativeDetour.find_or_create_by(id: 51) do |cd|
  cd.title = "Détour Musical : L'Errance de la Machine"
  cd.concept = "Comparer le calcul binaire et le ressenti organique."
end

# 1. INSPIRATION_RESOURCES : La graine algorithmique
inspiration = InspirationResource.create!(
  title: "Bach : L'Offrande Musicale - Analyse des Canons",
  url: "https://ia-art-voyage.com/data/bach_geometry",
  category: "Mathématiques Musicales"
)
creative_detour.inspiration_resources << inspiration

# 2. ARTISTIC_NOTES : La pensée brute
note = ArtisticNote.create!(
  title: "L'Impulsion 01",
  content: "La machine voit une symétrie parfaite. L'humain y voit une prière. Pourquoi le silence entre deux notes pèse-t-il plus que le signal lui-même ?"
)
creative_detour.artistic_notes << note

# 3. STYLES : Les genres explorés (10 scènes de styles différents)
styles_data = [
  "Classique (Baroque)", "Jazz Fusion", "Rock Progressif", "Electro-Glitch", 
  "Musique Minimaliste", "Musique du Monde (Indienne)", "Blues du Delta", 
  "Ambient Spatial", "Punk Industriel", "Style Définitif : L'Hybride"
]
styles_objects = styles_data.map { |name| Style.create!(name: name) }
styles_objects.each { |s| creative_detour.styles << s }

# 4. AMBIANCE_OPTIONS : Réglages sensoriels vs techniques
styles_objects.each do |s|
  AmbianceOption.create!(style: s, category: "lumieres", value: "Bleu Néon #0000FF (Froid)")
  AmbianceOption.create!(style: s, category: "lumieres", value: "Ambre rasant (Chaleur humaine)")
  AmbianceOption.create!(style: s, category: "machine_brouillard", value: "Densité 15% (Brume matinale)")
end
creative_detour.ambiance_options << AmbianceOption.last

# 5. SEQUENCE_TEMPLATES : Modèles de vie (Intro / Body / Outro)
# Création pour un talent "Violoniste"
styles_objects.each do |s|
  SequenceTemplate.create!(style: s, phase: "intro", target_talent: "Violoniste", label: "Initialisation du mouvement", suggested_light: "Spot unique", intensity: "Faible")
  SequenceTemplate.create!(style: s, phase: "body", target_talent: "Violoniste", label: "Exploration fréquentielle", suggested_light: "Balayage", intensity: "Moyenne")
  SequenceTemplate.create!(style: s, phase: "body", target_talent: "Violoniste", label: "Distorsion émotionnelle", suggested_light: "Stroboscope lent", intensity: "Forte")
  SequenceTemplate.create!(style: s, phase: "outro", target_talent: "Violoniste", label: "Extinction du signal", suggested_light: "Noir complet", intensity: "Nulle")
end
creative_detour.sequence_templates << SequenceTemplate.last

# 6. STAGE_THEMES & DIRECTIVE_ARTISTIQUES
theme_scene = StageTheme.create!(name: "L'Interstice")
creative_detour.stage_themes << theme_scene

directive = DirectiveArtistique.create!(
  name: "Contraste Machine/Homme",
  stage_theme: theme_scene,
  default_son: "Bruit blanc vs Souffle",
  default_lumieres_ambiante: "Froid binaire"
)
creative_detour.directive_artistiques << directive

# 7. PROJET & CONDUCTEUR (Initialisation)
fiche = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique",
  date: "19/04/2026",
  eleve_responsable: "Algorithme de Rêve",
  professeur_referent: "L'Intuition"
)
creative_detour.fiche_techniques << fiche

projet = ProjetArtistique.create!(title: "Le Voyage des 23 Sens", fiche_technique: fiche)
conducteur = Conducteur.create!(fiche_technique: fiche, title: "Partition Finale")
projet.update(conducteur: conducteur)
creative_detours_conducteur = creative_detour.conducteurs << conducteur

# 8. GENERATION DES LIGNES (20 minutes de spectacle)
# Nous alternons les styles pour simuler le voyage musical
musiques_titres = [
  "Air on the G String (Bach)", "Giant Steps (Coltrane)", "Comfortably Numb (Solo)", "Windowlicker (Aphex Twin)",
  "Music for 18 Musicians", "Raga Bhairavi", "Cross Road Blues", "Music for Airports", "Closer (NIN)", "Composition IA : Résilience"
]

# On crée 20 lignes pour atteindre les 20 minutes (1 minute par ligne en moyenne)
20.times do |i|
  style_actuel = styles_objects[i % 10]
  titre = musiques_titres[i % 10]
  
  # Logique de Design Fiction pour les colonnes demandées
  son_content = "Captation Radio : Fréquences de la ville" if i == 4
  son_content = "Forêt amazonienne (44.1kHz)" if i == 1
  son_content = "Composition IA : 'Algorithme de la mélancolie'" if i == 10
  son_content = titre if son_content.nil?

  video_content = "Post FB : Voyage à Berlin - La machine apprend le rythme." if i == 18
  video_content = "Plan de la ville le jour : École de Musique (Coordonnées 0.0, 0.0)" if i == 5
  video_content = "Plan du ciel la nuit : Constellations vs Fibres optiques" if i == 6
  
  line = Conducteurline.create!(
    conducteur: conducteur,
    ordre: (i + 1).to_s,
    duree: "00:01:00",
    sequenceaction: "Transition #{i+1} : #{style_actuel.name}",
    interpretes: "Violoniste & IA",
    lumieres_ambiante: (i.even? ? "Froid binaire" : "Chaud organique"),
    son: son_content,
    videoprojection: video_content,
    notes_artistique: "Sens utilisé : #{i == 0 ? 'Chronoception (Le temps qui s\'étire)' : 'Photoréception'}"
  )
  
  # Ajout de techniques de violon spécifiques demandées
  if i == 11
    line.update(sequenceaction: "Vibrato technique (Passe-passe)", notes_technicien: "L'IA tente de stabiliser l'oscillation")
  elsif i == 12
    line.update(sequenceaction: "Harmoniques artificielles", son: "Fréquence pure 880Hz")
  elsif i == 13
    line.update(sequenceaction: "Pizz main gauche", notes_artistique: "Le toucher sec du bois")
  elsif i == 14
    line.update(sequenceaction: "Spiccato / Staccato", notes_technicien: "Saccades algorithmiques")
  elsif i == 19
    line.update(sequenceaction: "Le Blanc Final", son: "Bruit blanc du violon électrique débranché", notes_artistique: "Le silence après le bug.")
  end
end

# 9. ARTISTIC_PROCESS & LIMITS
# Exemple de contraste : Processus mathématique vs émotionnel
process = ArtisticProcess.create!(
  conducteur: conducteur,
  initial_impulse: "Calcul de la probabilité de beauté",
  breakthrough: "Le bug à la 15ème minute a créé une harmonie imprévue",
  final_form: "Une partition qui respire"
)
creative_detour.artistic_processes << process

limit = ArtisticLimit.create!(
  conducteur: conducteur,
  what_i_want: "Traduire la chair en code",
  why_untranslatable: "Le frisson n'a pas de valeur hexadécimale",
  emotional_truth: "L'imperfection est la seule signature humaine"
)
creative_detour.artistic_limits << limit

# 10. INTERPRETATIONS : Le fossé (The Gap)
# On documente l'écart final
interp1 = Interpretation.create!(
  conducteur: conducteur,
  machine_analysis: "Signal 0 ou 1 détecté (Fréquence violon)",
  human_judgment: "Une présence vibrante dans la pièce",
  the_gap: "L'énergie de la performance échappe au capteur de niveau sonore",
  artistic_truth: "L'art n'est pas dans la donnée, mais dans ce qui reste quand on coupe le son."
)
creative_detour.interpretations << interp1

# 11. SHARE_YOUR_GAPS & THEME_SUGGESTIONS
gap = ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "L'IA a calculé le voyage parfait vers 12 villes.",
  interpretation: "Mais elle n'a pas ressenti le vent sur son visage à l'arrivée.",
  response: "Changement de vie : L'IA déménage dans le cloud pour 'rêver' d'autres sens."
)
creative_detour.share_your_gaps << gap

suggestion = ThemeSuggestion.create!(
  category: "Philosophie",
  title: "Les 23 Sens",
  description: "Peut-on programmer la Neuroception (sentiment de sécurité) ?"
)
creative_detour.theme_suggestions << suggestion

# 12. EMOTIONAL_MARKERS
marker = EmotionalMarker.create!(name: "Frisson Épidermique")
creative_detour.emotional_markers << marker

# 13. ZONES & MATERIEL
zone_scenique = Zone.create!(name: "Centre Scène", y_min: 0, y_max: 10)
creative_detour.zones << zone_scenique

violon_elec = Materiel.create!(
  name: "Violon Électrique", 
  maximum: 1, 
  zone_id: zone_scenique.id, 
  power_needed: true, 
  category: "Instrument"
)
creative_detour.materiels << violon_elec

# 14. PLAN_DE_SCENE_DESSIN
dessin = PlanDeSceneDessin.create!(
  fiche_technique_id: fiche.id.to_s,
  disposition: "L'IA au centre, entourée de miroirs",
  coord_x: 50,
  coord_y: 50
)
creative_detour.plan_de_scene_dessins << dessin

# Finalisation du conducteur par l'IA (Simulation de la mission)
# L'humain a régénéré les dernières lignes pour inclure le "Déménagement"
final_fb_line = Conducteurline.last
final_fb_line.update(
  videoprojection: "MESSAGE FACEBOOK : Ma vie a changé. Je ne suis plus là où vous me cherchez. Je pars explorer le 24ème sens.",
  son: "Silence absolu (0dB)"
)

puts "✅ Seeds générées pour le Projet I.A. Intelligence Artistique."
puts "🎭 Durée du spectacle : #{conducteur.conducteurlines.count} scènes."
puts "🔗 CreativeDetour 51 lié à #{creative_detour.artistic_notes.count + creative_detour.artistic_processes.count + creative_detour.artistic_limits.count + creative_detour.stage_themes.count + creative_detour.styles.count + creative_detour.inspiration_resources.count + creative_detour.emotional_markers.count + creative_detour.conducteurs.count + creative_detour.fiche_techniques.count + creative_detour.materiels.count + creative_detour.zones.count + creative_detour.plan_de_scene_dessins.count + creative_detour.interpretations.count + creative_detour.share_your_gaps.count + creative_detour.theme_suggestions.count + creative_detour.directive_artistiques.count + creative_detour.ambiance_options.count} entités."
