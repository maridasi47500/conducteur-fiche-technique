class ColonnesPourPlanDeScene < ActiveRecord::Migration[7.1]
  def change
# Migration pour enrichir le modèle Materiel
add_column :materiels, :category, :string      # 'instrument', 'audio', 'accessoire', 'lumiere'
add_column :materiels, :default_layer, :string # 'back', 'center', 'front'
add_column :materiels, :requires_power, :boolean, default: false
add_column :materiels, :is_bundle, :boolean, default: false # ex: la batterie est un bundle
# Migration pour le placement X,Y
add_column :plan_de_scene_dessins, :coord_x, :integer # 0 à 100
add_column :plan_de_scene_dessins, :coord_y, :integer # 0 (fond) à 100 (bord scène)
add_column :plan_de_scene_dessins, :layer, :string   # 'back', 'mid', 'front'
  end
end
