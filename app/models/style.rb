class Style < ApplicationRecord
  has_many :ambiance_options, dependent: :destroy
  has_many :sequence_templates
  has_many :projet_artistiques, foreign_key: :style, primary_key: :name # Si tu relies par le nom

  # Méthodes pratiques pour retrouver les options par type
  def lights
    ambiance_options.where(category: 'lumieres').pluck(:value)
  end

  def fog_settings
    ambiance_options.where(category: 'brouillard').pluck(:value)
  end
end

