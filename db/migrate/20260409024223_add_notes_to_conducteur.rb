class AddNotesToConducteur < ActiveRecord::Migration[7.1]
  def change
    add_column :conducteurs, :notes, :string
  end
end
