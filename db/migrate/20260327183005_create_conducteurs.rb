class CreateConducteurs < ActiveRecord::Migration[7.1]
  def change
    create_table :conducteurs do |t|
      t.string :title
      t.string :username

      t.timestamps
    end
  end
end
