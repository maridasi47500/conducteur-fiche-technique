class CreateJoinTableCreativeDetoursEmotionalMarkers < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :emotional_markers do |t|
      t.index [:creative_detour_id, :emotional_marker_id], name: 'idx_detour_marker'
    end
  end
end
