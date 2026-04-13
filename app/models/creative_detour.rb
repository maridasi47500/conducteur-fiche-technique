class CreativeDetour < ApplicationRecord
  def self.generate_ai_prompt_detour
    # On récupère le contenu du schéma Rails
    schema_path = Rails.root.join('db', 'schema.rb')
    schema_content = File.read(schema_path) if File.exist?(schema_path)

    <<~PROMPT
      CONTEXTE : Projet "I.A. Intelligence Artistique"
      DÉTOUR CRÉATIF : 
      CONCEPT : 
      DÉFI : 

      VOICI LE SCHEMA DE MA BASE DE DONNÉES :
      #{schema_content}

      VOICI LE THEME DU PROJET artistique :
      Your initial question positions this as a critical artistic inquiry: "I.A. Intelligence Artistique — What could be hidden behind this theme? In the era of total digitalization, can we interrogate the place of the human facing the machine? To think, create meaning, make people feel, evoke emotions — what place is there for artistic intelligence?"


      MISSION :
      1. Analyse le schéma ci-dessus.
      2. Regarde le thème du projet artistique ci-dessus.
      2. prends un détour artistique ou creatif en Choisissant dans les tables les plus pertinentes (parmi conducteurlines, interpretations, artistic_limits, stage_themes, toutes les autres tables, etc.) (dans un ordre différent , en commençant par créer un enregistrement ou piocher au hasard un enregistrement dans une table différente et le détour artistique entier différent)  pour simuler l'action d'un conducteur , projet artistique et fiche technique final sans utiliser la table Creative_detour.

      3. crée un db/seed  dans la table creative_detour de ce détour artistique

      CONSIGNE STRICTE : 
      - remplis uniquement la table 'creative_detours'
      - utilise uniquement d'autres tables que  'creative_detours' pour ce détour (dans database usage) (pour éviter les boucles).
      - essaye d'utiliser le plus de tables
      - Utilise des données poétiques, pas seulement techniques.
      - rentre les données poétiques dans les colonnes artistiques et les données technique dans les colonnes techniques des tables.
      - Si une table semble inutile pour ce détour, ignore-la.
      - peux tu ecrire un db/seeds en ruby
    PROMPT
  end
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
