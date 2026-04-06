class MonProjetArtistique
  def initialize(projet)
    @projet = projet
  end


  def generer_spectacle_complet
    return "spectacle avec IA annulé" if @projet.useia != "1"

    projet = @projet
    style = Style.find_by(name: projet.style)
    
    # --- ÉTAPE 1 : Créer la Fiche Technique ---
    fiche = FicheTechnique.create!(name_event: projet.title)
    projet.update(fiche_technique: fiche)
  
    # --- ÉTAPE 2 : Ajouter le matériel et gérer les quantités (MetierDependencies) ---
    # Imaginons que l'utilisateur a choisi une "Batterie"
    instrument_principal = Materiel.find(projet.instrument_principal_id)
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
      
      mn.quantite.to_i.times do
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
    ["Tous","Danseur/se","Chanteur/se","Musicien/ne","Acteur/ce"].each do |metier| 
      # 1. On pioche UNE intro au hasard parmi les intros possibles
      intro = SequenceTemplate.where(style: style, phase: "intro",target_talent: metier).sample
      
      # 2. On pioche DEUX moments de "corps" (body) au hasard
      milieux = SequenceTemplate.where(style: style, phase: "body",target_talent: metier).sample(2)
      
      # 3. On pioche UNE sortie
      outro = SequenceTemplate.where(style: style, phase: "outro",target_talent: metier).sample

      # 4. On assemble le tout dans un tableau ordonné
      mon_scenario = [intro] + milieux + [outro]

      # 5. On crée les lignes du conducteur dans l'ordre du tableau
      next if mon_scenario.length == 0
      mon_scenario.each_with_index do |temp, index|
        next if temp.nil? # Sécurité si une phase est vide
        
        Conducteurline.create!(
          conducteur: conducteur,
          ordre: index + 1,
          sequenceaction: temp.label,
          lumieres_ambiante: style.ambiance_options.where(category: "lumieres").sample&.value || "blanc",
          machine_brouillard: style.ambiance_options.where(category: "machine_brouillard").sample&.value || "non",
          duree: "00:02:00"
        )
      end
    end
end
  
  end

end

