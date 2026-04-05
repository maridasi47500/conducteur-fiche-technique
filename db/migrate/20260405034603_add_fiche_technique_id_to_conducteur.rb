class AddFicheTechniqueIdToConducteur < ActiveRecord::Migration[7.1]
  def change
    add_column :conducteurs, :fiche_technique_id, :string
  end
end
