class CreateJoinTableCreativeDetoursThemeSuggestions < ActiveRecord::Migration[7.1]
  def change
create_join_table :creative_detours, :theme_suggestions do |t|
      # On indexe pour optimiser la recherche de thèmes par détour
      t.index [:creative_detour_id, :theme_suggestion_id], name: "idx_detour_theme_suggestion"
      
      # On indexe aussi l'inverse pour les statistiques ou les recherches inverses
      t.index [:theme_suggestion_id, :creative_detour_id], name: "idx_theme_suggestion_detour"
    end
  end
end
