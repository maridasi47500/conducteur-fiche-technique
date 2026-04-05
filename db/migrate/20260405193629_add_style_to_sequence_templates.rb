class AddStyleToSequenceTemplates < ActiveRecord::Migration[7.1]
  def change
    add_reference :sequence_templates, :style, null: false, foreign_key: true
  end
end
