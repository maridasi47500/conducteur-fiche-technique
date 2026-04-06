class ProjetArtistique < ApplicationRecord
attr_accessor :useia, :instrument_principal_id
paginates_per 10
belongs_to :fiche_technique, optional: true
belongs_to :conducteur, optional: true
end
