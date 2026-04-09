class DirectiveArtistique < ApplicationRecord
  belongs_to :stage_theme

  def to_line_params
    {
      #directive_artistique_id: self.id,
      lumieres_ambiante: self.default_lumieres_ambiante,
      lumieres_effet: self.default_lumieres_effet,
      videoprojection: self.default_videoprojection,
      son: self.default_son,
      notes_technicien: "[#{stage_theme.name}] - #{self.default_notes_technicien}"
    }
  end
end
