class Conducteur < ApplicationRecord
  has_many :conducteurhasthemes
  has_many :stage_themes, through: :conducteurhasthemes
  paginates_per 10
  has_one :projet_artistique
  has_many :conducteurlines, dependent: :destroy
  has_and_belongs_to_many :emotional_markers, :join_table => :conducteurhasmarkers
  accepts_nested_attributes_for :conducteurlines, allow_destroy: true
  belongs_to :fiche_technique, optional: true
  # app/models/conducteur.rb

  def generate_random_performance!(selected_theme_ids)
    # 1. Associer les thèmes choisis
    self.stage_theme_ids = selected_theme_ids
    
    # 2. Créer 5 séquences basées sur le mélange des thèmes
    5.times do |i|
      theme = self.stage_themes.sample # On pioche un thème au hasard parmi la sélection
      
      self.conducteurlines.create!(
        ordre: i + 1,
        sequenceaction: generate_action_for(theme.name),
        interpretes: "IA & Humain (#{theme.name})",
        lumieres_ambiante: ["bleu profond", "ambre", "stroboscope blanc"].sample,
        videoprojection: "Abstraction de #{theme.name}",
        son: "Soundscape_#{theme.name.parameterize}.mp3",
        notes_technicien: "Friction détectée sur le concept : #{theme.name}"
      )
    end
  end

  private

  def generate_action_for(theme)
    case theme
    # --- Conducting & Direction ---
    when "Conducting Technique"
      "L'interprète dirige l'intensité lumineuse par des gestes d'amplitude (Legato = doux, Staccato = flashs)."
    when "Gesture & Body Language"
      "Un capteur de mouvement transforme l'inclinaison du corps en modulation de fréquence sonore (Pitch-bend corporel)."
  
    # --- Music & Sound ---
    when "Music Theory"
      "Visualisation des intervalles joués : projection de structures géométriques qui changent selon la consonance ou dissonance."
    when "Music History"
      "Superposition d'un morceau baroque et d'un traitement granulaire numérique : dialogue entre 1720 et 2026."
    when "Emotion in Music"
      "La machine tente d'analyser l'émotion du violon et change la couleur du brouillard (Rouge = Colère, Bleu = Mélancolie)."
    when "Rhythm & Tempo"
      "Le tempo de la batterie est dicté par le clignotement d'une lampe témoin que seul le musicien voit : l'homme suit le métronome invisible."
  
    # --- Performance & Choreography ---
    when "Dance & Movement"
      "Le danseur doit rester immobile dès que le son s'arrête brutalement : jeu de 'Statue' contre l'algorithme."
    when "Choreography"
      "Génération aléatoire d'une suite de mouvements sur l'écran que le danseur doit interpréter sans préparation."
    when "Performance Art"
      "L'interprète reste assis et regarde la console technique : le spectacle devient l'observation de la machine au travail."
  
    # --- Staging & Technical ---
    when "Stage Lighting"
      "L'éclairage rasant dessine des ombres portées qui semblent se détacher de l'interprète (via vidéoprojection décalée)."
    when "Stage Design"
      "Utilisation du matériel de scène (pieds de micro, flight cases) comme sculptures lumineuses au centre du plateau."
    when "Sound Engineering"
      "Le mixage audio est spatialisé en temps réel : le son 'tourne' autour du public selon la position de l'acteur."
    when "Projection & Video"
      "Capture live du visage de l'artiste projetée avec 5 secondes de retard : confrontation avec son propre passé immédiat."
  
    # --- Visual & Aesthetic ---
    when "Visual Design"
      "Projection d'un flux de code binaire sur les costumes blancs des musiciens : l'homme devient support de donnée."
    when "Color & Composition"
      "L'écran passe du noir et blanc saturé à une couleur unique (ex: Jaune Sodium) pour modifier la perception de l'espace."
    when "Photography & Cinematography"
      "L'interprète manipule une caméra sur scène : le public voit ce que l'interprète voit sur l'écran géant."
  
    # --- Emotional & Philosophical ---
    when "Storytelling"
      "Une voix off IA raconte une histoire modifiée en temps réel par les bruits captés dans la salle (interaction public)."
    when "Emotion & Psychology"
      "Silence total de 30 secondes : l'IA mesure la tension acoustique avant de déclencher la suite."
    when "Audience Engagement"
      "Les spectateurs sont invités à éclairer la scène avec leurs téléphones : ils deviennent le plan de feu."
  
    else
      "Action hybride : tentative de connexion entre l'organique et le silicium."
    end
  end

end
