
class InspirationsController < ApplicationController
  def hub
    @inspiration_resources = InspirationResource.all
    @conducteurs = Conducteur.all
  end

  def database_art
    @conducteurs = Conducteur.all
    @conducteurlines = Conducteurline.all
    @emotional_markers = EmotionalMarker.all
    @directive_artistiques = DirectiveArtistique.all
    @inspiration_resources = InspirationResource.all
  end
end
