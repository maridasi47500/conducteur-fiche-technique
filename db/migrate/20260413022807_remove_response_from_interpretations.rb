class RemoveResponseFromInterpretations < ActiveRecord::Migration[7.1]
  def change
    remove_column :interpretations, :response, :string
  end
end
