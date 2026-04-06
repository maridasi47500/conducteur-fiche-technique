class Conducteur < ApplicationRecord
  paginates_per 10
has_many :conducteurlines
accepts_nested_attributes_for :conducteurlines, allow_destroy: true
belongs_to :fiche_technique

end
