class CreateFicheTechniques < ActiveRecord::Migration[7.1]
  def change
    create_table :fiche_techniques do |t|
      t.string :name_event
      t.string :eleve_responsable
      t.string :date
      t.string :professeur_referent
      t.string :notes_complementaires

      t.timestamps
    end
  end
end
