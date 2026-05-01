voici la schema  create_table "conducteurlines", force: :cascade do |t|

    t.string "conducteur_id"

    t.time "duree"

    t.string "sequenceaction"

    t.string "interpretes"

    t.string "lumieres_ambiante"

    t.string "lumieres_effet"

    t.string "machine_brouillard"

    t.string "videoprojection"

    t.string "notes_technicien"

    t.datetime "created_at", null: false

    t.datetime "updated_at", null: false

    t.string "son"

    t.string "ordre"

    t.string "notes_artistique"

    t.string "creative_notes"

    t.integer "emotional_marker_id"

    t.string "etat"

  end


  create_table "conducteurs", force: :cascade do |t|

    t.string "title"

    t.string "username"

    t.datetime "created_at", null: false

    t.datetime "updated_at", null: false

    t.string "fiche_technique_id"

    t.string "tempo_range"

    t.boolean "starred"

    t.string "notes"

  endVoila les emotional marker disponibles:peur=EmotionalMarker.find_or_create_by(name: "peur")

joie=EmotionalMarker.find_or_create_by(name: "joie")

colère=EmotionalMarker.find_or_create_by(name: "colere")

amour=EmotionalMarker.find_or_create_by(name: "amour")

surprise=EmotionalMarker.find_or_create_by(name: "surprise")

triste=EmotionalMarker.find_or_create_by(name: "tristesse")
 partition lilypodn comme ca \version "2.24.3"


\header {

  title = "generateur partition"

  composer = "anonyme"

  % Supprimer le pied de page par défaut

  tagline = ##f

}


\paper {

  #(set-paper-size "a4")

}


\layout {

  \context {

    \Score

    \remove "Bar_number_engraver"

  }

  \context {

    \Voice

    \consists "Melody_engraver"

    \override Stem #'neutral-direction = #'()

  }

}


global = {

  \key c \major

  \time 4/4

  \tempo 4=100

}


violin = \relative c'' {

  \global

  % En avant la musique.

  

}


\score {

  \new Staff \with {

    instrumentName = "Violon"

    midiInstrument = "violin"

  } \violin

  \layout { }

  \midi { }

}


script ruby qui prend des conducteur lines d'un conducteur, puis: a associé un emotional marker par rythme lilypond, et un rythme du plus petit (triple croche) mais rapide (bpm=120) et nom d'un caractere (presto/vivace) au plus long (ronde) ou noire/croche mais lent (bpm =50) et caractere (calm) crée une table pour associer plusieurs  caracteres/vitesse/rythme binaire/ternaire lilypond (en une table) aux emotional marker , pour chaque ligne du conducteur ou est associée une emotional composer un mouvement selon une tonalité choisie au debut, choisir une combinaison par emotion et composer une musique

