class CreateJoinTableCreativeDetoursFicheTechniques < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :fiche_techniques do |t|
      t.index [:creative_detour_id, :fiche_technique_id], name: 'idx_detour_fiche'
    end
  end
end
