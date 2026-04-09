class CreateStageThemes < ActiveRecord::Migration[7.1]
  def change
    create_table :stage_themes do |t|
      t.string :name

      t.timestamps
    end
  end
end
