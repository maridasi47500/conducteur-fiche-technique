class CreateInspirationResources < ActiveRecord::Migration[7.1]
  def change
    create_table :inspiration_resources do |t|
      t.string :title
      t.string :url
      t.string :category

      t.timestamps
    end
  end
end
