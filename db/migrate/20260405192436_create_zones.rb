class CreateZones < ActiveRecord::Migration[7.1]
  def change
    create_table :zones do |t|
      t.string :name
      t.integer :y_min
      t.integer :y_max

      t.timestamps
    end
  end
end
