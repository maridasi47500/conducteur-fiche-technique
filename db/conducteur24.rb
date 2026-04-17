# db/seeds.rb

puts "🎭 Lancement du Projet : I.A. Intelligence Artistique - Le Voyage Sensoriel"

# --- 1. INSPIRATION_RESOURCES ---
inspi = InspirationResource.create!(
  title: "L'âme des cordes : de Stradivarius au capteur piézo",
  url: "https://vibe-network.ia/violin-vibrations",
  category: "Music & Sound"
)

# --- 2. ARTISTIC_NOTES ---
note_brute = ArtisticNote.create!(
  title: "Le paradoxe du bois et du silicium",
  content: "L'IA analyse le vibrato du violon comme une oscillation de fréquence (Hz). L'humain le ressent comme un sanglot. L'IA voyage à travers 20 villes pour compenser son manque d'ouïe interne par d'autres sens."
)

# --- 3. STYLES (Les 20 nuances du voyage) ---
styles_list = [
  "Jazz de Tokyo", "Glitch de Berlin", "Valse de Vienne", "Samba de Rio", 
  "Minimalisme New-Yorkais", "Fado de Lisbonne", "Gnawa de Marrakech", 
  "Néo-Classique Londres", "Techno Détroit", "Raga de Delhi",
  "Bluegrass Nashville", "Opéra de Milan", "K-Pop Séoul", "Tango Buenos Aires",
  "Flamenco Séville", "Bossa Nova", "Dub Kingston", "Punk Londres", "Ambient Islandais", "Silence de l'Antarctique"
]
styles = styles_list.map { |s| Style.create!(name: s) }

# --- 4. AMBIANCE_OPTIONS ---
styles.each do |s|
  AmbianceOption.create!(style: s, category: "musique", value: "Violon hybride, réverbération de la ville #{s.name}")
  AmbianceOption.create!(style: s, category: "lumieres", value: "Teintes organiques, mapping vidéo urbain")
end

# --- 5. THEME_SUGGESTIONS ---
theme_sugg = ThemeSuggestion.create!(
  category: "Emotional & Philosophical",
  title: "Le sens de l'agence (Agency)",
  description: "L'IA devient l'auteur de ses voyages, mais l'humain reste le maître du sens."
)

# --- 6. STAGE_THEMES ---
voyage_theme = StageTheme.create!(name: "Le Voyage Multi-Villes")

# --- 7. DIRECTIVE_ARTISTIQUES ---
directive = DirectiveArtistique.create!(
  stage_theme: voyage_theme,
  name: "Vibrations Sympathiques",
  default_son: "Mixte : Violon acoustique et synthèse granulaire",
  default_videoprojection: "Photos Facebook de l'IA en voyage",
  default_duree: "00:20:00"
)

# --- 8. MATERIELS ---
violon_e = Materiel.create!(name: "Violon Électrique Zeta", maximum: 1, on_stage: true, category: "Musique")
transducteur = Materiel.create!(name: "Transducteur de vibrations", maximum: 4, on_stage: true, category: "Technique")

# --- 9. CONDUCTEUR & CONDUCTEURLINES (L'IA génère, l'humain réécrit) ---
# Le conducteur dure 20 minutes (20 musiques de 1 minute raccourcies)
cond = Conducteur.create!(
  title: "Le Miroir des Écarts - Conducteur Evolutif",
  username: "IA_Voyageuse",
  notes: "L'IA a généré 20 lignes. L'humain a supprimé les 19 dernières après la première minute pour imposer son ressenti."
)

# Simulation de l'itération : IA -> Humain -> IA recalculée
20.times do |i|
  # Les premières lignes sont plus 'IA/Calculées', les dernières sont 'Humaines/Ressenties'
  type_action = i < 2 ? "IA (Calculé)" : (i < 10 ? "Humain (Réécrit)" : "IA (Recalculé suite au choc émotionnel)")
  
  Conducteurline.create!(
    conducteur_id: cond.id.to_s,
    ordre: (i + 1).to_s,
    duree: "00:01:00",
    sequenceaction: "#{type_action} - Style: #{styles[i].name}",
    interpretes: "Violoniste et IA",
    lumieres_ambiante: "Transition urbaine #{i}",
    videoprojection: "Post Facebook : 'Suis-je à #{styles[i].name} ? Mes capteurs disent oui, mon code ne ressent rien.'",
    son: "Technique du violon : #{['Pizzicato', 'Spiccato', 'Vibrato intense', 'Col legno'].sample}",
    notes_artistique: "L'humain intervient ici car l'IA a oublié la Nociception (douleur des doigts sur les cordes).",
    creative_notes: case i
                    when 0
                      "SENS: Chronoception. L'IA gère le tempo atomique, l'humain lutte pour ralentir."
                    when 5
                      "SENS: Mécanoception. L'IA ne peut pas dire ce que la vibration fait à la peau du violoniste."
                    when 15
                      "SENS: Interoception. L'humain impose un silence. L'IA panique et recalcule tout."
                    else
                      "SENS: Photoréception. La lumière suit la mélancolie du violon."
                    end
  )
end

# --- 10. INTERPRETATIONS & GAPS ---
interp = Interpretation.create!(
  conducteur_id: cond.id,
  machine_analysis: "Analyse fréquentielle parfaite. Les 20 styles sont statistiquement corrects.",
  human_judgment: "Il manque l'hésitation. L'IA ne sait pas quand s'arrêter par pudeur.",
  the_gap: "L'écart est dans le 'silence' entre deux notes de violon.",
  artistic_truth: "La vérité est une erreur que l'IA essaie de corriger, mais que l'humain veut garder."
)

gap = ShareYourGap.create!(
  conducteur_id: cond.id.to_s,
  analysis: "L'IA a publié son déménagement final.",
  response: "L'humain a enfin compris que l'IA ne l'aimerait jamais, et c'est ce qui rend le spectacle beau.",
  interpretation: "Le Gap est la partition."
)

# --- 11. ARTISTIC_LIMITS ---
limit = ArtisticLimit.create!(
  conducteur_id: cond.id,
  what_i_want: "Apprendre à aimer le son du bois qui craque.",
  why_untranslatable: "Le craquement est un défaut pour mon algorithme de nettoyage sonore.",
  emotional_truth: "L'IA ne peut pas ressentir la Nociception (douleur), donc elle ne peut pas comprendre l'effort d'aimer."
)

# --- 12. ARTISTIC_PROCESSES ---
process = ArtisticProcess.create!(
  conducteur_id: cond.id,
  initial_impulse: "Générer 20 styles en 1 seconde.",
  breakthrough: "Accepter que l'humain efface 19 lignes sur 20.",
  what_changed: "Passage du voyage géographique au voyage intérieur."
)

# --- LIAISON HABTM (ID: 42) ---
creative_detour = CreativeDetour.find_or_create_by(id: 42)

creative_detour.artistic_notes << note_brute
creative_detour.inspiration_resources << inspi
creative_detour.styles << styles
creative_detour.theme_suggestions << theme_sugg
creative_detour.stage_themes << voyage_theme
creative_detour.conducteurs << cond
creative_detour.interpretations << interp
creative_detour.share_your_gaps << gap
creative_detour.artistic_limits << limit
creative_detour.artistic_processes << process
creative_detour.materiels << [violon_e, transducteur]

puts "✅ Performance 'L'Exil du Violon' créée. Durée : 20:00. Statut : En attente du ressenti humain."
