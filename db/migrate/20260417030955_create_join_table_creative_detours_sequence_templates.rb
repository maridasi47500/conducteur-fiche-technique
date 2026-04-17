class CreateJoinTableCreativeDetoursSequenceTemplates < ActiveRecord::Migration[7.1]
  def change
    create_join_table :creative_detours, :sequence_templates do |t|
      t.index [:creative_detour_id, :sequence_template_id], name: "idx_detour_sequence_template"
      t.index [:sequence_template_id, :creative_detour_id], name: "idx_sequence_template_detour"
    end
  end
end

