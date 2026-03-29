class AddSonToConducteurline < ActiveRecord::Migration[7.1]
  def change
    add_column :conducteurlines, :son, :string
  end
end
