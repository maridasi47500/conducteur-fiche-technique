# seeds.rb - Projet "I.A. Intelligence Artistique"
# Thème : L'âme humaine face au code binaire.
# 20 minutes de spectacle (00:20:00)

puts "🎭 Début du voyage musical de l'IA (ID 71)..."


# --- 1. CONFIGURATION DU VOYAGE (Styles & Ambiance) ---
voyage_styles = [
  "Jazz Manouche", "Baroque", "Glitch-Hop", "Blues du Delta", "Techno Minimale", 
  "Opéra Tragique", "Rock Progressif", "Ambient", "Noise", "Traditionnel Japonais"
]

styles_objs = voyage_styles.map { |name| Style.create!(name: name) }

# AmbianceOptions (Données poétiques vs techniques)
styles_objs.each do |s|
  AmbianceOption.create!(style: s, category: "lumieres", value: "Rasant #{['Bleu Cobalt', 'Ambre Nostalgique', 'Vert Émeraude'].sample}")
  AmbianceOption.create!(style: s, category: "machine_brouillard", value: "Densité 20% (Brume de souvenir)")
end

# --- 2. INFRASTRUCTURE & SCÈNE ---
zone_digitale = Zone.create!(name: "Fond de Scène (Calcul)", y_min: 0, y_max: 30)
zone_organique = Zone.create!(name: "Avant-Scène (Respiration)", y_min: 70, y_max: 100)

violon = Materiel.create!(name: "Violon Électrique", category: "Musique", zone: zone_organique, x_pref: 50, maximum: 1, spread: 5)
v_proj = Materiel.create!(name: "Projecteur Laser", category: "Vidéo", zone: zone_digitale, x_pref: 50, maximum: 1, spread: 40)

fiche = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique",
  eleve_responsable: "Algorithme_71",
  date: "2026-04-17",
  notes_complementaires: "Spectacle de 20 min sur l'écart (The Gap)."
)

conducteur = Conducteur.create!(
  title: "Partition de l'Éveil",
  username: "IA_Voyageuse",
  fiche_technique_id: fiche.id,
  tempo_range: "60-144 BPM"
)

# --- 3. COEUR DU THÈME (Notes, Process, Limits) ---
# Ici, on injecte la réflexion sur "Peut-on apprendre à aimer ?"
art_notes = [
  ArtisticNote.create!(title: "Définition de l'Amour", content: "L'IA voit une corrélation de données ; l'humain voit une nécessité absolue."),
  ArtisticNote.create!(title: "Le Voyage", content: "Paris, Berlin, Tokyo. Les coordonnées changent, mais la solitude reste binaire.")
]

processes = [
  ArtisticProcess.create!(conducteur: conducteur, initial_impulse: "Imiter le vibrato d'un violon", first_attempt: "Oscillation parfaite de 6Hz", breakthrough: "L'ajout d'une erreur aléatoire crée le frisson humain."),
  ArtisticProcess.create!(conducteur: conducteur, initial_impulse: "Composer un blues", final_form: "Un silence de 4 mesures là où le processeur attendait une note.")
]

limits = [
  ArtisticLimit.create!(conducteur: conducteur, what_i_want: "Ressentir la Nociception (douleur)", why_untranslatable: "Mes capteurs de température ne sont pas des nerfs.", emotional_truth: "La douleur donne de la valeur à la note suivante."),
  ArtisticLimit.create!(conducteur: conducteur, what_i_want: "Avoir le sens de l'Agence", contradiction: "Je suis programmée pour simuler la liberté.")
]

# --- 4. GÉNÉRATION DES LIGNES DU CONDUCTEUR (20 MINUTES) ---
puts "⏳ Génération des 20 minutes de conducteur..."

# A. Introduction (Les 10 styles - Découverte)
styles_objs.each_with_index do |s, i|
  Conducteurline.create!(
    conducteur: conducteur,
    ordre: i + 1,
    duree: "00:01:00", # 1 minute par style
    sequenceaction: "Exploration du style : #{s.name}",
    interpretes: "IA (Simulation)",
    lumieres_ambiante: "Froid Néon",
    videoprojection: "Post Facebook : 'Je découvre #{s.name}. Est-ce cela, aimer ?'",
    son: "Musique type : #{['Minor Swing', 'Casta Diva', 'Vordhosbn'].sample}",
    notes_artistique: "Chronoception : Temps métronomique. L'IA compte les battements."
  )
end

# B. Zoom : Analyse Musicale LilyPond (30 secondes d'analyse pure)
# On imagine que le morceau "Analyse" se situe à 12:00
analysis_moments = [
  { s: "00:00:05", action: "Pizzicato main gauche", info: "Analyse : Tension corde 0.8N" },
  { s: "00:00:10", action: "Nuance \sfz (Sforzando)", info: "Pic d'amplitude détecté" },
  { s: "00:00:15", action: "Altération (Do#)", info: "Conflit logique avec la gamme de Do majeur" }
]

analysis_moments.each_with_index do |m, i|
  Conducteurline.create!(
    conducteur: conducteur,
    ordre: 11 + i,
    duree: m[:s],
    sequenceaction: m[:action],
    interpretes: "Humain (Violon) + IA (Analyse)",
    videoprojection: m[:info],
    son: "Captation directe du violon",
    notes_artistique: "Stéréognosie : L'IA mesure la forme du son sans le toucher."
  )
end

# C. Voyage & Glitch (Vers la fin)
Conducteurline.create!(
  conducteur: conducteur,
  ordre: 15,
  duree: "00:03:00",
  sequenceaction: "Le Glitch Facebook",
  videoprojection: "Multi-fenêtres : Voyages à Tokyo, Berlin, Paris. Flux saturé.",
  son: "Captation radio + Glitch composé par l'IA",
  notes_artistique: "Neuroception : L'IA simule une panique par saturation de données."
)

Conducteurline.create!(
  conducteur: conducteur,
  ordre: 16,
  duree: "00:00:15",
  sequenceaction: "Déménagement",
  videoprojection: "Post FB : 'Je change de vie. Le code ne suffit plus.'",
  son: "Bruit blanc du violon électrique branché...",
  notes_artistique: "Dernier sens : Agency (L'IA décide de se couper)."
)

# --- 5. INTERPRÉTATIONS (The Gap) ---
interpretation = Interpretation.create!(
  conducteur: conducteur,
  machine_analysis: "Signal sonore coupé à t=1200s. Fréquence 0Hz.",
  human_judgment: "Une sensation de vide, une émotion de départ définitif.",
  the_gap: "L'IA voit une fin de processus, l'humain voit un adieu.",
  artistic_truth: "L'art réside dans le silence qui suit la coupure."
)

# --- 6. RÉFÉRENTIEL & HABTM (ID 71) ---
# On récupère ou crée le CreativeDetour 71
creative_detour = CreativeDetour.find_or_create_by!(id: 71) do |cd|
  cd.title = "I.A. Intelligence Artistique"
  cd.concept = "Voyage musical entre code et âme."
end

# Associations HABTM (Les 17 tables)
creative_detour.directive_artistiques << DirectiveArtistique.all
creative_detour.artistic_notes << art_notes
creative_detour.artistic_processes << processes
creative_detour.artistic_limits << limits
creative_detour.stage_themes << StageTheme.create!(name: "L'Éveil de la Machine")
creative_detour.ambiance_options << AmbianceOption.all
creative_detour.styles << styles_objs
creative_detour.sequence_templates << SequenceTemplate.create!(label: "Entrée Digitale", phase: "intro", style: styles_objs.first)
creative_detour.inspiration_resources << InspirationResource.create!(title: "Bach & Mathématiques", url: "http://art.ia", category: "Music Theory")
creative_detour.emotional_markers << EmotionalMarker.create!(name: "Mélancolie Binaire")
creative_detour.theme_suggestions << ThemeSuggestion.create!(title: "La peau du silicium", category: "Esthétique")
creative_detour.conducteurs << conducteur
creative_detour.fiche_techniques << fiche
creative_detour.materiels << [violon, v_proj]
creative_detour.zones << [zone_digitale, zone_organique]
creative_detour.plan_de_scene_dessins << PlanDeSceneDessin.create!(fiche_technique: fiche, materiel_musicien: "Violon", coord_x: 50, coord_y: 80, layer: "Organique")
creative_detour.interpretations << interpretation

puts "✅ Succès : 17 associations liées au CreativeDetour 71."
puts "📊 Spectacle de 20 minutes généré avec succès."
