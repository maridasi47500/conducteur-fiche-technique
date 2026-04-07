class CreateConducteurhasmarkers < ActiveRecord::Migration[7.1]
  def change
    create_table :conducteurhasmarkers do |t|
      t.integer :conducteur_id
      t.integer :emotional_marker_id

      t.timestamps
    end
  end
end
