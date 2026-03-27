class CreateMateriels < ActiveRecord::Migration[7.1]
  def change
    create_table :materiels do |t|
      t.string :name

      t.timestamps
    end
  end
end
