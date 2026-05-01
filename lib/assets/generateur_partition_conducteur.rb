EMOTIONAL_CONFIG = {
  "peur" => { tempo: 90, rhythm: "16", label: "Agitato", scale: :minor },
  "joie" => { tempo: 100, rhythm: "8", label: "Vivace", scale: :major },
  "colere" => { tempo: 120, rhythm: "16", label: "Furioso", scale: :minor },
  "amour" => { tempo: 60, rhythm: "2", label: "Adagio", scale: :major },
  "surprise" => { tempo: 110, rhythm: "16", label: "Subito", scale: :chromatic },
  "tristesse" => { tempo: 45, rhythm: "1", label: "Lento", scale: :minor }
}

class LilypondGenerator

  def initialize(conducteur, emotional_markers)

    @conducteur = conducteur

    @markers = emotional_markers

    @notes = [%w(c' d' e' f' g a b), %w(d' e' f' g' a' b' c''), %w(a' b' c'' d'' e'' f'' g''), %w(e'' f'' g'' a'' b'' c''' d''')].sample

  end 
  def generate
      content = ""
  
      @conducteur.conducteurlines.order(:ordre).each do |line|
        @notes = [%w(c' d' e' f' g a b), %w(d' e' f' g' a' b' c''), %w(a' b' c'' d'' e'' f'' g''), %w(e'' f'' g'' a'' b'' c''' d''')].sample
        emotion_name = @markers[line.emotional_marker_id]
        config = EMOTIONAL_CONFIG[emotion_name.parameterize] || EMOTIONAL_CONFIG["joie"]
  
        # --- Calcul de la durée ---
        total_seconds = (line.duree.hour * 3600) + (line.duree.min * 60) + line.duree.sec
# --- Paramètres d'entrée ---
        duree_secondes = total_seconds
        rhythm_value = config[:rhythm].to_i # ex: 8 pour croche, 16 pour double
        
        # 1. Calcul des battements totaux (noires)
        total_beats = duree_secondes * (config[:tempo] / 60.0)
        
        # 2. Calcul du multiplicateur de subdivision
        # Dans le système Lilypond/classique : 
        # 4 = 1 note par temps (noire)
        # 8 = 2 notes par temps (croche)
        # 16 = 4 notes par temps (double-croche)
        notes_per_beat = 4.0 / rhythm_value
        # Assuming 4/4 time signature
        beats_per_measure = 4 
        beat_duration = 60.0 / config[:tempo]
        measure_duration_seconds = beat_duration * beats_per_measure
        note_duration_seconds = notes_per_beat * beat_duration
        
        
        # How many measures do we need to cover the total time?
        total_measures = (duree_secondes.to_f / measure_duration_seconds).ceil
        
        # The new total duration, rounded up to the end of the last bar
        extended_duration = total_measures * measure_duration_seconds
        # Total notes that fit into the completed measures
        total_notes = (extended_duration / note_duration_seconds).floor
        
        # Total silence needed to reach the end of the last measure 
        # (if your notes don't perfectly divide into the measure)
        silence_restant = extended_duration - (total_notes * note_duration_seconds)
        puts "Pour #{duree_secondes}s à #{config[:tempo]} BPM en rhythm #{rhythm_value}, tu as #{total_notes} notes."
        # Version simplifiée : combien de notes de ce type par noire (4) ?
        notes_per_black_note = (rhythm_value.to_f / 4).to_i
        notes_per_black_note = 1 if notes_per_black_note == 0 # Sécurité pour les rondes/blanches
  
        content << "\n  % Section: #{line.sequenceaction} (Emotion: #{emotion_name})\n"
        content << "  \\tempo 4=#{config[:tempo]}\n"
        content << "  \\mark \"#{config[:label]}\"\n"
        content << "  "
  
        # --- Génération des notes adaptées ---
  
        total_notes.to_i.times do |i|
          content << "#{@notes.sample}#{rhythm_value} "
          
          # Saut de ligne et barre de mesure tous les X temps pour la lisibilité
          # Ici on garde une logique de mesure à 4 temps (4/4)
          if (i + 1) % (4 * notes_per_black_note) == 0
            content << " |\n  "
          end
        end
        silence_restant.to_i.times do |i|
          content << "r#{rhythm_value} "
          
          # Saut de ligne et barre de mesure tous les X temps pour la lisibilité
          # Ici on garde une logique de mesure à 4 temps (4/4)
        end
        
        content << " |\n" unless content.strip.end_with?("|")
      end
  
      content
  end
end
# Simulation de récupération des données
#conducteur = Conducteur.find(params[:id])
peur=EmotionalMarker.find_or_create_by(name: "peur")
joie=EmotionalMarker.find_or_create_by(name: "joie")
colere=EmotionalMarker.find_or_create_by(name: "colere")
amour=EmotionalMarker.find_or_create_by(name: "amour")
surprise=EmotionalMarker.find_or_create_by(name: "surprise")
triste=EmotionalMarker.find_or_create_by(name: "tristesse")
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
  duree: "00:00:18",
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

markers = EmotionalMarker.all.pluck(:id, :name).to_h

music_content = LilypondGenerator.new(conducteur, markers).generate

lilypond_template = <<~LY
  \\version "2.24.3"
  \\header {
    title = "#{conducteur.title}"
    composer = "Générateur Automatique (Ruby)"
    tagline = ##f
  }

  \\paper { #(set-paper-size "a4") }

  \\layout {
    \\context { \\Score \\remove "Bar_number_engraver" }
  }

  global = {
    \\key c \\major
    \\time 4/4
  }

  violin = \\absolute {
    \\global
    #{music_content}
    \\bar "|."
  }

  \\score {
    \\new Staff \\with {
      instrumentName = "Violon"
      midiInstrument = "violin"
    } \\violin
    \\layout { }
    \\midi { }
  }
LY

File.write("partition_conducteur.ly", lilypond_template)
puts "Partition générée : partition_conducteur.ly"

