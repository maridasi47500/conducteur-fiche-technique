class AddStatusToProjetArtistique < ActiveRecord::Migration[7.1]
  def change
    add_column :projet_artistiques, :status, :string
    add_column :projet_artistiques, :style, :string
  end
end
