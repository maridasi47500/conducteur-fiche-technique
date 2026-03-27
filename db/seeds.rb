# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
   ["chaises", "pupitres", "piano numerique", "percussion", "xylophone", "batterie", "ampli basse", "ampli guitare", "micros", "retour de scene (monitor)", "ecran/videoprojecteur", "praticable (estrade)","branchement ordinateur", "autre"].each do |genre_name|
     Materiel.find_or_create_by!(name: genre_name)
   end
