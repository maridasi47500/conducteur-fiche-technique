# db/seeds.rb

# =============================================================================================
# DÉTOUR CRÉATIF : "LE MIROIR DES SIMULACRES"
# NOM DU DÉTOUR : "Simulacre & Métamorphose"
#
# BUT : Utiliser l'IA pour créer une fausse identité numérique (Deepfake/Social Media) 
# projetée en scène. Le public est trompé par un profil "vrai" (influenceur voyage, etc.) 
# avant que le bug technique ne révèle le métier de scène caché (Acteur, Musicien, Danseur).
# =============================================================================================

CreativeDetour.create!(
  title: "Simulacre & Métamorphose",
  concept: "Trois performers entrent en scène. Derrière eux, trois profils sociaux projetés. Les visages projetés sont des versions 'IA' d'eux-mêmes, parfaitement crédibles, localisés (langue, lieux). Au début, ils semblent être des amateurs ou des inconnus du web. La scène (son/lumière) simule l'esthétique du 'scroll'. À la fin, un glitch déconstruit le profil pour révéler leur virtuosité cachée.",
  challenge: "L'IA peut-elle rendre le mensonge numérique plus tangible que la présence physique ?",
  
  action: "
    1. Commencer par [show_themes] pour définir l'enquête philosophique sur l'identité.
    2. Utiliser [directive_artistiques] pour automatiser les ambiances 'Social Media' (notifications, ring-light).
    3. Passer par [share_your_gaps] pour noter l'écart entre le profil lisse et le corps qui transpire.
    4. Terminer par [artistic_processes] pour documenter la révélation du métier caché.
  ",

  database_usage: "
    --- DÉPART : LE THÈME (La Graine du Mensonge) ---
    - [show_themes] : Title: 'L'Avatar Suprême', Philosophical Inquiry: 'Qui est le plus réel : celui qui danse ou celui qui est 'liké' ?', AI Blind Spot: 'L'IA ne perçoit pas la fatigue musculaire'.
    - [theme_suggestions] : Category: 'Storytelling', Title: 'L'influenceur de nulle part'.
    - [stage_themes] : Name: 'Interface vs Organique'.

    --- CONSTRUCTION DU MENSONGE (Scénographie & Matériel) ---
    - [zones] : Name: 'Le Cloud' (Fond de scène, projection), Name: 'Le Réel' (Avant-scène).
    - [materiels] : 'Projecteur 4K' (Zone Cloud), 'Ring Light Motorisée' (Zone Réel).
    - [metier_dependencies] : Le Ring Light nécessite un 'Filtre de diffusion' pour lisser le visage de l'acteur.
    - [plan_de_scene_dessins] : Disposition: 'Triptyque vertical (format smartphone)', Layer: 'Interface UI'.
    - [fiche_techniques] : Name: 'Projet Simulacre', Date: '2026-04-13', Note: 'Synchronisation parfaite requise entre le live et la vidéo IA'.
    - [materiel_necessaires] : 'Serveur GPU pour Deepfake live', 'Micro-casque invisible'.

    --- L'ATMOSPHÈRE DU SCROLL (Ambiance & Style) ---
    - [styles] : Name: 'Digital Nomad Aesthetic'.
    - [ambiance_options] : Category: 'Son', Value: 'Sons de notifications ASMR, vent de voyage filtré'.
    - [sequence_templates] : Label: 'Le Scroll', Phase: 'body', Target talent: 'Tous', suggested_light: 'ParLed Douche', intensity: '40%'.
    - [directive_artistiques] : Name: 'Voyage Imaginaire', default_son: 'Ambiance aéroport/nature synthétique', default_videoprojection: 'Flux Instagram généré'.

    --- LA RÉVÉLATION (Action & Rupture) ---
    - [conducteurs] : Title: 'Conducteur : Démasquage', Tempo range: 'Variable (accélération finale)'.
    - [conducteurlines] : 
        Sequenceaction: 'Le profil de voyageur 'Acteur 1' bugge et laisse place à un monologue tragique', 
        son: 'Inversion de phase',
        notes_artistique: '[VIDE - À remplir : Quelle émotion pour la chute du masque ?]',
        creative_notes: '[VIDE - À remplir : Décrire la transition du faux voyageur vers le vrai musicien]'.
    - [emotional_markers] : Name: 'Choc de Réalité'.
    - [conducteurhasmarkers] : Lie le moment du glitch au marqueur 'Choc'.
    - [conducteurhasthemes] : Lie le conducteur au thème 'Interface vs Organique'.

    --- L'ANALYSE DU GAP (L'Art après le Bug) ---
    - [artistic_limits] : What I want: 'Montrer le talent brut sous le filtre'. Contradiction: 'Utiliser une machine pour dénoncer la machine'.
    - [share_your_gaps] : Analysis: 'L'IA a réussi à tromper 90% du public au début', Interpretation: 'Le talent caché est la seule donnée non-duplicable'.
    - [interpretations] : Machine analysis: 'Anomalie de performance détectée', Human judgment: 'C'est juste un solo de danse magnifique'.
    - [artistic_processes] : Rejected ideas: 'Garder le filtre tout le long', Breakthrough: 'Faire tomber le filtre au milieu d'un saut'.
    - [artistic_notes] : Title: 'Note sur l'authenticité', Content: 'Le métier caché (Danse/Musique) doit éclater comme une urgence'.
    - [inspiration_resources] : Title: 'The Presentation of Self in Everyday Life', Url: '...', Category: 'Storytelling'.
  ",

  reaction: "L'IA aide à 'faire croire' en lissant les visages et en créant des décors de voyage parfaits. La scène valide le mensonge par une lumière 'studio' jusqu'à ce que le son devienne purement instrumental ou que le mouvement devienne purement chorégraphique, liant enfin l'humain à son véritable métier de scène.",
  
  storage_impact: "Remplissage complet de la table [interpretations] pour comparer la réussite du Deepfake vs la réussite de la performance live."
)

# =============================================================================================
# COMMENTAIRES DE MISSION :
# - DÉPART : Je commence par [show_themes] (La réflexion philosophique) pour poser le cadre.
# - ÉVITÉ : Je ne commence pas par [materiels] pour ne pas réduire le détour à un simple setup.
# - BUT : Utiliser l'IA comme complice du mensonge avant qu'elle ne devienne l'outil de la vérité.
# - APPEL À L'HUMAIN : Les colonnes 'notes_artistique' sont laissées VIDES pour que l'artiste
#   définisse lui-même comment il 'sort' de son faux profil social.
# =============================================================================================
