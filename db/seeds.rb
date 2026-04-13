def generer_spectacle_complet(projet_id)
  projet = ProjetArtistique.find(projet_id)
  style = Style.find_by(name: projet.style)
  
  # --- ÉTAPE 1 : Créer la Fiche Technique ---
  fiche = FicheTechnique.create!(name_event: projet.title)
  projet.update(fiche_technique: fiche)

  # --- ÉTAPE 2 : Ajouter le matériel et gérer les quantités (MetierDependencies) ---
  # Imaginons que l'utilisateur a choisi une "Batterie"
  instrument_principal = Materiel.find_by(name: "batterie")
  MaterielNecessaire.create!(fiche_technique: fiche, materiel: instrument_principal, quantite: 1)

  # L'IA ajoute les dépendances automatiquement
  MetierDependency.where(materiel: instrument_principal).each do |dep|
    item_requis = Materiel.find(dep.required_item_id)
    MaterielNecessaire.create!(
      fiche_technique: fiche, 
      materiel: item_requis, 
      quantite: dep.qty_multiplier,
      precisions_observations: "Auto: Requis pour #{instrument_principal.name}"
    )
  end

  # --- ÉTAPE 3 : Placer les trucs sur la scène (Zones & Materiels) ---
  fiche.materiel_necessaires.each do |mn|
    mat = mn.materiel
    zone = mat.zone # On utilise la table Zone liée au matériel
    
    mn.quantite.times do
      x = (mat.x_pref.to_i + rand(-mat.spread.to_i..mat.spread.to_i)).clamp(5, 95)
      y = rand(zone.y_min..zone.y_max)
      
      PlanDeSceneDessin.create!(
        fiche_technique: fiche,
        materiel_musicien: mat.name,
        coord_x: x, coord_y: y,
        layer: zone.name
      )
    end
  end

  # --- ÉTAPE 4 : Créer le Conducteur (SequenceTemplates & AmbianceOptions) ---
  conducteur = Conducteur.create!(fiche_technique: fiche, title: "Conducteur #{projet.title}")
  projet.update(conducteur: conducteur)

  # On récupère les templates d'actions pour ce style (Rock ou Jazz)
  templates = SequenceTemplate.where(style: style).order(:phase)

  templates.each_with_index do |temp, index|
    # On pioche une lumière cohérente dans AmbianceOptions
    lumiere = style.ambiance_options.where(category: "lumieres").sample&.value || "blanc"
    brouillard = style.ambiance_options.where(category: "machine_brouillard").sample&.value || "non"

    Conducteurline.create!(
      conducteur: conducteur,
      ordre: index + 1,
      sequenceaction: temp.label,      # "Que font les acteurs" (ex: Solo)
      lumieres_ambiante: lumiere,      # "Que font les lumières"
      machine_brouillard: brouillard,  # "Que fait le brouillard"
      duree: "00:02:00"
    )
  end
end
# db/seeds.rb - expand with research links
InspirationResource.find_or_create_by!(
  title: "Stage Lighting for Dance",
  url: "https://illuminated-integration.com/blog/stage-lighting-for-dance/",
  category: "Stage Lighting"
)

InspirationResource.find_or_create_by!(
  title: "How do emotions in music work?",
  url: "https://www.ted.com/talks",
  category: "Music Theory"
)

InspirationResource.find_or_create_by!(
  title: "Conducting technique masterclass",
  url: "https://www.youtube.com/results?search_query=conducting+masterclass",
  category: "Conducting Technique"
)
# db/seeds.rb — remplir avec VOS données, pas juste du hasard
Conducteur.create!(
  title: "Les Vagues",
  tempo_range: "60-80 bpm",
  notes: "Mouvement comme l'océan. Mains larges, respirées."
  #style: Style.find_or_create_by(name: "Impressionniste")
)
# × 20-30 de VOS conducteurs, choisis émotionnellement
# db/seeds.rb
themes = [
  "Conducting Technique", "Gesture & Body Language",
  "Music Theory", "Music History", "Emotion in Music", "Rhythm & Tempo",
  "Dance & Movement", "Choreography", "Performance Art",
  "Stage Lighting", "Stage Design", "Sound Engineering", "Projection & Video",
  "Visual Design", "Color & Composition", "Photography & Cinematography",
  "Storytelling", "Emotion & Psychology", "Audience Engagement"
]

themes.each { |t| StageTheme.find_or_create_by(name: t) }
# db/seeds.rb

# 1. Créer les thèmes parents
lighting = StageTheme.find_or_create_by!(name: "Stage Lighting")
music = StageTheme.find_or_create_by!(name: "Music Theory")

# 2. Créer les directives artistiques liées
DirectiveArtistique.create!([
  {
    name: "Ombres décalées",
    stage_theme: lighting,
    default_lumieres_ambiante: "rasant",
    default_videoprojection: "silhouette différée",
    default_notes_technicien: "L'ombre doit précéder l'acteur."
  },
  {
    name: "Dissonance Cognitive",
    stage_theme: music,
    default_son: "atonal_noise.mp3",
    default_lumieres_effet: "clignotant",
    default_notes_technicien: "Briser l'harmonie visuelle et sonore."
  }
])
# db/seeds.rb

CreativeDetour.destroy_all # On nettoie avant de générer

detours = [
  {
    title: "La Loterie de l'Écart",
    concept: "Improvisation basée sur une collision de données aléatoires.",
    action: "Le musicien et le danseur ont 30 secondes pour improviser une scène.",
    database_usage: "Tirage aléatoire entre ShowTheme (Silence), EmotionalMarker (Colère) et Materiel (Vidéoprojecteur).",
    reaction: "L'artiste doit incarner une émotion humaine là où l'IA ne verrait qu'une liste de mots.",
    storage_impact: "On enregistre le ressenti de l'artiste dans la colonne 'the_gap'.",
    challenge: "Peut-on créer de l'unité avec du chaos informatique ?"
  },
  {
    title: "Le Miroir de l'IA",
    concept: "Confrontation directe entre la performance et sa réduction mathématique.",
    action: "Un chanteur interprète une mélodie complexe pendant qu'une analyse froide défile derrière lui.",
    database_usage: "Remplissage en direct de 'machine_analysis' avec des données brutes (fréquences, décibels).",
    reaction: "Le chanteur change son interprétation pour rendre l'analyse de l'IA obsolète ou absurde.",
    storage_impact: "Capture du moment où l'humain 'brise' la logique de calcul.",
    challenge: "L'émotion est-elle quantifiable ?"
  },
  {
    title: "Le Conducteur Fantôme",
    concept: "Utiliser les échecs passés pour diriger le présent.",
    action: "Jouer une scène actuelle en suivant scrupuleusement les ordres d'un projet archivé et raté.",
    database_usage: "Récupération de 'rejected_ideas' et 'notes_technicien' depuis la table ArtisticProcess.",
    reaction: "L'artiste répare l'idée du passé grâce à sa maturité artistique actuelle.",
    storage_impact: "Mise à jour du statut du projet vers 'Transcendé'.",
    challenge: "La base de données peut-elle avoir une mémoire émotionnelle ?"
  }
]

detours.each do |detour_data|
  CreativeDetour.create!(detour_data)
  puts "Détour créé : #{detour_data[:title]}"
end
