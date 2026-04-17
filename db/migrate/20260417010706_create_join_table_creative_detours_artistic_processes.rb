class CreateJoinTableCreativeDetoursArtisticProcesses < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :artistic_processes do |t|
      t.index [:creative_detour_id, :artistic_process_id], name: 'idx_detour_process'
    end
  end
end
