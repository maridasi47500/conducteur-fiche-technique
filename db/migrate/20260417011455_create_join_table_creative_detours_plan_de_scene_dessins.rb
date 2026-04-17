class CreateJoinTableCreativeDetoursPlanDeSceneDessins < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :plan_de_scene_dessins do |t|
      t.index [:creative_detour_id, :plan_de_scene_dessin_id], name: 'idx_detour_plan_de_scene_dessin'
    end

  end
end
