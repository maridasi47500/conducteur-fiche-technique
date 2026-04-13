class CreateArtisticProcesses < ActiveRecord::Migration[7.1]
  def change
    create_table :artistic_processes do |t|
      t.integer :conducteur_id
      t.string :initial_impulse
      t.string :first_attempt
      t.string :doubts_questions
      t.string :rejected_ideas
      t.string :breakthrough
      t.string :final_form
      t.integer :iteration_count
      t.string :what_changed

      t.timestamps
    end
  end
end
