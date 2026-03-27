class CreateMaterielNecessaires < ActiveRecord::Migration[7.1]
  def change
    create_table :materiel_necessaires do |t|
      t.string :fiche_technique_id
      t.string :materiel_id
      t.string :quantite
      t.string :precisions_observations

      t.timestamps
    end
  end
end
