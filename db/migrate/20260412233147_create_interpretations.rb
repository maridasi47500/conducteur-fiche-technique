class CreateInterpretations < ActiveRecord::Migration[7.1]
  def change
    create_table :interpretations do |t|
      t.integer :conducteur_id
      t.string :machine_analysis
      t.string :human_judgment
      t.string :the_gap
      t.string :artistic_truth

      t.timestamps
    end
  end
end
