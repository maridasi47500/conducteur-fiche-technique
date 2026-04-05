class CreateSequenceTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :sequence_templates do |t|
      t.string :label
      t.string :phase
      t.string :target_talent
      t.string :suggested_light
      t.string :intensity

      t.timestamps
    end
  end
end
