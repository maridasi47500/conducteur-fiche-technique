class AddOnStageToMateriel < ActiveRecord::Migration[7.1]
  def change
    add_column :materiels, :on_stage, :boolean
    add_column :materiels, :maximum, :integer
  end
end
