require "./db/conducteur56"
monmateriel=Materiel.where("name like '%violon%'")
Conducteur.last.conducteurlines.each do |x|
  ConducteurLinePosition.create(conducteurline: x, materiel: monmateriel[1], coord_x: 50, coord_y: 50)
end
