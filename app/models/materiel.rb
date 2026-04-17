# app/models/materiel.rb
class Materiel < ApplicationRecord
  # Exemple de validations cohérentes avec votre schéma
  validates :name, presence: true
  validates :maximum, numericality: { only_integer: true, greater_than: 0 }
  belongs_to :zone, optional: true
  has_many :metier_dependencies
  
  # Valeurs par défaut si non renseignées
  def safe_x_pref; x_pref || 50; end
  def safe_spread; spread || 20; end
  has_many :materiel_necessaires
  

  
  # Scope pour filtrer rapidement le matériel électrique
  scope :electrique, -> { where(requires_power: true) }
end
