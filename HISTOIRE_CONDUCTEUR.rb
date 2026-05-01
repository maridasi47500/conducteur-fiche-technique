peur=EmotionalMarker.find_or_create_by(name: "peur")
joie=EmotionalMarker.find_or_create_by(name: "joie")
colère=EmotionalMarker.find_or_create_by(name: "colere")
amour=EmotionalMarker.find_or_create_by(name: "amour")
surprise=EmotionalMarker.find_or_create_by(name: "surprise")
triste=EmotionalMarker.find_or_create_by(name: "tristesse")
emotions.each do |emotion_name|
  EmotionalMarker.find_or_create_by(name: emotion_name)
end
# Création du Conducteur principal
conducteur = Conducteur.create!(
  title: "L'Éveil de Nova : Du Métal au Cœur",
  username: "Directeur_Artistique",
  tempo_range: "Largo to Moderato",
  notes: "Spectacle narratif utilisant des effets de lumière et de brouillard pour illustrer l'évolution émotionnelle d'un robot."
)

# --- Séquence 1 : LA PEUR ---
Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "1",
  duree: "00:00:15",
  sequenceaction: "Nova est immobile dans l'obscurité, ses voyants clignotent frénétiquement.",
  interpretes: "Nova (Robot)",
  lumieres_ambiante: "Bleu froid, très faible intensité",
  lumieres_effet: "Stroboscope lent synchronisé avec les battements de cœur",
  machine_brouillard: "Légère brume au sol",
  emotional_marker: peur, 
  son: "Bruit blanc haute fréquence, battement cardiaque mécanique",
  notes_artistique: "Mettre en avant la sensation de **peur** et de bug système.",
  etat: "Tension"
)

# --- Séquence 2 : LA SURPRISE ---
Conducteurline.create!(
  conducteur_id: conducteur.id,
  emotional_marker: surprise, 
  ordre: "2",
  duree: "00:00:20",
  sequenceaction: "L'apprenti pose la boîte. Nova sursauto au déclenchement de la musique.",
  interpretes: "Nova, L'Apprenti",
  lumieres_ambiante: "Apparition d'un projecteur chaud (ambré) sur la boîte",
  lumieres_effet: "Scintillements dorés lors de l'ouverture",
  machine_brouillard: "Arrêt",
  son: "Boîte à musique cristalline, soudaine et douce",
  notes_artistique: "La **surprise** doit être marquée par un mouvement brusque suivi d'une fascination.",
  etat: "Éveil"
)

# --- Séquence 3 : LA COLÈRE ---
Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "3",
  duree: "00:00:12",
  emotional_marker: colere, 
  sequenceaction: "L'apprenti approche un outil. Nova recule brutalement et émet une alerte.",
  interpretes: "Nova, L'Apprenti",
  lumieres_ambiante: "Rouge vif saturé",
  lumieres_effet: "Balayage rapide de projecteurs rouges (type alerte)",
  machine_brouillard: "Jets de CO2 ou brouillard dense soudain",
  son: "Alarme stridente, distorsion électrique",
  notes_artistique: "Exprimer une **colère** défensive, une intrusion insupportable.",
  etat: "Conflit"
)

# --- Séquence 4 : LA TRISTESSE ---
Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "4",
  duree: "00:18:00",
  emotional_marker: triste, 
  sequenceaction: "Nova seule. Elle baisse la tête. Une goutte d'huile tombe de son optique.",
  interpretes: "Nova",
  lumieres_ambiante: "Bleu nuit profond",
  lumieres_effet: "Poursuite focalisée sur Nova, bords flous",
  machine_brouillard: "Brume stagnante",
  son: "Violoncelle mélancolique, sons de gouttes métalliques",
  notes_artistique: "La **tristesse** et l'isolement. Ralentir tous les mouvements mécaniques.",
  etat: "Solitude"
)

# --- Séquence 5 : LE CONTENTEMENT ---
Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "5",
  emotional_marker: joie, 
  duree: "00:00:15",
  sequenceaction: "L'apprenti revient et s'assoit. Nova stabilise ses ventilateurs.",
  interpretes: "Nova, L'Apprenti",
  lumieres_ambiante: "Jaune paille, lumière diffuse et rassurante",
  lumieres_effet: "Fondu enchaîné doux vers des teintes chaudes",
  machine_brouillard: "Dissipation lente",
  son: "Nappe de synthétiseur apaisante, sons de nature légers",
  notes_artistique: "Retour au calme, sentiment de **contentement** et de sécurité.",
  etat: "Stabilisation"
)

# --- Séquence 6 : L'AMOUR ---
Conducteurline.create!(
  conducteur_id: conducteur.id,
  emotional_marker: amour, 
  ordre: "6",
  duree: "00:00:20",
  sequenceaction: "Nova touche la main de l'apprenti. Leurs mains s'illuminent ensemble.",
  interpretes: "Nova, L'Apprenti",
  lumieres_ambiante: "Rose poudré et blanc chaud",
  lumieres_effet: "Halo lumineux s'élargissant depuis le point de contact",
  machine_brouillard: "Légère fumée verticale pour accrocher la lumière",
  son: "Harmonie orchestrale montante, crescendo final",
  notes_artistique: "Apothéose : la découverte de l'**amour**. Fusion du métal et de l'humain.",
  etat: "Final"
)
