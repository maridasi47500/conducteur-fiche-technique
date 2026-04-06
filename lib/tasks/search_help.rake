namespace :search do
  desc "Génère des liens de recherche pour un style"
  task :suggest, [:style_name] => :environment do |t, args|
    style = args[:style_name] || "Rock"
    puts "--- Suggestions de recherche pour le style : #{style} ---"
    
    SequenceTemplate.where(style: Style.find_by(name: style)).each do |temp|
      query = "#{style} #{temp.label} #{temp.suggested_light} stage plot"
      encoded_query = CGI.escape(query)
      
      puts "\nAction : #{temp.label}"
      puts "Google : https://www.google.com/search?q=#{encoded_query}"
      puts "Bing Images : https://www.bing.com/images/search?q=#{encoded_query}"
    end
  end
end
