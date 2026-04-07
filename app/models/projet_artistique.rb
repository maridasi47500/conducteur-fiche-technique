class ProjetArtistique < ApplicationRecord
attr_accessor :useia, :instrument_principal_id
paginates_per 10
belongs_to :fiche_technique, optional: true
belongs_to :conducteur, optional: true
def build_technical_prompt(projet, stock_disponible)
  <<~PROMPT
    [RÔLE]
    Tu es un régisseur général expert en spectacle vivant. Ton but est d'assister un élève dans la création de sa fiche technique.

    [CONTEXTE]
    Projet : #{projet.title}
    Style musical : #{projet.style}
    Matériel en stock : #{stock_disponible.map(&:name).join(', ')}

    [CONSIGNES]
    1. Ne crée pas de matériel que nous n'avons pas en stock.
    2. Suggère uniquement des éléments cohérents avec le style #{projet.style}.
    3. Si le style est 'Acoustique', limite les retours de scène.
    4. Propose des solutions, ne prends pas de décisions définitives.

    [FORMAT DE RÉPONSE]
    Réponds impérativement en JSON avec cette structure :
    {
      "suggestions": [{ "item": string, "raison": string, "quantite": integer }],
      "conseil_artistique": string
    }
  PROMPT
end
end
