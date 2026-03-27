class CreateConducteurlines < ActiveRecord::Migration[7.1]
  def change
    create_table :conducteurlines do |t|
      t.string :conducteur_id
      t.time :duree
      t.string :sequenceaction
      t.string :interpretes
      t.string :lumieres_ambiante
      t.string :lumieres_effet
      t.string :machine_brouillard
      t.string :videoprojection
      t.string :notes_technicien

      t.timestamps
    end
  end
end
