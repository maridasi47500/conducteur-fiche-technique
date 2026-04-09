class StageTheme < ApplicationRecord
  has_many :directive_artistiques

  def self.to_artistic_hash
    # On récupère tous les thèmes avec leurs directives pour éviter les requêtes N+1
    all.includes(:directive_artistiques).each_with_object({}) do |theme, hash|
      hash[theme.name] = {
        "Directives" => theme.directive_artistiques.each_with_object({}) do |dir, dir_hash|
          dir_hash[dir.name] = {
            #id: dir.id, # Pratique pour le formulaire
            lumieres_ambiante: dir.default_lumieres_ambiante,
            lumieres_effet: dir.default_lumieres_effet,
            videoprojection: dir.default_videoprojection,
            son: dir.default_son,
            notes_technicien: dir.default_notes_technicien
          }
        end
      }
    end
  end
end
