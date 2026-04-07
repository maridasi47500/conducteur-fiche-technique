class AiTechnicianService
  def initialize(projet_id)
    @projet = ProjetArtistique.find(projet_id)
  end

  def generate_technical_rider
    prompt = <<~TEXT
      En tant qu'expert régisseur plateau, génère une fiche technique pour :
      Titre: #{@projet.title}
      Style: #{@projet.style}
      
      Réponds UNIQUEMENT en format JSON avec les clés suivantes :
      - materiel: [{name: string, quantite: integer, observation: string}]
      - sequence: [{ordre: integer, action: string, lumiere: string, son: string, duree: string}]
    TEXT

    response = OpenAI::Client.new.chat(parameters: { 
      model: "gpt-4-turbo", 
      messages: [{ role: "user", content: prompt }],
      response_format: { type: "json_object" } 
    })

    process_response(JSON.parse(response.dig("choices", 0, "message", "content")))
  end

  private

  def process_response(data)
    # Logique pour créer les MaterielNecessaire et ConducteurLines
  end
end
