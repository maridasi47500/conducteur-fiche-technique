
# --- Le Conducteur ---
conducteur_glitch = Conducteur.create(
  title: "Protocole de Dégradation Systémique",
  username: "Système_B",
  tempo_range: "40-90 BPM",
  starred: false,
  notes: "Hypothèse : Le résidu de données imite la trace mémorielle humaine [Source : Betancourt, M., 2016]."
)

# --- Séquences du Conducteur ---
File.readlines("./public/uploads/conducteur183-1.csv").each_with_index do |y,i|
# Séquence 01 : État Stable
x=y.split(",")
Conducteurline.create(
  conducteur_id: conducteur_glitch.id.to_s,
  duree: x[0],
  sequenceaction: x[1],
  interpretes: x[2], 
  son: x[3],
  lumieres_ambiante:x[4],
  lumieres_effet:x[5],
  machine_brouillard:x[6],
  videoprojection:x[7],
  notes_technicien:x[8],

  ordre: (i+1).to_s,
  etat: "Initialisé"
)
end
