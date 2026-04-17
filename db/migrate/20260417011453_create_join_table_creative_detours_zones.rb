class CreateJoinTableCreativeDetoursZones < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :zones do |t|
      t.index [:creative_detour_id, :zone_id], name: 'idx_detour_zone'
    end

  end
end
