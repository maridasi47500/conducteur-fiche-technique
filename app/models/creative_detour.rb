class CreativeDetour < ApplicationRecord
  def generate_ai_prompt
    # On récupère le contenu du schéma Rails
    schema_path = Rails.root.join('db', 'schema.rb')
    schema_content = File.read(schema_path) if File.exist?(schema_path)

    <<~PROMPT
      CONTEXTE : Projet "I.A. Intelligence Artistique"
      DÉTOUR CRÉATIF : #{self.title}
      CONCEPT : #{self.concept}
      DÉFI : #{self.challenge}

      VOICI LE SCHEMA DE MA BASE DE DONNÉES :
      #{schema_content}

      MISSION :
      1. Analyse le schéma ci-dessus.
      2. Choisis les tables les plus pertinentes (parmi conducteurlines, interpretations, artistic_limits, stage_themes, etc.) pour simuler l'action suivante : "#{self.action}".
      3. Génère un script Ruby 'seeds.rb' complet qui crée une performance cohérente.
      4. Pour chaque enregistrement, utilise les colonnes appropriées du schéma pour documenter l'usage de la base : "#{self.database_usage}".
      5. Assure-toi que la "Reaction" attendue est palpable dans les données : "#{self.reaction}".

      CONSIGNE STRICTE : 
      - Ne remplis PAS la table 'creative_detours' (pour éviter les boucles).
      - Utilise des données poétiques, pas seulement techniques.
      - Si une table semble inutile pour ce détour, ignore-la.
    PROMPT
  end
end
