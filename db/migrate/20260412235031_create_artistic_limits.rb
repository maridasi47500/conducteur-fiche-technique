class CreateArtisticLimits < ActiveRecord::Migration[7.1]
  def change
    create_table :artistic_limits do |t|
      t.integer :conducteur_id
      t.string :what_i_want
      t.string :why_untranslatable
      t.string :contradiction
      t.string :emotional_truth
      t.string :left_unintentional

      t.timestamps
    end
  end
end
