require "./lib/assets/projet_artistique"
class ProjetsController < ApplicationController
  def new
    @villes_suggestions = {
      "Paris" => "48.8566,2.3522", "London" => "51.5074,-0.1278",
      "New York" => "40.7128,-74.0060",
      "Tokyo" => "35.6895,139.6917",
      "Berlin" => "52.5200,13.4050",
      "Rome" => "41.9028,12.4964"
      # Ajoutez vos 30 villes ici...
    }
  end

  # app/controllers/projets_controller.rb
  def create
    @projet = ProjetArtistique.create(status: 'processing', style: params[:style])
  
    # On lance le job et on rend la main immédiatement à l'utilisateur
    GenerateArtProjectJob.perform_later(
      @projet.id, 
      params[:partition_ly], 
      params[:coords], 

      params[:style],
      params[:nb_photos]
    )
  
    redirect_to projet_artistique_path(@projet), notice: "Analyse en cours... cette page s'actualisera automatiquement."
  end
end
