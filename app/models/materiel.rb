# app/models/materiel.rb
class Materiel < ApplicationRecord
  belongs_to :zone, optional: true
  has_many :metier_dependencies
  
  # Valeurs par défaut si non renseignées
  def safe_x_pref; x_pref || 50; end
  def safe_spread; spread || 20; end
end
