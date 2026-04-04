# app/jobs/generate_art_project_job.rb
require "./lib/assets/projet_artistique"

class GenerateArtProjectJob < ApplicationJob
  queue_as :default

  def perform(project_id, partition_content, coords_string, style,nbphotos)
    project = ProjetArtistique.find(project_id)
    
    # 1. Créer le fichier .ly temporaire
    temp_ly = Rails.root.join('tmp', "input_#{project.id}.ly")
    File.write(temp_ly, partition_content)

    # 2. Lancer Python
    python_script = Rails.root.join('lib', 'assets', 'analyse_partition.py')
    x=`python3 #{python_script} #{temp_ly}`

    # 3. Lire le JSON et générer les lignes (votre logique Ruby)
    music_data = JSON.parse(File.read(Rails.root.join('tmp', 'musique_data.json')))
    
    # Appel de votre logique de téléchargement d'images et création de conducteur...
    # (On réutilise ici les méthodes obtenir_nom_lieu_en et download_art_image)
    generer_projet_artistique(partition = temp_ly, style = style, input_coords = coords_string,nb_photos_demande = nbphotos)
    
    # 4. Marquer le projet comme terminé
    project.update(status: 'completed')
  ensure
    File.delete(temp_ly) if File.exist?(temp_ly)
  end
end
