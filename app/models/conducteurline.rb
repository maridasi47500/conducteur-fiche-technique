class Conducteurline < ApplicationRecord


belongs_to :conducteur
  # Génère une requête de recherche propre
  def search_query
    # On récupère le nom du style via le conducteur
    style_name = conducteur.projet_artistique&.style || ""
    
    # On combine les termes importants
    # Exemple : "Rock Solo de guitare lights inspiration stage plot"
    "#{style_name} #{sequenceaction} #{lumieres_ambiante} stage plot inspiration".strip
  end
def maduree
x=read_attribute(:duree)
("%02d" % x.hour+":"+ "%02d" % x.min)
rescue
"00:00"
end
def videoprojection=(uploaded_io)
p "hello"
File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  file.write(uploaded_io.read)
end
write_attribute(:videoprojection, uploaded_io.original_filename)
rescue => e
write_attribute(:videoprojection, uploaded_io)
end
def videoprojection
read_attribute(:videoprojection)
end
def son=(uploaded_io)

File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  file.write(uploaded_io.read)
end
write_attribute(:son, uploaded_io.original_filename)
rescue => e
write_attribute(:son, uploaded_io)
end
def son
read_attribute(:son)
end
end
