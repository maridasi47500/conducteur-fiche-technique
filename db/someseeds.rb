# On utilise Faker pour des noms et textes réalistes
require 'faker'
Faker::Config.locale = 'fr'
# (Nécessite 'gem faker' dans votre Gemfile)

puts "Nettoyage de la base de données..."
# Optionnel : Materiel.destroy_all etc.
Materiel.destroy_all

puts "Création du matériel..."

# 1. Configuration centralisée du matériel
materiels_config = {
  "chaises"                   => { max: 10, stage: true },
  "pupitres"                  => { max: 10, stage: true },
  "piano numerique"           => { max: 1,  stage: true },
  "percussion"                => { max: 10, stage: true },
  "xylophone"                 => { max: 2,  stage: true },
  "batterie"                  => { max: 1,  stage: true },
  "ampli basse"               => { max: 2,  stage: true },
  "ampli guitare"             => { max: 2,  stage: true },
  "micros"                    => { max: 10, stage: true },
  "retour de scene (monitor)" => { max: 4,  stage: true },
  "ecran/videoprojecteur"     => { max: 1,  stage: false },
  "praticable (estrade)"      => { max: 1,  stage: true },
  "branchement ordinateur"    => { max: 1,  stage: false },
  "autre"                     => { max: 5,  stage: true }
}

materiels_config.each do |name, config|
  Materiel.find_or_create_by!(name: name) do |m|
    m.maximum = config[:max]
    m.on_stage = config[:stage]
  end
end

puts "Création d'une fiche technique..."

# 2. Utilisation de Faker pour des données lisibles
fiche = FicheTechnique.create!(
  name_event:           "Concert #{Faker::Music.genre} - #{Faker::Address.city}",
  eleve_responsable:    Faker::Name.name,
  date:                 Faker::Time.between(from: 2.years.ago, to: Time.now),
  professeur_referent:  "M. #{Faker::Name.last_name}",
  notes_complementaires: Faker::Lorem.sentence
)

# 3. Logique de sélection intelligente
# On prend un échantillon aléatoire de matériel
selected_materiel = Materiel.all.sample(rand(3..8))

selected_materiel.each do |m|
  # Cohérence : si c'est un instrument spécifique, on ajuste
  quantite = rand(1..m.maximum)
  
  MaterielNecessaire.create!(
    fiche_technique: fiche,
    materiel: m,
    quantite: quantite
  )

  # 4. Génération du plan de scène uniquement si on_stage
  if m.on_stage
    quantite.times do |i|
      PlanDeSceneDessin.create!(
        fiche_technique: fiche,
        ordre: i + 1, # Un index simple ou aléatoire
        materiel_musicien: m.name,
        disposition: ["left", "center", "right"].sample
      )
    end
  end
end

puts "Création du conducteur..."

# 5. Remplissage du conducteur avec des tableaux prédéfinis
conducteur = Conducteur.create!(
  title: "Séquence : #{Faker::Music::RockBand.name}",
  username: Faker::Internet.username
)

10.times do
  conducteur.conducteurlines.create!(
    notes_technicien: ["baisser le son", "prévenir /!\\", "activer brouillard", "synchro vidéo"].sample,
    interpretes:      ["Voix IA", "Interprète Live", "Chœurs"].sample,
    videoprojection:  ["Images IA", "Vidéo #{Faker::Name.base}", "Logo"].sample,
    lumieres_effet:   ["douche", "clignotant", "rasant"].sample,
    lumieres_ambiante: ["rouge", "bleu nuit", "blanc chaud"].sample,
    machine_brouillard: ["oui", "non"].sample,
    duree:             ["00:30", "01:00", "02:00"].sample,
    sequenceaction:    "#{Faker::Verb.base} sur la scène".capitalize
  )
end

puts "Terminé ! 🚀"
