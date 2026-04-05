
# app/models/ambiance_option.rb
class AmbianceOption < ApplicationRecord
  belongs_to :style
  validates :category, inclusion: { in: %w(lumieres machine_brouillard) }
end
