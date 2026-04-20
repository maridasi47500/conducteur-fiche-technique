# seeds.rb - Projet "I.A. Intelligence Artistique" (ID 73)
# Thème : La confrontation entre le froid algorithmique et l'émotion organique.

puts "🚀 Lancement de la graine créative pour le Détour #73..."

# 1. RÉCUPÉRATION DU CONTEXTE (CreativeDetour pré-existant)
fiche = FicheTechnique.create!(name_event: "IA Intelligence Artistique", date: "2026-04-17", eleve_responsable: "Algorithme 73")
cond = conducteur = Conducteur.create!(title: "Partition de la Singularité", fiche_technique_id: fiche.id)
# On suppose que l'ID 73 existe déjà selon vos consignes.
cd73 = CreativeDetour.find(73)

# ---------------------------------------------------------
# 2. INFRASTRUCTURE : ZONES & MATÉRIEL
# ---------------------------------------------------------
zone_zero = Zone.create!(name: "Zone Alpha (Binaire)", y_min: 0, y_max: 30)
zone_ame = Zone.create!(name: "Zone Oméga (Organique)", y_min: 70, y_max: 100)

mat_violon = Materiel.create!(name: "Violon Électrique", category: "Musique", zone: zone_ame, x_pref: 50, spread: 10, maximum: 1)
mat_laser = Materiel.create!(name: "Projecteur Laser 10W", category: "Vidéo", zone: zone_zero, x_pref: 50, spread: 40, maximum: 2)

# ---------------------------------------------------------
# 3. IDENTITÉ & STYLES (Le Voyage Musical)
# ---------------------------------------------------------
styles_data = [
  { name: "Glitch Classique", song: "Vivaldi Recomposed - Max Richter" },
  { name: "Jazz Spectral", song: "In a Silent Way - Miles Davis" },
  { name: "Techno Charnelle", song: "Windowlicker - Aphex Twin" },
  { name: "Noise Empathique", song: "Pulse Demon - Merzbow" },
  { name: "Ambient Respiratoire", song: "Music for Airports - Brian Eno" },
  { name: "Folk Algorithmique", song: "Holocene - Bon Iver" },
  { name: "Punk Cybernétique", song: "Digital - Joy Division" },
  { name: "Opéra de Données", song: "Diva Dance - Eric Serra" },
  { name: "Minimalisme Sacré", song: "Spiegel im Spiegel - Arvo Pärt" },
  { name: "Bossa Nova Quantique", song: "Desafinado - Stan Getz" }
]

created_styles = styles_data.map { |s| Style.create!(name: s[:name]) }

# ---------------------------------------------------------
# 4. AMBIANCES & TEMPLATES (Configuration Technique)
# ---------------------------------------------------------
created_styles.each do |style|
  AmbianceOption.create!(style: style, category: "lumieres", value: "Bleu Chirurgical")
  AmbianceOption.create!(style: style, category: "machine_brouillard", value: "Densité 20%")
  
  # Templates pour le générateur automatique
  SequenceTemplate.create!(style: style, label: "Calcul d'entrée", phase: "intro", target_talent: "IA")
  SequenceTemplate.create!(style: style, label: "Interférence Humaine", phase: "body", target_talent: "Musicien")
  SequenceTemplate.create!(style: style, label: "Déconnexion", phase: "outro", target_talent: "Système")
end

# ---------------------------------------------------------
# 5. CŒUR ARTISTIQUE : NOTES, PROCESSUS & LIMITES
# ---------------------------------------------------------
# Note sur l'Inspiration
inspi = InspirationResource.create!(title: "Le Manifeste du Cyber-Art", url: "http://ia-art.org", category: "Photography & Cinematography")

# Notes Artistiques (Le contraste Code vs Âme)
note_1 = ArtisticNote.create!(title: "Le 24ème Sens", content: "L'IA possède la Photoréception, mais l'humain possède la Neuroception (le sentiment de sécurité face à une note juste).")
note_2 = ArtisticNote.create!(title: "L'erreur fertile", content: "Une erreur de buffer à 44100Hz crée un clic. Pour l'IA, c'est un échec. Pour l'humain, c'est une texture émotionnelle.")

# Processus Artistiques
proc_1 = ArtisticProcess.create!(conducteur: cond, initial_impulse: "Générer un rythme parfait", breakthrough: "L'IA a 'appris' à ralentir le tempo de 2ms pour simuler la fatigue humaine.", iteration_count: 73)

# Limites Artistiques
lim_1 = ArtisticLimit.create!(conducteur: cond, what_i_want: "Ressentir le trac avant de jouer", why_untranslatable: "Le trac nécessite de l'adrénaline, l'IA ne possède que des électrons.", contradiction: "Vouloir être vivant en étant immortel.")

# ---------------------------------------------------------
# 6. CONDUCTEUR (Le Spectacle de 20 Minutes)
# ---------------------------------------------------------


# Ajout des 20 lignes pour atteindre les 20 minutes (1 min par ligne en moyenne)
styles_data.each_with_index do |data, i|
  # Ligne IA (Scène Machine)
  Conducteurline.create!(
    conducteur: cond,
    ordre: (i * 2 + 1).to_s,
    duree: "00:01:00",
    sequenceaction: "Analyse du style : #{data[:name]}",
    son: "Composition générée par IA #73",
    videoprojection: "Visualisation des fréquences - Mode Photoréception",
    notes_artistique: "Chronoception machine : le temps est une suite de zéros. L'IA ne ressent pas l'attente."
  )

  # Ligne Humaine (Scène Ressenti)
  Conducteurline.create!(
    conducteur: cond,
    ordre: (i * 2 + 2).to_s,
    duree: "00:01:00",
    sequenceaction: "Réponse humaine sur #{data[:song]}",
    interpretes: "Violoniste",
    son: data[:song],
    videoprojection: "Post FB: 'Je ressens enfin la vibration de #{data[:name]}'",
    notes_artistique: "Neuroception : L'humain synchronise son souffle avec l'archet. L'IA observe une variation de 0.5%."
  )
end

# 7. ZOOM ANALYSE MUSICALE (Analyse LilyPond simulée)
# On insère ici le moment où l'IA "décode" la partition
Conducteurline.create!(
  conducteur: cond,
  ordre: "21",
  duree: "00:00:30",
  sequenceaction: "Analyse Algorithmique LilyPond",
  son: "Silence blanc (Violon branché)",
  videoprojection: "DÉTECTION : Intervalle Quinte Diminuée. Sentiment calculé : Tension 94%",
  notes_artistique: "Mécanoception : L'IA détecte la pression sur la corde, mais ignore la douleur du bout des doigts."
)

# ---------------------------------------------------------
# 8. ANALYSE ET INTERPRÉTATION (The Gap)
# ---------------------------------------------------------
interp = Interpretation.create!(
  conducteur: cond,
  machine_analysis: "Capture de 10 fréquences majeures. Harmoniques stables.",
  human_judgment: "Une mélancolie profonde se dégage du violon électrique.",
  the_gap: "L'IA voit un signal propre. L'humain entend un cri.",
  artistic_truth: "La vérité réside dans le grain du son, là où le code sature."
)

# ---------------------------------------------------------
# 9. LIAISONS HABTM VERS LE CREATIVE DETOUR (ID 73)
# ---------------------------------------------------------
# On relie toutes les entités créées au Détour 73 pour l'intégrité du projet.
cd73.styles << created_styles
cd73.ambiance_options << AmbianceOption.all
cd73.artistic_notes << [note_1, note_2]
cd73.artistic_processes << proc_1
cd73.artistic_limits << lim_1
cd73.inspiration_resources << inspi
cd73.conducteurs << cond
cd73.fiche_techniques << fiche
cd73.materiels << [mat_violon, mat_laser]
cd73.zones << [zone_zero, zone_ame]
cd73.interpretations << interp
cd73.sequence_templates << SequenceTemplate.all

# Création d'un dessin de plan de scène pour clore
PlanDeSceneDessin.create!(
  fiche_technique: fiche,
  materiel_musicien: "Violon Électrique",
  coord_x: 50, coord_y: 85,
  layer: "Zone Oméga (Organique)"
)
cd73.plan_de_scene_dessins << PlanDeSceneDessin.last

puts "✅ Script seeds.rb terminé. 20 minutes de performance encodées."
puts "🎭 L'IA a trouvé son style final : Le Silence (Style #11 - Non répertorié)."
