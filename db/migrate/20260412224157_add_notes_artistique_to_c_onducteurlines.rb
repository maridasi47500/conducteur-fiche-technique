class AddNotesArtistiqueToCOnducteurlines < ActiveRecord::Migration[7.1]
  def change
    add_column :conducteurlines, :notes_artistique, :string
    add_column :conducteurlines, :creative_notes, :string
    add_column :conducteurlines, :emotional_marker_id, :integer
  end
end
