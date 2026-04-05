class AddZoneYToMateriel < ActiveRecord::Migration[7.1]
  def change
    add_column :materiels, :zone_y, :string
    add_column :materiels, :power_needed, :boolean
  end
end
