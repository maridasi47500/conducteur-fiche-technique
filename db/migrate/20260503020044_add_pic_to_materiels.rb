class AddPicToMateriels < ActiveRecord::Migration[7.1]
  def change
    add_column :materiels, :pic, :string
  end
end
