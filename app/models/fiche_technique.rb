class FicheTechnique < ApplicationRecord
has_many :materiel_necessaires
has_many :plan_de_scene_dessins
accepts_nested_attributes_for :plan_de_scene_dessins, allow_destroy: true
end
