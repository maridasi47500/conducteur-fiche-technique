def generer_spectacle_complet(projet_id)
  projet = ProjetArtistique.find(projet_id)
  style = Style.find_by(name: projet.style)
  
  # --- ÉTAPE 1 : Créer la Fiche Technique ---
  fiche = FicheTechnique.create!(name_event: projet.title)
  projet.update(fiche_technique: fiche)

  # --- ÉTAPE 2 : Ajouter le matériel et gérer les quantités (MetierDependencies) ---
  # Imaginons que l'utilisateur a choisi une "Batterie"
  instrument_principal = Materiel.find_by(name: "batterie")
  MaterielNecessaire.create!(fiche_technique: fiche, materiel: instrument_principal, quantite: 1)

  # L'IA ajoute les dépendances automatiquement
  MetierDependency.where(materiel: instrument_principal).each do |dep|
    item_requis = Materiel.find(dep.required_item_id)
    MaterielNecessaire.create!(
      fiche_technique: fiche, 
      materiel: item_requis, 
      quantite: dep.qty_multiplier,
      precisions_observations: "Auto: Requis pour #{instrument_principal.name}"
    )
  end

  # --- ÉTAPE 3 : Placer les trucs sur la scène (Zones & Materiels) ---
  fiche.materiel_necessaires.each do |mn|
    mat = mn.materiel
    zone = mat.zone # On utilise la table Zone liée au matériel
    
    mn.quantite.times do
      x = (mat.x_pref.to_i + rand(-mat.spread.to_i..mat.spread.to_i)).clamp(5, 95)
      y = rand(zone.y_min..zone.y_max)
      
      PlanDeSceneDessin.create!(
        fiche_technique: fiche,
        materiel_musicien: mat.name,
        coord_x: x, coord_y: y,
        layer: zone.name
      )
    end
  end

  # --- ÉTAPE 4 : Créer le Conducteur (SequenceTemplates & AmbianceOptions) ---
  conducteur = Conducteur.create!(fiche_technique: fiche, title: "Conducteur #{projet.title}")
  projet.update(conducteur: conducteur)

  # On récupère les templates d'actions pour ce style (Rock ou Jazz)
  templates = SequenceTemplate.where(style: style).order(:phase)

  templates.each_with_index do |temp, index|
    # On pioche une lumière cohérente dans AmbianceOptions
    lumiere = style.ambiance_options.where(category: "lumieres").sample&.value || "blanc"
    brouillard = style.ambiance_options.where(category: "machine_brouillard").sample&.value || "non"

    Conducteurline.create!(
      conducteur: conducteur,
      ordre: index + 1,
      sequenceaction: temp.label,      # "Que font les acteurs" (ex: Solo)
      lumieres_ambiante: lumiere,      # "Que font les lumières"
      machine_brouillard: brouillard,  # "Que fait le brouillard"
      duree: "00:02:00"
    )
  end
end
# db/seeds.rb - expand with research links
InspirationResource.find_or_create_by!(
  title: "Stage Lighting for Dance",
  url: "https://illuminated-integration.com/blog/stage-lighting-for-dance/",
  category: "Stage Lighting"
)

InspirationResource.find_or_create_by!(
  title: "How do emotions in music work?",
  url: "https://www.ted.com/talks",
  category: "Music Theory"
)

InspirationResource.find_or_create_by!(
  title: "Conducting technique masterclass",
  url: "https://www.youtube.com/results?search_query=conducting+masterclass",
  category: "Conducting Technique"
)
