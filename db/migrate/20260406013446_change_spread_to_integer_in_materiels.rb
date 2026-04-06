class ChangeSpreadToIntegerInMateriels < ActiveRecord::Migration[7.1]
  def change
  # On précise 'using: "spread::integer"' pour la conversion PostgreSQL si besoin
  change_column :materiels, :spread, :integer
  change_column :materiels, :x_pref, :integer
  end
end
