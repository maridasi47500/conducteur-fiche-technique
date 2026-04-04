class ProjetArtistique < ApplicationRecord
paginates_per 10
belongs_to :fiche_technique, optional: true
belongs_to :conducteur, optional: true
end
