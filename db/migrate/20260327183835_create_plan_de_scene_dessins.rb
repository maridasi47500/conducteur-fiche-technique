class CreatePlanDeSceneDessins < ActiveRecord::Migration[7.1]
  def change
    create_table :plan_de_scene_dessins do |t|
      t.string :fiche_technique_id
      t.string :disposition
      t.string :materiel_musicien
      t.string :ordre

      t.timestamps
    end
  end
end
