class AddStarredToConducteur < ActiveRecord::Migration[7.1]
  def change
    add_column :conducteurs, :starred, :boolean
  end
end
