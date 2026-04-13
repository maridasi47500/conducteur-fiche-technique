# db/seeds.rb

# =============================================================================================
# DÉTOUR CRÉATIF : "L'ALGORITHME DE L'ÉVASION" (The Algorithm of Escape)
#
# CONCEPT : 
# Une performance multimédia où l'on suit le "fil d'actualité" projeté d'un individu. 
# La scène devient un smartphone géant. La lumière et le son imitent les clichés du web :
# l'effort du sport (ring-light, souffle), l'exotisme du voyage (couleurs chaudes, vagues), 
# et la passion musicale (filtres vintage). 
#
# LE DÉFI : 
# Créer un décalage brutal entre l'image parfaite projetée par l'IA et la "Vérité Artistique"
# consignée dans les notes, révélant la fatigue, l'artifice ou le métier caché du performer.
# =============================================================================================

CreativeDetour.create!(
  title: "L'Algorithme de l'Évasion",
  concept: "Trois tableaux vivants (Sport, Voyage, Musique) basés sur des profils sociaux générés. L'IA 'aide à faire croire' à une vie parfaite via des visuels Deepfake, tandis que les notes artistiques documentent la subversion de ces images.",
  challenge: "L'IA peut-elle simuler l'authenticité d'un souvenir de voyage mieux que le performer qui l'a vécu ?",
  
  action: "
    1. Commencer par [artistic_notes] pour consigner les secrets cachés derrière les images.
    2. Utiliser [ambiance_options] pour définir les codes sensoriels de chaque 'post' social.
    3. Construire le [conducteurs] et ses [conducteurlines] pour synchroniser les glitchs.
    4. Analyser l'hypocrisie de l'image via [share_your_gaps] et [interpretations].
  ",

  database_usage: "
    --- DÉPART : LES SECRETS (Notes de l'ombre) ---
    - [artistic_notes] : Title: 'Le Mensonge du Sport', Content: 'L'acteur simule l'effort mais son rythme cardiaque est en fait lié à une peur de l'échec, pas à la course'.
    - [artistic_notes] : Title: 'Le Voyage Immobile', Content: 'La plage projetée est une génération IA d'un lieu qui n'existe pas. L'interprète a le mal du pays pour un endroit fictif'.

    --- LE CADRE (Styles & Espaces) ---
    - [styles] : Name: 'Social-Media-Realism'.
    - [ambiance_options] : Style: 'Social-Media-Realism', Category: 'Lumières', Value: 'Filtre Nashville (Ambre/Sépia)'.
    - [ambiance_options] : Style: 'Social-Media-Realism', Category: 'Machine_brouillard', Value: 'Brume légère (effet vaporeux de rêve)'.
    - [zones] : Name: 'Le Feed' (Écran central), Name: 'Les Coulisses du Moi' (Bords de scène sombres).

    --- LA STRUCTURE (Le Conducteur du Paraître) ---
    - [conducteurs] : Title: 'Story : 24h d'une vie synthétique', starred: true.
    - [conducteurlines] : 
        Sequenceaction: 'Tableau 1 : Le Jogging. Ring-light intense, bruit de respiration accélérée.',
        lumieres_ambiante: 'Blanc froid 100%', 
        son: 'Rythme cardiaque Techno-Minimal',
        notes_artistique: '[VIDE - À remplir : Quelle est la douleur cachée derrière ce sourire de fitness ?]',
        creative_notes: 'Liaison avec le profil social @DeepVoyager'.
    - [conducteurlines] : 
        Sequenceaction: 'Tableau 2 : Le Concert. L'interprète fait du playback sur un piano virtuel.',
        videoprojection: 'Pluie de "Likes" dorés',
        son: 'Piano saturé',
        notes_artistique: '[VIDE - À remplir : Quel instrument jouez-vous réellement dans l'ombre ?]'.

    --- LA TECHNIQUE (L'Usine à Rêves) ---
    - [fiche_techniques] : Name: 'Fiche : Illusion Digitale', Eleve_responsable: 'Le Curateur'.
    - [materiels] : Name: 'Projecteur asservi', Category: 'Stage Lighting', Zone_id: 1.
    - [metier_dependencies] : Le Projecteur nécessite un 'Générateur de Flare' pour simuler le soleil du voyage.
    - [plan_de_scene_dessins] : Disposition: 'Interface Mobile', Layer: 'UI/UX Elements'.
    - [materiel_necessaires] : '1 Miroir sans tain', '3 Ring-lights'.

    --- LE JUGEMENT (L'IA face à l'Artiste) ---
    - [show_themes] : Philosophical inquiry: 'La sueur numérique a-t-elle la même valeur que le sel de la mer ?'.
    - [theme_suggestions] : Category: 'Audience Engagement', Title: 'Le Paradoxe de l'Authenticité'.
    - [emotional_markers] : Name: 'Mélancolie du Filtre'.
    - [conducteurhasmarkers] : Marque la transition entre le voyage et le retour à la réalité.
    - [share_your_gaps] : Analysis: 'L'image est parfaite, le sujet semble heureux', Response: 'C'est une performance de pure solitude'.
    - [interpretations] : The gap: 'L'IA calcule un succès de 95% sur le réalisme du visage, l'humain ressent une vacuité totale'.
    - [artistic_limits] : Contradiction: 'Utiliser la plus haute technologie pour montrer la pauvreté du lien social'.
    - [artistic_processes] : Initial impulse: 'Une story qui ne s'arrête jamais', Final form: 'Le silence après le log-out'.
    - [inspiration_resources] : Title: 'The Society of the Spectacle', Category: 'Visual & Aesthetic'.
  ",

  reaction: "Visuellement, c'est un voyage hypnotique à travers des écrans. Mais la scène, par ses sons de notifications agressifs et ses lumières froides de studio, trahit le 'travail' derrière le 'loisir'. L'IA aide à créer un profil si parfait qu'il en devient suspect, forçant le public à chercher l'humain dans les 'notes artistiques' cachées.",
  
  storage_impact: "Remplissage massif de la table [artistic_notes] pour servir de contre-point aux [conducteurlines] techniques."
)

# =============================================================================================
# COMMENTAIRE MISSION :
# - DÉPART : Je commence par [artistic_notes] pour que le "secret" soit la base de la donnée.
# - ÉVITÉ : Je ne commence pas par [projet_artistiques] pour ne pas être trop institutionnel.
# - BUT : Simuler le voyage par les [ambiance_options] et les [sequence_templates], tout en 
#   laissant les colonnes artistiques VIDES pour que l'acteur y injecte sa subversion.
# =============================================================================================
