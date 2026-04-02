class AddOrdreToConducteurlines < ActiveRecord::Migration[7.1]
  def change
    add_column :conducteurlines, :ordre, :string
  end
end
