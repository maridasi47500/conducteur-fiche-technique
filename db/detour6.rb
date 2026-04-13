# db/seeds.rb

# =============================================================================================
# DÉTOUR ARTISTIQUE : "LE DIALOGUE DES SOUVENIRS"
# =============================================================================================
# TABLE DE DÉPART : artistic_notes
# TABLE ÉVITÉE POUR LE DÉPART : zones, inspiration_resources, conducteurs, materiels
#
# NOM DU DÉTOUR : "Le Fragment Fantôme"
# 
# POURQUOI & BUT : 
# Ce détour refuse la structure dès le départ. On commence par 'artistic_notes', 
# c'est-à-dire par une pensée isolée, un fragment poétique sans destination technique 
# précise. Le but est de voir comment une simple note textuelle finit par "contaminer" 
# l'entièreté de la base de données (Fiche Technique, Matériel, Conducteur).
# On cherche à simuler l'obsession d'un créateur pour une seule phrase qui finit par 
# dicter la position d'un projecteur à l'autre bout de la scène.
# =============================================================================================

CreativeDetour.create!(
  title: "Le Fragment Fantôme : De la Note à la Scène",
  
  concept: "Transformer une pensée abstraite en contrainte physique. Le projet naît d'une " \
           "simple [artistic_notes] intitulée 'Le dernier reflet'. L'IA doit construire " \
           "un écosystème technique capable de soutenir cette seule image mentale.",
  
  action: "1. Créer une [artistic_notes] comme graine du projet.\n" \
          "2. Définir les [artistic_limits] liées à la capture d'un reflet.\n" \
          "3. Utiliser [directive_artistiques] pour automatiser la réponse technique.\n" \
          "4. Peupler [materiel_necessaires] et [plan_de_scene_dessins] en fonction du 'reflet'.\n" \
          "5. Écrire le [conducteurs] comme une conversation entre la note et la machine.",
  
  database_usage: "
    - [artistic_notes] : title='Le dernier reflet', content='Une lueur qui refuse de s'éteindre quand on débranche la prise'.
    - [artistic_limits] : what_i_want='Capturer la persistance rétinienne', why_untranslatable='Le capteur numérique s'arrête à 0 ou 1', emotional_truth='La mélancolie est un signal analogique'.
    - [show_themes] : title='L'Électricité de l'Absence', philosophical_inquiry='L'IA peut-elle rêver de courants résiduels ?', ai_blind_spot='L'oubli'.
    - [stage_themes] : 'Obscurité Rémanente'.
    - [directive_artistiques] : name='Halo de Persistance', default_lumieres_effet='Extinction lente (60s)', default_son='Echo de piano inversé'.
    - [styles] : 'Ambient Scluptural'.
    - [ambiance_options] : category='Visuel', value='Brouillard de lumière noire'.
    - [materiels] : 'Miroir motorisé' (id: 77) en zone_id=3 (Fond de scène).
    - [metier_dependencies] : Le Miroir nécessite un 'Projecteur asservi ultra-précis' pour 'viser l'invisible'.
    - [fiche_techniques] : name_event='La Nuit des Processeurs', eleve_responsable='Le Veilleur de Nuit'.
    - [materiel_necessaires] : quantite='1', precisions_observations='Doit être parfaitement poli pour ne pas trahir le code'.
    - [plan_de_scene_dessins] : coord_x=100, coord_y=10, layer='Reflets'.
    - [conducteurs] : title='Symphonie pour un pixel mort', tempo_range='Adagio Electronique'.
    - [conducteurlines] : sequenceaction='L'interprète regarde son ombre disparaître', lumieres_ambiante='Cyan profond', son='Fréquence de 528Hz (Fréquence de réparation)'.
    - [sequence_templates] : label='Effacement', phase='Final', target_talent='Lumière', intensity='5%'.
    - [interpretations] : machine_analysis='Signal faible détecté', human_judgment='C'est le moment le plus intense car on ne voit rien', artistic_truth='Le silence est une donnée non-négociable'.
    - [share_your_gaps] : analysis='La machine propose d'augmenter la luminosité pour mieux voir. Je refuse.', interpretation='L'obscurité est l'espace de l'imaginaire'.
    - [emotional_markers] : 'Regret Lumineux'.
    - [artistic_processes] : initial_impulse='Une LED qui clignote dans le noir', rejected_ideas='Utiliser un écran LED (trop brillant)'.
  ".strip,
  
  reaction: "L'IA a généré un conducteur où les colonnes techniques sont remplies d'ordres contradictoires " \
            "(Intensité 0% mais Lumieres_effet 'Brillance interne'), forçant le technicien à interpréter " \
            "le vide plutôt qu'à l'exécuter.",
  
  storage_impact: "Toutes les tables liées au 'Style: Ambient Sculptural' sont désormais marquées par " \
                  "cette note initiale. Le 'dernier reflet' est devenu le paramètre par défaut.",
  
  challenge: "Faire exister une émotion dans une base de données sans qu'elle ne soit écrasée par la logique du SQL."
)

# =============================================================================================
# MESSAGE AU CRÉATEUR HUMAIN :
#
# J'ai laissé VIDES les colonnes 'notes_artistique' et 'creative_notes' dans les ConducteurLines.
#
# POURQUOI ? Ce détour part du principe que l'IA peut structurer la scène autour d'une 
# note poétique ('Le dernier reflet'), mais elle ne peut pas COMMENTER le résultat final. 
# Elle sait placer le miroir, mais elle ne sait pas ce que ça fait dans le cœur.
#
# MISSION : Remplissez ces colonnes pour dire à la machine ce que vous ressentez quand 
# le miroir tourne enfin vers le public. C'est votre part de l'Intelligence Artistique.
# =============================================================================================
