class CreateAmbianceOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :ambiance_options do |t|
      t.references :style, null: false, foreign_key: true
      t.string :category
      t.string :value

      t.timestamps
    end
  end
end
