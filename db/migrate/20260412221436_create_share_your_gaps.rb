class CreateShareYourGaps < ActiveRecord::Migration[7.1]
  def change
    create_table :share_your_gaps do |t|
      t.string :conducteur_id
      t.string :analysis
      t.string :response
      t.string :interpretation

      t.timestamps
    end
  end
end
