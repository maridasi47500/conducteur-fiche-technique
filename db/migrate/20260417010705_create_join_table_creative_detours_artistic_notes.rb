class CreateJoinTableCreativeDetoursArtisticNotes < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :artistic_notes do |t|
      t.index [:creative_detour_id, :artistic_note_id], name: 'idx_detour_note'
    end
  end
end
