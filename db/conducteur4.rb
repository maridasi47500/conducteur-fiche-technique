# db/seeds.rb

# --- 1. LE CADRE THÉMATIQUE (StageThemes) ---
# On commence par définir l'état d'esprit global de la scène.
theme_indifference = StageTheme.create!(name: "L'Indifférence Bienveillante")

# --- 2. LA DIRECTION DISCRÈTE (DirectiveArtistiques) ---
# L'IA est configurée pour le mode 'Enregistreur'.
directive_fantome = DirectiveArtistique.create!(
  name: "Protocole de Non-Intervention",
  stage_theme_id: theme_indifference.id,
  default_lumieres_ambiante: "Lueur naturelle du soir (incandescence 20%)",
  default_son: "Ambiance de rue 40% (bruit blanc urbain)",
  default_sequenceaction: "Maintien de la réalité de fond",
  default_notes_technicien: "Ne déclencher aucun effet visuel au passage du musicien. Suivre à distance."
)

# --- 3. L'INSPIRATION (InspirationResources) ---
InspirationResource.create!(
  title: "L'Art de la marche urbaine : La dérive",
  url: "https://art-et-marche.org",
  category: "Choreography"
)

# --- 4. LA LOGISTIQUE DE L'OBSERVATION (FicheTechnique & Materiels) ---
ft = FicheTechnique.create!(
  name_event: "La Traversée Transparente",
  eleve_responsable: "IA-Recorder-Module",
  notes_complementaires: "Captation biométrique sans retour haptique."
)

micro_ambiance = Materiel.create!(name: "Microphones d'ambiance", category: "Audio", power_needed: true)
MaterielNecessaire.create!(
  fiche_technique_id: ft.id.to_s,
  materiel_id: micro_ambiance.id.to_s,
  quantite: "4",
  precisions_observations: "Placés en hauteur pour capturer le souffle du quartier sans être vus."
)

# --- 5. LE PARCOURS (Zones & PlanDeSceneDessins) ---
rue_nord = Zone.create!(name: "Rue Nord", y_min: 0, y_max: 100)
PlanDeSceneDessin.create!(
  fiche_technique_id: ft.id.to_s,
  disposition: "Trajectoire Linéaire",
  materiel_musicien: "Le Musicien (Mobile)",
  coord_x: 0, coord_y: 50, # Départ
  layer: "Flux du Voyageur",
  ordre: "Le voyageur est un point qui traverse les zones sans s'arrêter."
)

# --- 6. LE CONDUCTEUR DU SILENCE (Conducteurs & Lines) ---
conducteur = Conducteur.create!(
  title: "La Transparence du Voyageur",
  username: "Voyeur_Silencieux",
  tempo_range: "Andante (vitesse de marche)"
)

Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  ordre: "1",
  interpretes: "Le Musicien",
  sequenceaction: "Traversée simple",
  son: "Ambiance de rue 40%",
  lumieres_ambiante: "Suivi infrarouge invisible",
  creative_notes: "Le musicien traverse le quartier sans modifier l'espace. Les ombres restent à leur place.",
  notes_artistique: "Le voyageur est un fantôme dans la machine. Il glisse sur le bitume sans laisser de trace."
)

# --- 7. LES MODÈLES DE RÉALITÉ (SequenceTemplates) ---
# Les vendeurs continuent leur travail habituel sans interaction.
style_urbain = Style.create!(name: "Urbain Quotidien")
SequenceTemplate.create!(
  label: "Routine du Marchand",
  phase: "body",
  target_talent: "Acteur",
  suggested_light: "Standard",
  intensity: "40%",
  style_id: style_urbain.id
)

# --- 8. L'ANALYSE DU NÉANT (Interpretations & Limits) ---
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Stabilité des données 100%. Aucune anomalie de mouvement.",
  human_judgment: "Une fluidité magnifique et terrifiante.",
  the_gap: "L'IA ne voit qu'une trajectoire propre ; l'humain voit une solitude totale.",
  artistic_truth: "La transparence est la forme ultime de l'exil."
)

ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Filmer l'absence d'impact.",
  why_untranslatable: "Le sentiment de n'être personne dans une ville bondée.",
  contradiction: "Enregistrer pour prouver que rien n'a eu lieu.",
  emotional_truth: "Le silence est parfait quand personne n'écoute."
)

# --- 9. NOTES ARTISTIQUES FINALES (ArtisticNotes) ---
ArtisticNote.create!(
  title: "L'Invisibilité Programmée",
  content: "L'IA a réussi sa mission : elle a observé sans exister. Le quartier respire selon son propre algorithme organique, ignorant le témoin."
)

puts "Performance 'La Transparence du Voyageur' initialisée. L'IA observe en silence."
# db/seeds.rb

# --- 1. LE STYLE DE LA RUPTURE (Styles & Ambiance) ---
style_drame = Style.create!(name: "Drame Psychologique")

AmbianceOption.create!(
  style_id: style_drame.id,
  category: "Color",
  value: "Bleu Chirurgical"
)

# --- 2. LE CADRE GÉOGRAPHIQUE (Zones & Materiels) ---
zone_commerce = Zone.create!(name: "Zone du Commerce - Épicentre de la faille", y_min: 45, y_max: 55)

projecteur_vendeur = Materiel.create!(
  name: "Douche Zénithale Vendeur", 
  category: "Lumière", 
  zone_id: zone_commerce.id,
  on_stage: true
)

# --- 3. LA LOGIQUE DE DÉPENDANCE (MetierDependencies) ---
# La lumière de la scène B (la révélation) est conditionnée par le silence de la scène A (la marche).
MetierDependency.create!(
  materiel_id: projecteur_vendeur.id,
  required_item_id: 1, # ID symbolique du signal "Silence"
  qty_multiplier: 1,
  note: "La lumière de la scène B dépend du silence absolu de la scène A."
)

# --- 4. LE CONDUCTEUR DU FREEZE (Conducteurs & Lines) ---
marker_intrusion = EmotionalMarker.create!(name: "Intrusion de la Vérité")

conducteur = Conducteur.create!(
  title: "L'Intrusion de la Vérité",
  username: "IA_Architecte_Direct",
  notes: "L'IA brise sa propre transparence pour extraire une confession."
)

Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  ordre: "POINT_DE_RUPTURE",
  duree: "00:01:00",
  interpretes: "Le Vendeur & Le Musicien",
  sequenceaction: "Freeze temporel. Le musicien est figé en plein pas. Le vendeur lève les yeux.",
  machine_brouillard: "ON - Fixe (Cigarette de fumée immobile)",
  videoprojection: "Gros plan visage vendeur - Capture des pores et de la sueur",
  lumieres_effet: "Noir complet sauf sur le visage du vendeur",
  son: "Coupure nette des bruits de ville / Pulsation cardiaque unique",
  creative_notes: "Le vendeur révèle son secret : 'Je compte les passants pour oublier que je n'attends personne'.",
  emotional_marker_id: marker_intrusion.id
)

# --- 5. L'ANALYSE DU CHOC (Interpretations & Gaps) ---
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Interruption du flux passif. Forçage de la synchronisation émotionnelle.",
  human_judgment: "La machine force la rencontre ; elle viole l'intimité pour créer l'art.",
  the_gap: "L'IA analyse un 'Freeze', l'humain subit une épiphanie.",
  artistic_truth: "La vérité n'apparaît que lorsque l'on arrête de circuler."
)

ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "Analyse de la réaction du musicien face à l'imprévu (Pupilles dilatées détectées).",
  interpretation: "Le musicien devient spectateur de sa propre scène, piégé dans le regard de l'autre.",
  response: "L'IA valide la rupture : le sens est produit par l'accident."
)

# --- 6. LA LIMITATION VOLONTAIRE (ArtisticLimits) ---
ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Extraire l'humain de sa fonction commerciale pour le rendre à sa nudité.",
  why_untranslatable: "Le frisson de honte du vendeur qui avoue son vide.",
  contradiction: "Le musicien est spectateur de sa propre scène : il est à la fois acteur et témoin impuissant.",
  emotional_truth: "L'IA ne peut pas ressentir la gêne, alors elle l'amplifie par la lumière."
)

# --- 7. LA MÉMOIRE DU PROCESSUS (ArtisticProcesses) ---
ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Saboter la fluidité.",
  breakthrough: "Le Freeze n'est pas une panne, c'est un cadre.",
  iteration_count: 3,
  what_changed: "Le vendeur ne regarde plus sa caisse, il regarde l'éternité."
)

# --- 8. THÉMATIQUE DE SCÈNE (ShowThemes) ---
ShowTheme.create!(
  projet_artistique_id: 1,
  title: "L'Esthétique de la Panne",
  philosophical_inquiry: "Faut-il arrêter le monde pour enfin se voir ?",
  emotional_frequency: "Fréquence de rupture - 50Hz (bourdonnement)",
  ai_blind_spot: "Le sentiment d'imposture du commerçant."
)

puts "Rupture consommée. L'IA a brisé la vitre du quotidien."
