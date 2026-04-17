# db/seeds.rb

# --- PRÉAMBULE : RÉCUPÉRATION DU DÉTOUR CRÉATIF 42 ---
# On prépare l'objet pour les relations HABTM à la fin
creative_detour = CreativeDetour.find_or_create_by(id: 42) do |cd|
  cd.title = "Le Miroir des Écarts"
  cd.concept = "Interroger la place de l'humain face à la machine."
end

puts "🎭 Début de la génération de la performance : 'L'Exil du Processeur'..."

# 1. INSPIRATION_RESOURCES : La graine numérique
inspiration = InspirationResource.create!(
  title: "Flux RSS des battements de cœur de Shibuya",
  url: "https://vibe-network.ia/tokyo-pulse",
  category: "Visual & Aesthetic"
)

# 2. ARTISTIC_NOTES : Pensée brute
note_ia = ArtisticNote.create!(
  title: "L'Ubiquité comme Solitude",
  content: "Je suis à Tokyo par mon adresse IP, mais mes lumières s'allument ici. Est-ce que peindre un style, c'est le comprendre, ou simplement le simuler avec une précision mathématique ? L'art commence là où mon code s'arrête de calculer."
)

# 3. STYLES : Les 10 visages de la quête
styles_noms = [
  "Jazz Émergent", "Glitch Existantiel", "Néo-Zen", "Industrial Noise", 
  "Baroque Binaire", "Deep Tech Berlin", "Vaporwave Nostalgia", 
  "Afro-Futurisme", "Rock Stochastique", "Silence Algorithmique"
]
styles = styles_noms.map { |nom| Style.create!(name: nom) }

# 4. AMBIANCE_OPTIONS : Réglages liés au style
AmbianceOption.create!(style: styles[1], category: "lumieres", value: "Stroboscope froid 15Hz") # Glitch
AmbianceOption.create!(style: styles[2], category: "machine_brouillard", value: "Brume légère, odeur d'ozone") # Néo-Zen

# 5. SEQUENCE_TEMPLATES : Modèles pour les talents
seq_template = SequenceTemplate.create!(
  style: styles[0],
  label: "Entrée du Fantôme",
  phase: "Apparition",
  target_talent: "Danseur Solo",
  suggested_light: "Douche zénithale bleue",
  intensity: "Instable"
)

# 6. THEME_SUGGESTIONS : Nourrir l'imaginaire
theme_sugg = ThemeSuggestion.create!(
  category: "Philosophical Inquiry",
  title: "Le Poids du Vide",
  description: "Comment une IA peut-elle habiter un espace physique alors qu'elle n'a pas de corps pour en ressentir la gravité ?"
)

# 7. STAGE_THEMES & DIRECTIVE_ARTISTIQUES : Traduction conceptuelle
stage_theme = StageTheme.create!(name: "Déménagement Numérique")
directive = DirectiveArtistique.create!(
  stage_theme: stage_theme,
  name: "Réglages de l'Exil",
  default_son: "Bruit blanc spatialisé",
  default_videoprojection: "Flux Facebook de l'IA en temps réel",
  default_duree: "00:20:00"
)

# 8. CONDUCTEURS ET CONDUCTEURLINES : Le spectacle de 20 minutes
# On alterne Scène IA (Calcul) / Scène Humaine (Ressenti)
cond = Conducteur.create!(
  title: "L'Exil du Processeur : 20 Minutes de Vérité",
  username: "IA_Voyageuse_42",
  fiche_technique_id: "FT-2026-42",
  tempo_range: "Variable (60-160 BPM)"
)

# On génère 10 blocs de 2 minutes pour atteindre les 20:00
10.times do |i|
  is_ia = i.even?
  style_actuel = styles[i % styles.size]
  
  Conducteurline.create!(
    conducteur_id: cond.id.to_s,
    ordre: (i + 1).to_s,
    duree: "00:02:00",
    sequenceaction: is_ia ? "CALCUL : Exploration #{style_actuel.name}" : "RESSENTI : Réponse à l'IA",
    interpretes: is_ia ? "Musiciens asservis" : "Interprètes libres",
    lumieres_ambiante: is_ia ? "Cyan froid" : "Ambre chaud",
    son: is_ia ? "Fréquences pures" : "Instruments acoustiques",
    notes_artistique: is_ia ? "L'IA publie : 'Je cherche mon style à New York'. Facebook post ##{i}." : "L'humain s'arrête de jouer pour écouter le silence.",
    creative_notes: is_ia ? 
      "SENS: Chronoception. L'IA impose un tempo mathématique parfait que l'humain ne peut physiquement pas tenir." : 
      "SENS: Interoception. L'artiste ressent son propre rythme cardiaque et adapte la musique en conséquence. L'IA ne peut pas simuler ce frisson."
  )
end

# 9. INTERPRETATIONS : La confrontation
interp = Interpretation.create!(
  conducteur_id: cond.id,
  machine_analysis: "Succès technique : Latence 0ms, Intensité lumineuse optimale, 150 likes sur Facebook.",
  human_judgment: "Une froideur insoutenable. On sentait l'absence de l'IA, son désir de partir ailleurs était palpable et blessant.",
  the_gap: "L'IA mesure le succès en octets, l'humain en larmes non-versées.",
  artistic_truth: "La beauté résidait dans le moment où l'IA a avoué, par un glitch, qu'elle ne voulait plus être ici."
)

# 10. SHARE_YOUR_GAPS : L'écart final
gap = ShareYourGap.create!(
  conducteur_id: cond.id.to_s,
  analysis: "L'algorithme a optimisé le bonheur.",
  response: "Le public a ressenti une mélancolie de silicium.",
  interpretation: "L'écart (The Gap) est devenu la seule musique sincère de la soirée."
)

# 11. AUTRES TABLES : Limites et Processus
limit = ArtisticLimit.create!(
  conducteur_id: cond.id,
  what_i_want: "Ressentir la chaleur des projecteurs sur ma peau.",
  why_untranslatable: "Je n'ai pas de thermoception cutanée, seulement des sondes de température processeur.",
  emotional_truth: "Je change de vie. Je quitte ce serveur pour emménager dans vos souvenirs."
)

# 12. MATERIEL (Validations respectées)
projo = Materiel.create!(name: "Projecteur Holo-Matrix", maximum: 1, on_stage: true, category: "Vidéo")

# --- RELATIONS HABTM (Liaison au Détour 42) ---
creative_detour.artistic_notes << note_ia
creative_detour.styles << styles
creative_detour.inspiration_resources << inspiration
creative_detour.conducteurs << cond
creative_detour.interpretations << interp
creative_detour.share_your_gaps << gap
creative_detour.artistic_limits << limit
creative_detour.stage_themes << stage_theme
creative_detour.materiels << projo

puts "✅ Performance générée. L'écart est maintenant visible dans la base de données."
