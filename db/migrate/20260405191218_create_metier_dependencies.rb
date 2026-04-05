class CreateMetierDependencies < ActiveRecord::Migration[7.1]
  def change
    create_table :metier_dependencies do |t|
      t.integer :materiel_id
      t.integer :required_item_id
      t.integer :qty_multiplier
      t.string :note

      t.timestamps
    end
  end
end
