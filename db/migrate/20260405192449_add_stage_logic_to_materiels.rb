class AddStageLogicToMateriels < ActiveRecord::Migration[7.1]
  def change
    add_reference :materiels, :zone, foreign_key: true
  end
end
