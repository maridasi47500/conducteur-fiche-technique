# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
def time_rand from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end
   ["chaises", "pupitres", "piano numerique", "percussion", "xylophone", "batterie", "ampli basse", "ampli guitare", "micros", "retour de scene (monitor)", "ecran/videoprojecteur", "praticable (estrade)","branchement ordinateur", "autre"].each do |genre_name|
     Materiel.find_or_create_by!(name: genre_name)
   end


fichetechnique=FicheTechnique.create(name_event: (0...8).map{65.+(rand(26)).chr}.join, eleve_responsable: (0...8).map{65.+(rand(26)).chr}.join, date: time_rand(Time.local(1970, 1, 1)), professeur_referent: (0...8).map{65.+(rand(26)).chr}.join,notes_complementaires: "dkjfugh")
toutmateriel=[]
nombremateriel=0
Materiel.all.sample(rand(1..Materiel.all.length)).each do |g|
nombre = rand(1..10)
nombremateriel+=nombre

materielnecessaire=MaterielNecessaire.create(fiche_technique_id: fichetechnique.id, materiel_id: g.id, quantite: nombre,precisions_observations: "")
toutmateriel.push([materielnecessaire,nombre])
end
ordrearray=(1..nombremateriel).to_a
toutmateriel.each do |materiel, nombre|
nombre.times do 
ordreitem=ordrearray.sample
ordrearray.delete(ordreitem)
dessin=PlanDeSceneDessin.create(fiche_technique_id: fichetechnique.id, ordre: ordreitem, materiel_musicien: materiel.materiel.name, disposition: ["right","center","left"].sample)
end
end
conducteur=Conducteur.create(title: (0...8).map{65.+(rand(26)).chr}.join, username: (0...8).map{65.+(rand(26)).chr}.join)
rand(5..10).times do
conducteur.conducteurlines.create(duree: ["00:30","01:00","01:30","02:00"].sample, sequenceaction: ["noir complet + voix off", "interprete entre lentement", "lumiere s'allume progressivement", "performance corporelle sur fond sonore", "interprete s'immobilise et lumiere", "interprete interagit avec une voix", "superpositions sons lumieres", "brouillard", "lumiere s'eteint son se dissout", "temps de latence avant aplaudissements", "sortie de scene + lumiere salle"].sample)
end
