class Conducteur < ApplicationRecord
  paginates_per 10
has_one :projet_artistique
has_many :conducteurlines
has_and_belongs_to_many :emotional_markers, :join_table => :conducteurhasmarkers
accepts_nested_attributes_for :conducteurlines, allow_destroy: true
belongs_to :fiche_technique

end
