class CreateCreativeDetours < ActiveRecord::Migration[7.1]
  def change
  create_table :creative_detours do |t|
      t.string :title          # Titre de l'expérience (ex: "La Loterie de l'Écart")
      t.text :concept          # L'idée théorique (ex: "Collision organique/numérique")
      t.text :action           # Ce que les artistes font sur scène
      t.text :database_usage   # Comment la base de données est sollicitée
      t.text :reaction         # La réponse de l'humain face à la donnée
      t.text :storage_impact   # Ce qu'on enregistre après (la trace de l'écart)
      t.string :challenge      # Le défi lancé à l'Intelligence Artistique
      t.timestamps
  end
  end
end
