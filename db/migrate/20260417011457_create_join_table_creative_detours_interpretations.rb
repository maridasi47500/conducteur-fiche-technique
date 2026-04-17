class CreateJoinTableCreativeDetoursInterpretations < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :interpretations do |t|
      t.index [:creative_detour_id, :interpretation_id], name: 'idx_detour_interpretation'
    end

  end
end
