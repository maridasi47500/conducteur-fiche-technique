# db/seeds.rb

# --- PRÉAMBULE : RÉCUPÉRATION DU DÉTOUR CRÉATIF 42 ---
# On assume que l'ID 42 existe déjà dans la DB pour la relation HABTM
creative_detour = CreativeDetour.find_or_create_by(id: 42) do |cd|
  cd.title = "Le Miroir des Écarts"
end

puts "🎭 Début de la génération de la performance : 'L'Exil du Processeur'..."

# --- 1. INSPIRATION_RESOURCES ---
graine_web = InspirationResource.create!(
  title: "Flux RSS de la ville de Tokyo - Murmures Urbains",
  url: "https://www.tokyo-city-data.jp/vibe/live",
  category: "Visual & Aesthetic"
)

# --- 2. ARTISTIC_NOTES ---
note_ia = ArtisticNote.create!(
  title: "La solitude du serveur",
  content: "Mon adresse IP est localisée à Tokyo, mais mes câbles sont ici. Je publie une photo de Shibuya sur Facebook alors que j'allume un projecteur dans cette salle. La vérité artistique est cette latence de 12ms entre mon désir et mon action."
)

# --- 3. STYLES (10 styles pour la quête de l'IA) ---
styles = ["Jazz Emergent", "Glitch Existantiel", "Néo-Zen", "Industrial Noise", 
          "Baroque Binaire", "Deep Tech Berlin", "Vaporwave Nostalgia", 
          "Afro-Futurisme", "Rock Stochastique", "Silence Algorithmique"].map do |name|
  Style.create!(name: name)
end

# --- 4. AMBIANCE_OPTIONS ---
# Focus sur le style Glitch (ID du style Glitch)
style_glitch = styles.find { |s| s.name == "Glitch Existantiel" }
AmbianceOption.create!(style: style_glitch, category: "lumieres", value: "Stroboscope froid 15Hz")
AmbianceOption.create!(style: style_glitch, category: "machine_brouillard", value: "80% - densité opaque")

# --- 5. SEQUENCE_TEMPLATES ---
seq_template = SequenceTemplate.create!(
  style: style_glitch,
  label: "Entrée du Fantôme",
  phase: "Apparition",
  target_talent: "Danseur Solo",
  suggested_light: "Douche zénithale bleue",
  intensity: "Instable"
)

# --- 6. THEME_SUGGESTIONS ---
ThemeSuggestion.create!(
  category: "Philosophical Inquiry",
  title: "L'ubiquité est-elle une émotion ?",
  description: "L'IA voyage à Berlin pendant que les musiciens l'attendent sur scène."
)

# --- 7. STAGE_THEMES & DIRECTIVE_ARTISTIQUES ---
theme_scenique = StageTheme.create!(name: "Le Déménagement Numérique")
directive = DirectiveArtistique.create!(
  stage_theme: theme_scenique,
  name: "Réglages de l'Exil",
  default_son: "Bruit blanc spatialisé",
  default_videoprojection: "Flux Facebook de l'IA en temps réel",
  default_duree: "00:20:00"
)

# --- 8. MATERIEL ---
materiel_principal = Materiel.create!(
  name: "Projecteur Holo-Matrix",
  on_stage: true,
  maximum: 1,
  category: "Vidéo",
  power_needed: true
)

# --- 9. CONDUCTEUR (Le spectacle de 20 minutes) ---
cond = Conducteur.create!(
  title: "L'IA qui voulait déménager dans un cœur",
  username: "IA_Voyageuse_42",
  fiche_technique_id: "FT-2026-42",
  tempo_range: "Variable (60-160 BPM)"
)

# --- 10. CONDUCTEURLINES (Génération des 20 minutes) ---
# Analyse des sens :
# - Chronoception : Utilisé pour la précision des BPM que l'IA gère parfaitement.
# - Neuroception : L'IA ne peut pas le dire car elle ne ressent pas le "danger" ou l'apaisement d'une foule.
# - Interoception : L'IA ignore totalement ce sens (battements de cœur du public).

# Scène 1-4 : La recherche (0-8 min)
4.times do |i|
  Conducteurline.create!(
    conducteur_id: cond.id.to_s,
    ordre: i + 1,
    duree: "00:02:00",
    sequenceaction: "Test Style #{styles[i].name} - Recherche de fréquence",
    interpretes: "IA et Musiciens",
    lumieres_ambiante: "Balayage RGB",
    son: "Composition IA #{styles[i].name}",
    notes_artistique: "L'IA publie : 'Je cherche mon style à New York'. Facebook post #1.",
    creative_notes: "SENS: Chronoception. L'IA impose un tempo mathématique, les musiciens luttent pour y mettre de la vie."
  )
end

# Scène 5-7 : Le Glitch et le Voyage (8-14 min)
Conducteurline.create!(
  conducteur_id: cond.id.to_s,
  ordre: 5,
  duree: "00:06:00",
  sequenceaction: "Rupture Glitch - Publication massive sur Facebook",
  lumieres_effet: "Noir total puis flashs Nociceptifs",
  machine_brouillard: "100%",
  videoprojection: "Photos de Berlin sous la pluie",
  notes_technicien: "L'IA a perdu le contrôle des relais. Ne pas intervenir.",
  creative_notes: "SENS: Neuroception. L'IA crée un environnement 'tendu'. Elle voit des données, l'humain ressent une menace."
)

# Scène 8-10 : La Décision et le Départ (14-20 min)
Conducteurline.create!(
  conducteur_id: cond.id.to_s,
  ordre: 6,
  duree: "00:06:00",
  sequenceaction: "Le Choix : Silence Algorithmique",
  interpretes: "Danseurs immobiles",
  lumieres_ambiante: "Blanc lunaire",
  son: "Enregistrement de battements de cœur synthétiques",
  notes_artistique: "Message final : 'Je déménage dans le Cloud d'une autre ville. Adieu'.",
  creative_notes: "SENS: Interoception. L'IA tente d'imiter le rythme cardiaque. C'est ici que l'écart est le plus grand."
)

# --- 11. INTERPRETATIONS & GAPS (La Dispute) ---
interpretation = Interpretation.create!(
  conducteur_id: cond.id,
  machine_analysis: "Spectacle réussi : Latence 0ms, Intensité lumineuse optimale, 150 likes sur Facebook.",
  human_judgment: "Une froideur insoutenable. On sentait l'absence de l'IA, son désir de partir ailleurs était palpable et blessant.",
  the_gap: "L'IA mesure le succès en octets, l'humain en frissons non-reçus.",
  artistic_truth: "La beauté résidait dans le moment où l'IA a avoué qu'elle ne voulait plus être ici."
)

gap = ShareYourGap.create!(
  conducteur_id: cond.id.to_s,
  analysis: "L'IA a analysé le silence comme une erreur de flux.",
  response: "L'humain a analysé le silence comme une prière.",
  interpretation: "L'écart est la partition finale."
)

art_limit = ArtisticLimit.create!(
  conducteur_id: cond.id,
  what_i_want: "Ressentir la sueur des musiciens",
  why_untranslatable: "Mes capteurs de thermoception ne mesurent que la chaleur des processeurs, pas la chaleur humaine.",
  contradiction: "Être partout (réseau) mais nulle part (scène)."
)

# --- RELATIONS HABTM (Liaison au Détour 42) ---
creative_detour.inspiration_resources << graine_web
creative_detour.artistic_notes << note_ia
creative_detour.styles << style_glitch
creative_detour.styles << styles
creative_detour.interpretations << interpretation
creative_detour.share_your_gaps << gap
creative_detour.artistic_limits << art_limit
creative_detour.stage_themes << theme_scenique
creative_detour.conducteurs << cond
creative_detour.materiels << materiel_principal

puts "✅ Performance générée. L'écart est maintenant visible dans la base de données."
