class CreateJoinTableCreativeDetoursInspirationResources < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :inspiration_resources do |t|
      t.index [:creative_detour_id, :inspiration_resource_id], name: 'idx_detour_resource'
    end
  end
end
