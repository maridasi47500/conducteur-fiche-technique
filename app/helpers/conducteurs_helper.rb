module ConducteursHelper
# app/helpers/tempo_helper.rb (or within your model)
TEMPO_OPTIONS = [
  ["Larghissimo (24 bpm and under)", "0-24"],
  ["Adagissimo and Grave (24–40 bpm)", "24-40"],
  ["Largo (40–66 bpm)", "40-66"],
  ["Larghetto (44–66 bpm)", "44-66"],
  ["Lento (40–60 bpm)", "40-60"],
  ["Adagio (44–66 bpm)", "44-66"],
  ["Adagietto (46–80 bpm)", "46-80"],
  ["Andante (56–108 bpm)", "56-108"],
  ["Andantino (80–108 bpm)", "80-108"],
  ["Marcia moderato (66–80 bpm)", "66-80"],
  ["Andante moderato (80–108 bpm)", "80-108"],
  ["Moderato (108–120 bpm)", "108-120"],
  ["Allegretto (112–120 bpm)", "112-120"],
  ["Allegro moderato (116–120 bpm)", "116-120"],
  ["Allegro (120–156 bpm)", "120-156"],
  ["Molto Allegro / Allegro vivace (124–156 bpm)", "124-156"],
  ["Vivace (156–176 bpm)", "156-176"],
  ["Vivacissimo / Allegrissimo (172–176 bpm)", "172-176"],
  ["Presto (168–200 bpm)", "168-200"],
  ["Prestissimo (200+ bpm)", "200-999"]
]
end
