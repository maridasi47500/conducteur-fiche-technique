json.extract! fiche_technique, :id, :name_event, :eleve_responsable, :date, :professeur_referent, :notes_complementaires, :created_at, :updated_at
json.url fiche_technique_url(fiche_technique, format: :json)
