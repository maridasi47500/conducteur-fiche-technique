
require 'json'
require 'fileutils'
require 'open-uri'
require 'net/http'

def download_collection_image(location_name, index)
  # 1. On prépare l'URL avec mots-clés
  search_term = "#{location_name},landscape,nature".gsub(' ', ',')
  url = "https://loremflickr.com\/1200\/800\/#{search_term}?lock=#{index}"
  
  # 2. On définit le chemin de stockage dans Rails
  filename = "art_#{index}_#{location_name.parameterize}.jpg"
  relative_path = "#{filename}"
  full_path = Rails.root.join('public', 'uploads', filename)

  begin
    # URI.open suit les redirections HTTP (301/302) automatiquement
    # On ajoute un User-Agent pour éviter d'être bloqué comme un robot
    URI.open(url, "User-Agent" => "RubyArtBot/1.0") do |image|
      # On vérifie l'URL finale après redirection si besoin
      # puts "Image récupérée de : #{image.base_uri}" 
      
      File.open(full_path, "wb") do |file|
        file.write(image.read)
      end
    end
    return relative_path
  rescue => e
    puts "❌ Erreur de téléchargement : #{e.message}"
    return nil
  end
end

def obtenir_nom_lieu(lat, lon)
  # Utilisation de Nominatim (OSM) pour trouver le nom du lieu
  url = "https://nominatim.openstreetmap.org/reverse?format=json&lat=#{lat}&lon=#{lon}&accept-language=en"
  uri = URI(url)
  # Note : Nominatim demande un User-Agent clair
  request = Net::HTTP::Get.new(uri)
  request["User-Agent"] = "MonProjetArtistique/1.0"
  
  response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(request) }
  data = JSON.parse(response.body)
  
  # On récupère la ville ou le village ou le monument
  data['address']['city'] || data['address']['town'] || data['address']['village'] || data['display_name'].split(',').first
rescue
  "Lieu Inconnu"
end





def verifier_et_generer_donnees_python(fichier_ly)
  script_python = "./lib/assets/analyse_partition.py" # Nom de votre script Python
  json_genere = "musique_data.json"

  puts "--- VÉRIFICATION DES DONNÉES ---"
  
  # 1. Lancement du script Python
  if File.exist?(script_python)
    puts "Lancement de l'analyse Python pour #{fichier_ly}..."
    # On exécute le script Python. 
    # On peut passer le nom du fichier .ly en argument si votre script Python le gère
    success = system("python3 #{script_python}") 
    
    if success && File.exist?(json_genere)
      # 2. Copie à la racine du projet (si le script n'y est pas déjà)
      # Chemin de destination (ici la racine '.')
      FileUtils.cp(json_genere, "./#{json_genere}")
      puts "✅ Données synchronisées à la racine."
    else
      puts "❌ Erreur lors de l'exécution de Python."
      exit
    end
  else
    puts "❌ Script Python introuvable (#{script_python})."
    exit
  end
end

def generer_projet_artistique(partition = "./lib/assets/waldstein.ly", style = "romantique", input_coords = "48.8,2.3 ; 45.7,4.8", nb_photos_demande = 10, projet_id = 1, radio_string = "")
  fichier_source =partition
  
  # On automatise l'appel Python avant de continuer
  #verifier_et_generer_donnees_python(fichier_source)

  # Chargement du JSON fraîchement copié
  music_data = JSON.parse(File.read('tmp/musique_data.json'))
  
  # --- STATISTIQUES ---
  nb_nuances = music_data['nuances'].length
  nb_alterations = music_data['alterations'].length
  
  puts "\n==============================================="
  puts "📊 STATS IMPORTÉES DE PYTHON"
  puts "Nuances : #{nb_nuances} | Altérations : #{nb_alterations}"
  puts "==============================================="

  # 1. Chargement des données
  unless File.exist?('musique_data.json')
    puts "Erreur: musique_data.json introuvable. Lancez d'abord le script Python."
    return
  end
  
  total_evenements = nb_nuances + nb_alterations

  puts "==============================================="
  puts "   ANALYSE DE LA PARTITION TERMINÉE"
  puts "==============================================="
  puts "🎵 Nuances détectées (\\p, \\f, \\cresc, etc.) : #{nb_nuances}"
  puts "🎹 Altérations (notes hors gamme)            : #{nb_alterations}"
  puts "✨ Total d'événements artistiques possibles  : #{total_evenements}"
  puts "==============================================="
  puts ""

  # 2. Questions utilisateur adaptées aux stats
  puts "--- CONFIGURATION DU PROJET ---"
  print "Époque / Style : "
  #style = style#gets.chomp

  puts "Entrez vos coordonnées GPS (ex: 48.8,2.3 ; 45.7,4.8) :"
  input_coords = input_coords.split(';').map(&:strip)
  my_radio_string = radio_string.split(';').map(&:strip)

  print "Combien de photos voulez-vous placer ? (Max conseillé: #{total_evenements}) : "
  #nb_photos_demande = gets.chomp.to_i

  # Sécurité : on ne peut pas demander plus de photos qu'il n'y a d'événements
  p [nb_photos_demande, total_evenements]
  nb_photos = [nb_photos_demande.to_i, total_evenements.to_i].min.to_i
  puts "Info : Le projet sera généré avec #{nb_photos} images."
  puts "Info : Le projet sera généré avec #{nb_photos} images." if nb_photos < nb_photos_demande.to_i

  # 3. Préparation et Tri
  p "==NUANCE et ALTERATIONS=="
  p (music_data['nuances'] + music_data['alterations'])
  evenements = (music_data['nuances'] + music_data['alterations']).sort_by do |e| 
    [e['measure'], e['beat']] 
  end.first(nb_photos)

  # ... (La suite du code de création Rails reste la même)
  
  # 4. Création du Conducteur
  projet=ProjetArtistique.find(projet_id)
  conducteur = Conducteur.create!(title: "Projet #{style}", username: "Admin")
  projet.update(conducteur_id: conducteur.id)

  # ... (Chargement JSON et Questions précédentes) ...

  # Préparation du dossier de destination
  upload_dir = Rails.root.join('public', 'uploads')
  FileUtils.mkdir_p(upload_dir) unless Dir.exist?(upload_dir)
  # ... (Chargement JSON et statistiques précédentes) ...


  evenements.each_with_index do |evt, i|
    current_gps = input_coords[i % input_coords.length]
    lat, lon = current_gps.split(',').map(&:strip)

    # 1. On trouve le nom du lieu
    nom_lieu = obtenir_nom_lieu(lat, lon)
    puts "📍 Lieu détecté : #{nom_lieu} (#{current_gps})"

    # 2. On définit une recherche d'image (Collection)
    # Ici, on utilise l'API Unsplash (ou une recherche simulée par URL)
    # Pour un usage réel sans clé API, on peut utiliser des sources de photos libres.
    # On va chercher une image différente pour chaque événement lié au même lieu
    image_search_term = "#{nom_lieu} architecture landscape".gsub(' ', '+')
    # On utilise un service comme LoremFlickr ou Unsplash Source pour varier les images
    image_url = "https://loremflickr.com/800/600/#{image_search_term}?lock=#{i}"
    file_name = download_collection_image(nom_lieu, i)





    # On identifie si c'est une nuance ou une altération pour le technicien
    est_nuance = evt.key?('type')
    label = est_nuance ? "NUANCE #{evt['type']}" : "ALTÉRATION (#{evt['note']})"
    
    current_gps = input_coords[i % input_coords.length]

    # 4. Enregistrement dans la base de données
    # On enregistre le chemin relatif pour que Rails puisse l'afficher via /uploads/nom.jpg
    # Extraction de l'URL de la radio actuelle
    my_current_radio = my_radio_string[i % my_radio_string.length].strip
    
    # Définition du nom de fichier pour le son
    sound_file_name = "radio_#{i}_#{Time.now.to_i}.mp3"
    sound_path = Rails.root.join('public', 'uploads', sound_file_name)
    
    # Exécution de l'enregistrement (15 secondes)
    # On utilise 'timeout 15' pour couper wget après 15 secondes
    # L'option -O force la sortie vers le fichier spécifié
    #hellothere=`timeout 15 wget #{my_current_radio} -O #{sound_path} > /dev/null 2>&1`
    hellothere=`timeout 15 wget #{my_current_radio} -O #{sound_path}`
    
    # Création de la ligne du conducteur
    conducteur.conducteurlines.create!(
      notes_technicien: "Lieu : #{nom_lieu} (#{current_gps})",
      interpretes: evt.key?('type') ? "Nuance: #{evt['type']}" : "Note: #{evt['note']}",
      videoprojection: "#{file_name}", # Votre image
      son: "#{sound_file_name}",  # Ajout de l'enregistrement radio
      sequenceaction: "Changement visuel n°#{i+1} + Captation Radio",
      lumieres_ambiante: evt.key?('type') ? "Nuance" : "Altération",
      lumieres_effet: evt.key?('type') ? "Effet Dynamique" : "Teinte Harmonique",
      duree: "Mes. #{evt['measure']} Temps #{evt['beat']}"
    )
    # 4. Enregistrement dans le conducteur
    #return conducteur
    #conducteur.conducteurlines.create!(
    #  notes_technicien: "#{label} - GPS: #{current_gps}",
    #  videoprojection: "Image #{i+1} - Localisation #{current_gps}",
    #  lumieres_ambiante: est_nuance ? "Couleur selon nuance" : "Couleur de tension",
    #  duree: "M.#{evt['measure']} T.#{evt['beat']}",

    #)
  end


  puts "\n✅ Terminé ! #{nb_photos} lignes créées dans le conducteur."
  return conducteur
end
