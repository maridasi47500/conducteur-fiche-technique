class CreateConducteurhasthemes < ActiveRecord::Migration[7.1]
  def change
    create_table :conducteurhasthemes do |t|
      t.integer :conducteur_id
      t.integer :stage_theme_id

      t.timestamps
    end
  end
end
