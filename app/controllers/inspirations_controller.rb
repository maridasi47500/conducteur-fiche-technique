
class InspirationsController < ApplicationController
  def hub
    @inspiration_resources = InspirationResource.all
    @conducteurs = Conducteur.all
  end
end
