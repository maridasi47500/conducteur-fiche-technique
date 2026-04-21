class CreateMachineLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :machine_logs do |t|
      t.string :level
      t.string :module
      t.string :raw_data
      t.string :fb_translation
      t.string :human_perspective

      t.timestamps
    end
  end
end
