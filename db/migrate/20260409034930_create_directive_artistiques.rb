class CreateDirectiveArtistiques < ActiveRecord::Migration[7.1]
  def change
    create_table :directive_artistiques do |t|
      t.string :name
      t.references :stage_theme, null: false, foreign_key: true
      t.string :default_lumieres_ambiante
      t.string :default_lumieres_effet
      t.string :default_videoprojection
      t.string :default_son
      t.string :default_notes_technicien
      t.string :default_sequenceaction
      t.time :default_duree
      t.string :default_interpretes

      t.timestamps
    end
  end
end
