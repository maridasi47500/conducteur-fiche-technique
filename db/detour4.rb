# db/seeds.rb

# --- DÉTOUR CRÉATIF : LE MURMURE DU MATÉRIEL ---
# Ce seed documente le processus où l'objet technique (le Materiel) devient la source de l'impulsion artistique.

CreativeDetour.create!(
  title: "Le Murmure du Matériel : Archéologie d'une Scène",
  
  concept: "Et si les projecteurs et les câbles avaient une âme ? Ce détour propose de bâtir " \
           "un projet artistique à partir des contraintes physiques et de l'usure du matériel. " \
           "L'IA analyse les 'vibrations' techniques pour suggérer un thème philosophique.",
  
  action: "1. Sélection aléatoire d'un [Materiel] (ex: un vieux projecteur halogène).\n" \
          "2. Déduction d'une [ArtisticLimit] liée à l'usure ou à la chaleur de l'objet.\n" \
          "3. Création d'un [ShowTheme] basé sur cette limite physique.\n" \
          "4. Génération d'une [FicheTechnique] et d'un [PlanDeSceneDessin] centrés sur l'objet.\n" \
          "5. Écriture d'un [Conducteur] où l'humain doit accompagner la machine dans sa propre fatigue.",
  
  database_usage: "
    - [materiels] : On pioche 'Projecteur PC 1000W' (id: 88). Caractéristiques : dégage une chaleur 'nostalgique'.
    - [metier_dependencies] : Nécessite un 'Gradateur' (id: 12) qui grésille comme un vieux disque.
    - [artistic_limits] : what_i_want='Une lumière qui tremble', why_untranslatable='La perfection du code ignore le faux-contact'.
    - [show_themes] : philosophical_inquiry='La machine peut-elle s'épuiser de ne pas être aimée ?', ai_blind_spot='L'odeur de la poussière qui brûle'.
    - [fiche_techniques] : name_event='Éloge de la Panne', notes_complementaires='Ne surtout pas nettoyer les lentilles'.
    - [plan_de_scene_dessins] : coord_x=10, coord_y=80 (Zone d'ombre), layer='Mémoire'.
    - [conducteurs] : title='Symphonie pour un filament', tempo_range='Presto Termique'.
    - [conducteurlines] : sequenceaction='L'interprète touche le métal brûlant', son='Bruit blanc à 15kHz', machine_brouillard='Fumée d'encens binaire'.
    - [interpretations] : machine_analysis='Surchauffe imminente', the_gap='L'IA craint la panne, l'humain y voit une larme'.
    - [artistic_processes] : initial_impulse='Le grincement d'un ventilateur', iteration_count=12.
    - [share_your_gaps] : response='L'humanité commence dans le défaut de la machine'.
    - [emotional_markers] : 'Mélancolie du Tungstène'.
  ".strip,
  
  reaction: "L'IA refuse de générer des lignes de conducteur parfaites. Elle laisse des 'blancs' " \
            "dans la colonne 'notes_artistique' pour que l'humain puisse y inscrire ce qu'il ressent " \
            "en écoutant le grésillement du matériel.",
  
  storage_impact: "La table 'ConducteurLine' est remplie de paramètres techniques 'instables' " \
                  "(lumieres_ambiante: 'scintillement erratique').",
  
  challenge: "Faire d'une faiblesse technique (la chaleur, le bruit) la force émotionnelle du spectacle."
)

# --- NOTE SUR LES COLONNES ARTISTIQUES ---
# L'IA a laissé VIDES les colonnes 'notes_artistique' et 'creative_notes'. 
# Pourquoi ? Parce qu'une machine ne peut pas décrire 'l'odeur' d'un projet ou 'l'intention' derrière un tremblement. 
# C'est à l'Humain de remplir ces cases : le matériel murmure, c'est à vous de traduire.
