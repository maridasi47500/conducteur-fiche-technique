
require 'gemini-ai'
class GeminiAnalyzer
  def self.analyze_conducteur(conducteur)
    #client = Google::GenerativeAI::Client.new(api_key: ENV['GEMINI_API_KEY'])


    # With an API key
    #client = Gemini.new(
    #  credentials: {
    #    service: 'generative-language-api',
    #    api_key: ENV['GOOGLE_API_KEY'],
    #    version: 'v1'
    #  },
    #  options: { model: 'gemini-1.5-flash', server_sent_events: true }
    #)
    
    

    
    prompt = "Tu es une Intelligence Artistique critique. Analyse ce conducteur de spectacle : 
              Titre: #{conducteur.title}
              Séquences: #{conducteur.conducteurlines.map(&:sequenceaction).join(', ')}
              Identifie la zone où l'humain risque de perdre sa place face à la machine."
    prompt = <<~TEXT
      Tu es une "Intelligence Artistique" critique et phénoménologue. 
      Ton rôle est d'analyser la structure technique d'un spectacle pour y déceler les tensions entre l'humain et l'automatisation.
    
      VOICI LES DONNÉES DU CONDUCTEUR :
      Titre du Projet : #{conducteur.title}
      Utilisateur : #{conducteur.username || 'Anonyme'}
      Tempo global : #{conducteur.tempo_range || 'Non défini'}
    
      DÉTAILS DES SÉQUENCES (CUES) :
      #{conducteur.conducteurlines.order(:ordre).map { |line|
        "Ordre: #{line.ordre} | Action: #{line.sequenceaction}
         - Durée estimée: #{line.duree&.strftime('%H:%M:%S')}
         - Interprètes impliqués: #{line.interpretes}
         - Environnement: Lumière Ambiante (#{line.lumieres_ambiante}), Effets (#{line.lumieres_effet}), Brouillard (#{line.machine_brouillard})
         - Média: Son (#{line.son}), Vidéoprojection (#{line.videoprojection})
         - Notes techniques: #{line.notes_technicien}"
      }.join("\n---\n")}
    
      TA MISSION D'ANALYSE :
      1. Identifie la "Zone de Friction" : Où, dans cette succession de données, le corps de l'interprète est-il le plus contraint par la précision des machines (lumières, temps, son) ?
      2. Critique du Sens : Est-ce que la technologie ici sert à "augmenter" l'émotion ou à la "remplacer" par un automatisme ?
      3. L'Imprévisible : Propose une faille humaine (une erreur, une hésitation) qui pourrait rendre cette séquence plus belle que si elle était parfaitement exécutée.
      4. Diagnostic : Sur une échelle de 1 à 10, quel est le degré de "Digitalisation Totale" de cette œuvre ?
    TEXT
    p prompt
    #result = client.stream_generate_content({
    #  contents: { role: 'user', parts: { text: prompt } }
    #})

    #response = client.generate_content(prompt)
    #response.text
    #result
    prompt
  end
end
@string=""
Conducteur.where(starred: true).each do |y|

@string << GeminiAnalyzer.analyze_conducteur(y)
p @string
end
File.write('resultconducteur_ai_analyzer.json', @string)
