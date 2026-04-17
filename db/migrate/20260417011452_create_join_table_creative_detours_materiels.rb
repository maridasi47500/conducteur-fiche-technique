class CreateJoinTableCreativeDetoursMateriels < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :materiels do |t|
      t.index [:creative_detour_id, :materiel_id], name: 'idx_detour_materiel'
    end

  end
end
