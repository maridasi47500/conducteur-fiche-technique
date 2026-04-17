class CreateJoinTableCreativeDetoursDirectiveArtistiques < ActiveRecord::Migration[7.1]
  def change
    create_join_table :creative_detours, :directive_artistiques do |t|
      t.index [:creative_detour_id, :directive_artistique_id], name: "idx_detour_directive"
      t.index [:directive_artistique_id, :creative_detour_id], name: "idx_directive_detour"
    end
  end
end

