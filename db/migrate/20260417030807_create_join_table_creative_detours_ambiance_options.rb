class CreateJoinTableCreativeDetoursAmbianceOptions < ActiveRecord::Migration[7.1]
  def change

    create_join_table :creative_detours, :ambiance_options do |t|
      t.index [:creative_detour_id, :ambiance_option_id], name: "idx_detour_ambiance"
      t.index [:ambiance_option_id, :creative_detour_id], name: "idx_ambiance_detour"
    end
  end
end
