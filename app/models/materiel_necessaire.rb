class MaterielNecessaire < ApplicationRecord
belongs_to :fiche_technique
belongs_to :materiel
end
