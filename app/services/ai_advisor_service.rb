class AiAdvisorService
  def self.get_suggestions(projet_id)
    projet = ProjetArtistique.find(projet_id)
    # On récupère le catalogue réel pour que l'IA ne délire pas
    stock = Materiel.all 

    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-4-turbo", # Ou gpt-3.5-turbo pour plus de rapidité
        messages: [
          { role: "system", content: "Tu es un assistant technique de scène." },
          { role: "user", content: build_technical_prompt(projet, stock) }
        ],
        temperature: 0.7 # 0.7 = créatif mais cadré / 0.1 = très robotique
      }
    )

    JSON.parse(response.dig("choices", 0, "message", "content"))
  end
end
