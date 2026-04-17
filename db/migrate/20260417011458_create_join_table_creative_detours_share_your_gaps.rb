class CreateJoinTableCreativeDetoursShareYourGaps < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :share_your_gaps do |t|
      t.index [:creative_detour_id, :share_your_gap_id], name: 'idx_detour_share_your_gap'
    end

  end
end
