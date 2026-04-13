# db/seeds.rb

# =============================================================================================
# DÉTOUR CRÉATIF : "L'AMNÉSIE SYNTHÉTIQUE"
# NOM DU DÉTOUR : "Le Souvenir Plus Vrai que Nature"
#
# BUT : Utiliser l'IA pour générer un souvenir de voyage (vidéo/son) si parfait qu'il 
# remplace la mémoire du performer. L'IA aide à "faire croire" en comblant les lacunes 
# de la mémoire humaine avec des clichés esthétiques.
# =============================================================================================

CreativeDetour.create!(
  title: "L'Amnésie Synthétique",
  concept: "Un performer raconte un voyage qu'il n'a jamais fait (ou qu'il a oublié). L'IA projette en temps réel des preuves (fausses photos, sons d'ambiance, visages d'amis inexistants). Le défi est de voir si le public (et l'artiste) finit par croire à cette authenticité simulée.",
  challenge: "L'IA peut-elle simuler l'authenticité d'un souvenir de voyage mieux que le performer qui l'a vécu ou qui ne l'a pas vécu ?",
  
  action: "
    1. Commencer par [artistic_processes] pour noter la naissance du faux souvenir.
    2. Utiliser [inspiration_resources] pour nourrir l'imaginaire de l'IA (catégorie Emotion & Psychology).
    3. Configurer [ambiance_options] pour mimer les textures du passé (grain film, son lo-fi).
    4. Conclure par [interpretations] pour mesurer le 'poids' de ce souvenir artificiel.
  ",

  database_usage: "
    --- DÉPART : LA GENÈSE (Le processus de l'oubli) ---
    - [artistic_processes] : initial_impulse: 'Un billet d'avion retrouvé dans un rêve', first_attempt: 'L'IA génère une plage aux Maldives', breakthrough: 'L'IA ajoute l'odeur de la crème solaire via le brouillard'.
    - [artistic_notes] : Title: 'Le Poids du Faux', Content: 'Plus l'image est belle, plus l'acteur se sent étranger à sa propre vie'.

    --- LES SOURCES (Inspirations pour mentir) ---
    - [inspiration_resources] : Title: 'The Art of Travel - Alain de Botton', Category: 'Emotion & Psychology'.
    - [theme_suggestions] : Category: 'Storytelling', Title: 'Souvenirs par procuration'.
    - [show_themes] : Philosophical inquiry: 'Si une photo existe, le souvenir devient-il vrai ?', AI blind spot: 'L'IA ne connaît pas la nostalgie douloureuse, seulement le filtre sépia'.

    --- L'ESPACE ET L'ÉQUIPEMENT (La machine à remonter le temps) ---
    - [zones] : Name: 'La Mémoire Vive' (Avant-scène lumineuse), Name: 'Les Archives Perdues' (Fond de scène sombre).
    - [materiels] : 'Vidéoprojecteur Retro', 'Machine à brouillard' (pour flouter les contours du passé).
    - [metier_dependencies] : La Vidéoprojection nécessite un 'Générateur de Grain Argentique' pour faire 'vrai'.
    - [fiche_techniques] : Name: 'Opération : Souvenir Artificiel', Eleve_responsable: 'Le Curateur de Rêves'.
    - [plan_de_scene_dessins] : Disposition: 'Vaporeuse', Layer: 'Memory Overlay'.
    - [materiel_necessaires] : '1 Ventilateur' (pour simuler le vent du voyage), '3 Projecteurs Ambre'.

    --- LA MISE EN SCÈNE (Directives et Modèles) ---
    - [styles] : Name: 'Nostalgie Digitale'.
    - [ambiance_options] : Style: 'Nostalgie Digitale', Category: 'Son', Value: 'Craquements de disque, vent lo-fi, voix étouffées'.
    - [sequence_templates] : Label: 'Flashback', Phase: 'body', Target talent: 'Musicien/ne', suggested_light: 'Rasant', intensity: '20%'.
    - [directive_artistiques] : Name: 'L'Instant Suspendu', default_son: 'Piano avec beaucoup de réverbe', default_videoprojection: 'Ralentis de paysages ensoleillés'.

    --- LA PARTITION TECHNIQUE ---
    - [conducteurs] : Title: 'Conducteur : Voyage au bout du Code', tempo_range: 'Rubato (fluctuant)'.
    - [conducteurlines] : 
        Sequenceaction: 'L'interprète décrit une scène de marché à Bangkok que l'IA projette avec 2s de retard',
        son: 'Bruit de foule filtré', 
        notes_artistique: '[VIDE - À remplir : Décrire le sentiment de décalage entre vos mots et l'image]',
        creative_notes: '[VIDE - À remplir : L'IA a-t-elle choisi la bonne couleur de ciel ?]'.
    - [emotional_markers] : Name: 'Dissonance Cognitive'.
    - [conducteurhasmarkers] : Relie le moment où le performer hésite au marqueur 'Dissonance'.
    - [conducteurhasthemes] : Lie le conducteur au thème 'Souvenirs par procuration'.

    --- L'ÉCART FINAL (Vérité vs Machine) ---
    - [share_your_gaps] : Analysis: 'L'image est plus convaincante que le récit oral', Response: 'C'est parce que l'image est un cliché que tout le monde accepte'.
    - [interpretations] : The gap: 'L'IA a créé un souvenir universel, l'humain a perdu son souvenir singulier'.
    - [artistic_limits] : Contradiction: 'Vouloir prouver son existence par des images que l'on n'a pas prises'.
  ",

  reaction: "La scène aide à 'faire croire' car elle utilise des codes émotionnels universels (musique douce, lumière chaude). À la fin, l'interprète révèle son métier caché (ex: danseur) en effectuant une chorégraphie qui brise physiquement l'image projetée, prouvant que son corps est la seule chose que l'IA ne peut pas simuler.",
  
  storage_impact: "Remplissage intense de la table [artistic_processes] pour suivre comment le mensonge s'est construit étape par étape."
)

# =============================================================================================
# COMMENTAIRE MISSION :
# - DÉPART : Je commence par [artistic_processes] car la simulation d'un souvenir est un cheminement.
# - ÉVITÉ : Je ne commence pas par [zones] pour privilégier l'évolution de l'idée sur l'espace.
# - BUT : Utiliser l'IA pour 'combler les trous' de la réalité et poser la question de l'authenticité.
# - RAPPEL : Les colonnes 'notes_artistique' restent VIDES. C'est là que l'humain doit dire si,
#   au final, il a fini par croire à son propre mensonge.
# =============================================================================================
