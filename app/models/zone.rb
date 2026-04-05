class Zone < ApplicationRecord
  has_many :materiels
  validates :name, presence: true
  # y_min et y_max permettent de définir la tranche (ex: 0 à 30)
end
