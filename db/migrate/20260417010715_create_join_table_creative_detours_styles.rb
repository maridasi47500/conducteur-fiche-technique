class CreateJoinTableCreativeDetoursStyles < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :styles do |t|
      t.index [:creative_detour_id, :style_id], name: 'idx_detour_style'
    end
  end
end
