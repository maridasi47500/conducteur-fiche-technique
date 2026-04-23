class AddEtatToCOnducteurlines < ActiveRecord::Migration[7.1]
  def change
    add_column :conducteurlines, :etat, :string
  end
end
