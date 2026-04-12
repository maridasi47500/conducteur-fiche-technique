class CreateArtisticNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :artistic_notes do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
