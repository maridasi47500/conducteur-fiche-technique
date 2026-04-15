module HomeHelper
def display_name(item)
  preferred = %w[philosophical_inquiry interpretation machine_analysis  materiel_musicien   materiel fiche_technique what_i_want sequenceaction title name label name_event username category]
  key = preferred.find { |attr| item.respond_to?(attr) && item.send(attr).present? }
  hey=key ? item.send(key) : item.id
  if hey.is_a?(Materiel)
    hey=hey.name
  end
  if hey.is_a?(FicheTechnique)
    hey=hey.name_event
  end
  hey
  
end

end
