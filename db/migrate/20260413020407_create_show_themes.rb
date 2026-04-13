class CreateShowThemes < ActiveRecord::Migration[7.1]
  def change
    create_table :show_themes do |t|
      t.integer :projet_artistique_id
      t.string :title
      t.string :philosophical_inquiry
      t.string :emotional_frequency
      t.string :ai_blind_spot

      t.timestamps
    end
  end
end
