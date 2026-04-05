def time_rand from = 0.0, to = Time.now

  Time.at(from + rand * (to.to_f - from.to_f))

end

   ["chaises", "pupitres", "piano numerique", "percussion", "xylophone", "batterie", "ampli basse", "ampli guitare", "micros", "retour de scene (monitor)", "ecran/videoprojecteur", "praticable (estrade)","branchement ordinateur", "autre"].each do |genre_name|

     Materiel.find_or_create_by!(name: genre_name)

   end

Materiel.all.update_all(maximum: 10, on_stage: true)

Materiel.find_by(name: "branchement ordinateur").update(on_stage: false, maximum: 1)

Materiel.find_by(name: "ecran/videoprojecteur").update(on_stage: false, maximum: 1)

Materiel.find_by(name: "praticable (estrade)").update(on_stage: true, maximum: 1)

Materiel.find_by(name: "retour de scene (monitor)").update(on_stage: true, maximum: 4)

Materiel.find_by(name: "ampli basse").update(on_stage: true, maximum: 2)
MATERIEL_DATA = {
  "batterie" => { zone_y: "back", power_needed: true },
  "micros"   => { zone_y: "front", power_needed: false },
  "ampli"    => { zone_y: "back", power_needed: true }
}
MATERIEL_DATA.for_each do |name, data|
    Materiel.find_by(name: name).update(power_needed: data["power_needed"], zone_y: data["zone_y"])
end



fichetechnique=FicheTechnique.create(name_event: (0...8).map{65.+(rand(26)).chr}.join, eleve_responsable: (0...8).map{65.+(rand(26)).chr}.join, date: time_rand(Time.local(1970, 1, 1)), professeur_referent: (0...8).map{65.+(rand(26)).chr}.join,notes_complementaires: "dkjfugh")

toutmateriel=[]

nombremateriel=0

Materiel.all.sample(rand(1..Materiel.all.length)).each do |g|

nombre = rand(1..g.maximum)

nombremateriel+=nombre


materielnecessaire=MaterielNecessaire.create(fiche_technique_id: fichetechnique.id, materiel_id: g.id, quantite: nombre,precisions_observations: "")

toutmateriel.push([materielnecessaire,nombre])

end

ordrearray=(1..nombremateriel).to_a

toutmateriel.each do |materiel, nombre|

next if !materiel.materiel.on_stage

nombre.times do

ordreitem=ordrearray.sample

ordrearray.delete(ordreitem)

dessin=PlanDeSceneDessin.create(fiche_technique_id: fichetechnique.id, ordre: ordreitem, materiel_musicien: materiel.materiel.name, disposition: ["right","center","left"].sample)

end

end

conducteur=Conducteur.create(title: (0...8).map{65.+(rand(26)).chr}.join, username: (0...8).map{65.+(rand(26)).chr}.join)

rand(5..10).times do

conducteur.conducteurlines.create(notes_technicien: ["baisser le son", "prévenir /!\\", "activer machine brouillard", "synchroniser video avec son", "baisser l'intensite lumiere", ""].sample, interpretes: ["qui?", "voix enregistrée", "voix IA", "--"].sample,videoprojection: ["images IA", "données IA", "partitions IA", "texte IA", "vidéos IA", "musique IA", "logo projet", "aucune"].sample,lumieres_effet: "noir, douche, effet clignotant, intensité, rasant, parled, général".split(", ").sample, lumieres_ambiante: "noir total, rouge, violet, jaune, mi-scene eclairee couleur, blanc doux, blanc chaud, toutes couleurs, salle rallumée".split(", ").sample, machine_brouillard: ["oui","non","oui - continu", "oui - 10 sec"].sample, duree: ["00:30","01:00","01:30","02:00"].sample, sequenceaction: ["noir complet + voix off", "interprete entre lentement", "lumiere s'allume progressivement", "performance corporelle sur fond sonore", "interprete s'immobilise et lumiere", "interprete interagit avec une voix", "superpositions sons lumieres", "brouillard", "lumiere s'eteint son se dissout", "temps de latence avant aplaudissements", "sortie de scene + lumiere salle"].sample) 
end
STAGE_LOGIC = {
  # BACK STAGE (Y: 0-30) : Les éléments lourds et fixes
  back: {
    y_range: (0..30),
    items: {
      "batterie" => { x_pref: 50, spread: 10 }, # Centrée au fond
      "ampli basse" => { x_pref: 20, spread: 5 },
      "ampli guitare" => { x_pref: 80, spread: 5 },
      "praticable (estrade)" => { x_pref: 50, spread: 40 }
    }
  },
  # MID STAGE (Y: 31-65) : Les musiciens assis ou pupitres
  mid: {
    y_range: (31..65),
    items: {
      "piano numerique" => { x_pref: 15, spread: 10 },
      "pupitres" => { x_pref: 50, spread: 40 },
      "chaises" => { x_pref: 50, spread: 40 },
      "percussion" => { x_pref: 75, spread: 10 }
    }
  },
  # FRONT STAGE (Y: 66-100) : Solistes et retours
  front: {
    y_range: (66..100),
    items: {
      "micros" => { x_pref: 50, spread: 40 },
      "retour de scene (monitor)" => { x_pref: 50, spread: 45 }
    }
  }
}

def generate_smart_layout(fiche, materiels_necessaires)
  materiels_necessaires.each do |mn|
    nom = mn.materiel.name
    
    # 1. Trouver dans quelle zone se trouve cet objet
    zone_name = STAGE_LOGIC.find { |_, v| v[:items].key?(nom) }&.first || :mid
    config = STAGE_LOGIC[zone_name]
    item_config = config[:items][nom] || { x_pref: 50, spread: 30 }

    mn.quantite.times do |i|
      # 2. Calculer X : Position préférée + ou - un écart aléatoire (spread)
      # Cela évite que tous les micros soient au même point pile au centre
      offset = rand(-item_config[:spread]..item_config[:spread])
      x_final = (item_config[:x_pref] + offset).clamp(5, 95)

      # 3. Calculer Y : Aléatoire dans la tranche de la zone
      y_final = rand(config[:y_range])

      PlanDeSceneDessin.create!(
        fiche_technique: fiche,
        materiel_musicien: nom,
        coord_x: x_final,
        coord_y: y_final,
        layer: zone_name.to_s,
        disposition: x_final < 40 ? "left" : (x_final > 60 ? "right" : "center")
      )
    end
  end
end
# On définit des ambiances cohérentes
generate_smart_layout(fichetechnique, fichetechnique.materiels_necessaires)
ambiances = {
  "Jazz" => { 
    lumieres: ["blanc chaud", "bleu nuit", "douche"], 
    brouillard: ["non", "oui - 10 sec"] 
  },
  "Rock" => { 
    lumieres: ["rouge", "stroboscope", "jaune"], 
    brouillard: ["oui - continu", "oui"] 
  }
}

ambiances.each do |style_name, categories|
  style = Style.find_or_create_by!(name: style_name)
  
  categories[:lumieres].each do |val|
    style.ambiance_options.find_or_create_by!(category: 'lumieres', value: val)
  end

  categories[:brouillard].each do |val|
    style.ambiance_options.find_or_create_by!(category: 'brouillard', value: val)
  end
end

def generate_conducteur(style_name, conducteur)
  style = Style.find_by(name: style_name)
  return unless style

  current_light = "noir total"
  available_lights = style.lights # Récupère ["rouge", "stroboscope", "jaune"] par exemple

  5.times do |i|
    # On pioche au hasard dans les options de la BDD
    light = (available_lights - [current_light]).sample || available_lights.sample
    
    conducteur.conducteurlines.create!(
      sequenceaction: "Phase #{i+1}",
      lumieres_ambiante: light,
      machine_brouillard: style.fog_settings.sample
    )
    current_light = light
  end
end
def generate_intelligent_conducteur(fiche_id)
  fiche = FicheTechnique.find(fiche_id)
  
  # 1. On identifie qui est sur scène (ex: via les notes ou une table Talents)
  has_danseur = fiche.notes_complementaires.include?("danse")
  
  # 2. On génère 5 lignes avec une progression logique
  [ 'intro', 'body', 'body', 'body', 'outro' ].each_with_index do |current_phase, index|
    
    # L'IA interne filtre les templates valides :
    potential_actions = SequenceTemplate.where(phase: current_phase)
    
    # On affine selon les talents présents
    if has_danseur
      potential_actions = potential_actions.where(target_talent: ['danseur', 'tous'])
    else
      potential_actions = potential_actions.where.not(target_talent: 'danseur')
    end

    selected = potential_actions.sample

    ConducteurLine.create!(
      fiche_technique_id: fiche.id,
      sequenceaction: selected.label,
      lumieres_ambiante: selected.suggested_light,
      duree: (index == 0 ? "00:30" : "02:00")
    )
  end
end
# Exemple de création intelligente
def generer_spectacle(projet_id)
  projet = ProjetArtistique.find(projet_id)
  fiche = projet.fiche_technique=FicheTechnique.create!(name: "Fiche de #{projet.titre}")
  
  # On crée le conducteur lié
  conducteur = Conducteur.create!(fiche_technique: fiche)
  projet.update(conducter_id: conducteur)

  # L'IA (ou le script) utilise le genre du projet pour choisir les lignes
  templates = SequenceTemplate.where(target_genre: projet.style)

  templates.each_with_index do |temp, i|
    conducteur.conducteur_lines.create!(
      ordre: i,
      sequenceaction: temp.label,
      notes_technicien: "Respecter l'ambiance #{projet.ambiance}"
    )
  end
end
# On peut placer ceci dans un fichier de configuration ou une constante
METIER_DEPENDENCIES = {
  "ampli guitare" => { requires: ["micros"], note: "Micro SM57 pour repiquage" },
  "batterie"      => { requires: ["micros", "praticable (estrade)"], qty_multiplier: { "micros" => 4 } },
  "basse"         => { requires: ["ampli basse"], note: "Ligne directe (DI) incluse" },
  "piano numerique" => { requires: ["retour de scene (monitor)", "branchement ordinateur"] }
}
def apply_technical_logic(fiche)
  # 1. Récupérer tout le matériel déjà sélectionné pour cette fiche
  materiels_presents = fiche.materiel_necessaires.includes(:materiel).map { |mn| mn.materiel.name }

  fiche.materiel_necessaires.each do |mn|
    instrument = mn.materiel.name
    
    if METIER_DEPENDENCIES.key?(instrument)
      config = METIER_DEPENDENCIES[instrument]
      
      config[:requires].each do |required_item_name|
        # On cherche l'objet Materiel correspondant en base
        item_to_add = Materiel.find_by(name: required_item_name)
        next unless item_to_add

        # Calcul de la quantité (ex: 4 micros pour 1 batterie)
        base_qty = config.dig(:qty_multiplier, required_item_name) || 1
        total_qty = mn.quantite * base_qty

        # On crée ou on met à jour le besoin matériel
        necessaire = MaterielNecessaire.find_or_initialize_by(
          fiche_technique: fiche,
          materiel: item_to_add
        )
        
        # Logique intelligente : on ne baisse pas une quantité déjà définie manuellement
        necessaire.quantite = [necessaire.quantite || 0, total_qty].max
        necessaire.precisions_observations = "Auto: requis pour #{instrument}. #{config[:note]}"
        necessaire.save!
      end
    end
  end
end
# 1. Création des Zones
back  = Zone.find_or_create_by!(name: "back",  y_min: 0,  y_max: 30)
mid   = Zone.find_or_create_by!(name: "mid",   y_min: 31, y_max: 65)
front = Zone.find_or_create_by!(name: "front", y_min: 66, y_max: 100)

# 2. Configuration des Matériels (Mise à jour du catalogue)
mapping = {
  "batterie"                  => { zone: back,  x: 50, s: 10 },
  "ampli basse"               => { zone: back,  x: 20, s: 5  },
  "ampli guitare"             => { zone: back,  x: 80, s: 5  },
  "praticable (estrade)"      => { zone: back,  x: 50, s: 40 },
  "piano numerique"           => { zone: mid,   x: 15, s: 10 },
  "pupitres"                  => { zone: mid,   x: 50, s: 40 },
  "chaises"                   => { zone: mid,   x: 50, s: 40 },
  "micros"                    => { zone: front, x: 50, s: 40 },
  "retour de scene (monitor)" => { zone: front, x: 50, s: 45 }
}

mapping.each do |nom, cfg|
  m = Materiel.find_by(name: nom)
  next unless m
  m.update!(
    zone: cfg[:zone],
    x_pref: cfg[:x],
    spread: cfg[:s]
  )
end
def generate_smart_layout(fiche)
  fiche.materiels_necessaires.each do |mn|
    m = mn.materiel
    zone = m.zone || Zone.find_by(name: "mid") # Zone par défaut

    mn.quantite.times do
      # Calcul du X : Position préférée + aléatoire (spread)
      offset = rand(-m.safe_spread..m.safe_spread)
      x_final = (m.safe_x_pref + offset).clamp(5, 95)

      # Calcul du Y : Aléatoire dans la tranche de la zone définie en BDD
      y_final = rand(zone.y_min..zone.y_max)

      PlanDeSceneDessin.create!(
        fiche_technique: fiche,
        materiel_musicien: m.name,
        coord_x: x_final,
        coord_y: y_final,
        layer: zone.name,
        disposition: x_final < 40 ? "left" : (x_final > 60 ? "right" : "center")
      )
    end
  end
end
# db/seeds.rb

# 1. Créer les Zones
back = Zone.find_or_create_by!(name: "Back", y_min: 0, y_max: 30)
front = Zone.find_or_create_by!(name: "Front", y_min: 70, y_max: 100)

# 2. Créer un Style et ses options
rock = Style.find_or_create_by!(name: "Rock")
AmbianceOption.create!(style: rock, category: "lumieres", value: "rouge")
AmbianceOption.create!(style: rock, category: "machine_brouillard", value: "oui - continu")

# 3. Configurer un Matériel
batt = Materiel.find_or_create_by!(name: "Batterie")
batt.update!(zone: back, x_pref: 50, spread: 10)

# 4. Créer une dépendance
mic = Materiel.find_or_create_by!(name: "Micro")
MetierDependency.find_or_create_by!(materiel: batt, required_item_id: mic.id, qty_multiplier: 4, note: "Overheads + Grosse caisse")
