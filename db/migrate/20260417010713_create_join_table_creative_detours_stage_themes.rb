class CreateJoinTableCreativeDetoursStageThemes < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :stage_themes do |t|
      t.index [:creative_detour_id, :stage_theme_id], name: 'idx_detour_theme'
    end
  end
end
