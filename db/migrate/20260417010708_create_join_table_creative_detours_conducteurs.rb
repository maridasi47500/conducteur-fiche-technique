class CreateJoinTableCreativeDetoursConducteurs < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :conducteurs do |t|
      t.index [:creative_detour_id, :conducteur_id], name: 'idx_detour_conducteur'
    end
  end
end
