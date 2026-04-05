class AddSpreadToMateriel < ActiveRecord::Migration[7.1]
  def change
    add_column :materiels, :spread, :string
    add_column :materiels, :x_pref, :string
  end
end
