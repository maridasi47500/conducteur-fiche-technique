class CreateThemeSuggestions < ActiveRecord::Migration[7.1]
  def change
    create_table :theme_suggestions do |t|
      t.string :category
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
