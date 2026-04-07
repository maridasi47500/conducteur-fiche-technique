class AddTempoRangeToConducteurs < ActiveRecord::Migration[7.1]
  def change
    add_column :conducteurs, :tempo_range, :string
  end
end
