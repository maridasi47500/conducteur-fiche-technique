class CreateProjetArtistiques < ActiveRecord::Migration[7.1]
  def change
    create_table :projet_artistiques do |t|
      t.integer :fiche_technique_id
      t.integer :conducteur_id
      t.string :title
      t.string :username

      t.timestamps
    end
  end
end
