class CreateJoinTableCreativeDetoursArtisticLimits < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :artistic_limits do |t|
      t.index [:creative_detour_id, :artistic_limit_id], name: 'idx_detour_artistic_limit'
    end

  end
end
