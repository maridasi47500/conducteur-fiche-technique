class CreateConducteurLinePositions < ActiveRecord::Migration[7.1]
  def change
    create_table :conducteur_line_positions do |t|
      t.references :conducteurline, null: false, foreign_key: true
      t.references :materiel, null: false, foreign_key: true
      t.string :coord_x
      t.string :coord_y
      t.string :transition_type

      t.timestamps
    end
  end
end
