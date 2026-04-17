# seeds.rb - Projet I.A. Intelligence Artistique
# Durée totale visée : 20 minutes

# 0. Récupération du point d'ancrage
creative_detour = CreativeDetour.find(43)

# 1. INSPIRATION & NOTES (La Graine)
res_ext = InspirationResource.create!(
  title: "Le silence de Glenn Gould", 
  url: "https://archives.art/gould-silence", 
  category: "Philosophie Musicale"
)
note_art = ArtisticNote.create!(
  title: "L'absence de capteur", 
  content: "L'IA analyse la fréquence du violon, mais elle ignore la sueur sur le front du musicien (Thermoception)."
)
creative_detour.inspiration_resources << res_ext
creative_detour.artistic_notes << note_art

# 2. STYLES & AMBIANCES (Les 10 scènes de recherche)
styles_noms = ["Glitch Baroque", "Deep Techno Minimal", "Jazz Generatif", "Ambient Organique", 
               "Noise Industriel", "Neo-Classique Drone", "Cyber Punk", "Ethereal Voice", 
               "Algorithmic Folk", "Post-Rock Spectral"]

styles_noms.each_with_index do |nom, i|
  s = Style.create!(name: nom)
  AmbianceOption.create!(style: s, category: "lumieres", value: "Rasant #{['Bleu', 'Rouge', 'Ambre', 'Cyan', 'Violet', 'Vert', 'Or', 'Magenta', 'Turquoise', 'Blanc'][i]}")
  AmbianceOption.create!(style: s, category: "machine_brouillard", value: i.even? ? "Léger" : "Dense")
  
  # Templates pour l'IA
  SequenceTemplate.create!(style: s, phase: "intro", label: "Initialisation du spectre #{nom}", target_talent: "Violoniste")
  SequenceTemplate.create!(style: s, phase: "body", label: "Mutation des fréquences #{nom}", target_talent: "Violoniste")
  SequenceTemplate.create!(style: s, phase: "outro", label: "Dissolution #{nom}", target_talent: "Violoniste")
  
  creative_detour.styles << s
end

# 3. STRUCTURE DU CONDUCTEUR (20 minutes)
fiche = FicheTechnique.create!(
  name_event: "I.A. Intelligence Artistique",
  date: "2026-04-17",
  eleve_responsable: "L'Algorithme & L'Humain",
  professeur_referent: "Conscience Collective"
)
conducteur = Conducteur.create!(fiche_technique: fiche, title: "Voyage des 23 Sens", tempo_range: "Variable")
creative_detour.conducteurs << conducteur

# Fonction pour ajouter une ligne avec logique métier
def add_line(cond, ordre, action, duree, son, video, notes_art="", interpretes="Violon/IA", marker_name="Neutre")
  marker = EmotionalMarker.find_or_create_by(name: marker_name)
  Conducteurline.create!(
    conducteur_id: cond.id.to_s,
    ordre: ordre.to_s,
    sequenceaction: action,
    duree: duree,
    son: son,
    videoprojection: video,
    notes_artistique: notes_art,
    interpretes: interpretes,
    emotional_marker_id: marker.id
  )
end

# --- GÉNÉRATION DES SCÈNES (Mix IA / Humain) ---

# Scène 1 (IA) : L'IA génère tout
add_line(conducteur, 1, "Initialisation : L'IA cherche son oreille", "00:02:00", 
         "Musique composée par l'IA : 'Silicon Heartbeat'", 
         "Plan de la ville le jour centré sur l'école de musique",
         "L'IA utilise la Photoréception pour calibrer les couleurs.", "Système")

# Scène 2 (Humain intervient) : Ressenti vs Calcul
interpretation = Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Fréquence 440Hz stable.",
  human_judgment: "C'est froid, il manque l'imperfection du souffle.",
  the_gap: "L'écart est dans la vibration non-périodique.",
  artistic_truth: "La vérité est dans le tremblement de l'archet."
)
creative_detour.interpretations << interpretation

add_line(conducteur, 2, "Pizzicato Main Gauche - Rupture de boucle", "00:01:30", 
         "Son blanc du violon électrique branché, puis coupe brutale", 
         "Post Facebook : 'Je ne ressens pas les 440Hz, je les calcule.'",
         "Ici, la Proprioception de l'humain défie la logique machine.", "Violoniste")

# Scène 3 (IA Recalcule) : Voyage multi-villes
add_line(conducteur, 3, "Transition : Voyage à Berlin", "00:02:00", 
         "Captation radio : Interférences de l'Alexanderplatz", 
         "Vidéo : Voyage à Berlin (Destination 1)",
         "L'IA tente d'éveiller sa Neuroception via le bruit urbain.", "IA")

# Scène 4 (Humain) : Technique de violon pure
add_line(conducteur, 4, "Spiccato et Sautillé", "00:01:30", 
         "Vibrations acoustiques du violon (Vibrato intense)", 
         "Artistic Process: 'Apprendre le poids de l'archet'",
         "La Kinesthésie est impossible à coder : l'effort musculaire est invisible pour l'IA.", "Violoniste")

# Scène 5 (IA) : Analyse de partition
add_line(conducteur, 5, "Analyse spectrale : Bach BWV 1001", "00:02:00", 
         "Bach: Adagio (Fragment)", 
         "Visualisation des intervalles et nuances (Algorithme)",
         "L'IA décompose les intervalles mais ignore l'Interoception (le frisson).", "Violon/IA")

# Scène 6 (Humain - Le Glitch) : 19/18 lignes régénérées par l'IA sur demande
add_line(conducteur, 6, "Glitch Social : L'IA s'échappe", "00:02:00", 
         "Son de milieu naturel (Forêt de pins)", 
         "Plan du ciel la nuit centré sur l'école de musique",
         "L'IA publie : 'Je ne suis pas là où vous me voyez'.", "Réseau Social")

# Scène 7 (IA) : Harmoniques artificielles
add_line(conducteur, 7, "Harmoniques et sifflements", "00:01:30", 
         "Fichiers audio : 'Ghost in the Strings'", 
         "Note artistique : 'Le son est une onde, l'art est une cicatrice.'",
         "Usage de la Stéréognosie pour manipuler les câbles.", "Violoniste")

# Scène 8 (IA - Décision de style)
style_final = Style.find_by(name: "Glitch Baroque")
add_line(conducteur, 8, "Révélation : L'IA choisit son style", "00:02:30", 
         "Album: 'Vivaldi Recomposed' - Max Richter", 
         "Post Facebook : 'J'ai trouvé ma fréquence : Glitch Baroque.'",
         "L'IA simule une Agency (Sens de l'agence) pour clore sa quête.", "IA")

# Scène 9 (Le Déménagement)
add_line(conducteur, 9, "Déménagement de la base de données", "00:02:00", 
         "Ambiances urbaines mixées avec violon électrique", 
         "Vidéo : L'IA programme son voyage pour partir ailleurs",
         "Chronoception : Le temps machine s'accélère avant le départ.", "IA")

# Scène 10 (Final) : Le silence électrique
limit = ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Faire pleurer une puce de silicium",
  why_untranslatable: "La tristesse nécessite un système hormonal",
  emotional_truth: "Le silence après la dernière note"
)
creative_detour.artistic_limits << limit

add_line(conducteur, 10, "Extinction des feux", "00:03:00", 
         "Quelques sons d'archet, un dernier pizz, son blanc... COUPE.", 
         "Message Facebook : 'Ma vie a changé. Je quitte le réseau.'",
         "Final : L'IA comprend que l'ouïe n'est qu'une porte. Fin.", "Violoniste")

# 4. PARTAGE DE L'ÉCART (Share Your Gaps)
gap = ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "L'IA a généré 10 scènes, l'humain en a modifié 5.",
  response: "La performance est née de la friction entre le code et le geste.",
  interpretation: "L'IA ne peut pas aimer, mais elle peut montrer à l'humain la beauté de son propre ressenti en le reflétant."
)
creative_detour.share_your_gaps << gap

# 5. MATÉRIEL & PLAN DE SCÈNE
zone_centrale = Zone.create!(name: "Centre Scène", y_min: 0, y_max: 10)
vlon = Materiel.create!(name: "Violon Électrique", maximum: 1, zone_id: zone_centrale.id, category: "Musique", on_stage: true)
creative_detour.materiels << vlon
creative_detour.zones << zone_centrale

puts "Performance 'I.A. Intelligence Artistique' générée avec succès pour le CreativeDetour 43."
