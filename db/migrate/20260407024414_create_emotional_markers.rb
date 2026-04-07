class CreateEmotionalMarkers < ActiveRecord::Migration[7.1]
  def change
    create_table :emotional_markers do |t|
      t.string :name

      t.timestamps
    end
  end
end
