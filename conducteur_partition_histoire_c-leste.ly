\version "2.24.3"
\header {
  title = "L'Éveil de Nova : Du Métal au Cœur"
  composer = "Générateur Automatique (Ruby)"
  tagline = ##f
}

\paper { #(set-paper-size "a4") }

\layout {
  \context { \Score \remove "Bar_number_engraver" }
}

global = {
  \key c \major
  \time 4/4
}

violin = \absolute {
  \global
  
  % Section: Nova est immobile dans l'obscurité, ses voyants clignotent frénétiquement. (Emotion: peur)
  \tempo 4=90
  \mark "Agitato"
  a''16 b''16 b''16 b''16 a''16 f''16 d'''16 b''16 b''16 e''16 f''16 g''16 d'''16 g''16 f''16 d'''16  |
  b''16 g''16 b''16 g''16 g''16 g''16 b''16 d'''16 e''16 e''16 b''16 b''16 e''16 a''16 d'''16 b''16  |
  b''16 c'''16 d'''16 e''16 d'''16 d'''16 c'''16 e''16 d'''16 g''16 b''16 b''16 c'''16 a''16 e''16 g''16  |
  e''16 a''16 a''16 e''16 a''16 a''16 b''16 e''16 a''16 f''16 d'''16 e''16 c'''16 b''16 g''16 b''16  |
  d'''16 g''16 a''16 f''16 b''16 c'''16 a''16 c'''16 c'''16 g''16 e''16 e''16 f''16 g''16 c'''16 b''16  |
  b''16 c'''16 g''16 e''16 f''16 b''16 e''16 c'''16 g''16 b''16 b''16 e''16 f''16 d'''16 f''16 a''16  |
  
  % Section: L'apprenti pose la boîte. Nova sursauto au déclenchement de la musique. (Emotion: surprise)
  \tempo 4=110
  \mark "Subito"
  a'16 e'16 d'16 a'16 d'16 f'16 b'16 b'16 a'16 d'16 d'16 c''16 e'16 d'16 a'16 a'16  |
  g'16 b'16 g'16 g'16 g'16 a'16 b'16 c''16 d'16 d'16 b'16 g'16 c''16 b'16 c''16 d'16  |
  e'16 a'16 e'16 b'16 b'16 b'16 f'16 c''16 g'16 f'16 d'16 a'16 a'16 b'16 d'16 a'16  |
  d'16 b'16 a'16 d'16 f'16 b'16 f'16 b'16 b'16 g'16 c''16 d'16 c''16 b'16 b'16 g'16  |
  d'16 e'16 b'16 f'16 g'16 a'16 d'16 c''16 c''16 a'16 e'16 e'16 e'16 g'16 g'16 d'16  |
  a'16 d'16 e'16 c''16 e'16 b'16 g'16 b'16 g'16 b'16 b'16 d'16 a'16 b'16 b'16 d'16  |
  d'16 d'16 f'16 d'16 c''16 d'16 d'16 b'16 a'16 f'16 b'16 c''16 b'16 f'16 a'16 g'16  |
  g'16 a'16 a'16 g'16 g'16 e'16 c''16 d'16 f'16 a'16 c''16 d'16 g'16 a'16 c''16 b'16  |
  g'16 e'16 e'16 a'16 c''16 d'16 a'16 d'16 f'16 d'16 d'16 a'16 d'16 f'16 c''16 b'16  |
  g'16 f'16 f'16 d'16 d'16 d'16 a'16 f'16 d'16 e'16 e'16 d'16 g'16 e'16 b'16 d'16  |
  
  % Section: L'apprenti approche un outil. Nova recule brutalement et émet une alerte. (Emotion: colere)
  \tempo 4=120
  \mark "Furioso"
  e'16 f'16 c''16 b'16 e'16 g'16 d'16 g'16 d'16 a'16 e'16 e'16 e'16 g'16 a'16 d'16  |
  c''16 e'16 d'16 d'16 c''16 g'16 d'16 d'16 b'16 a'16 c''16 b'16 b'16 b'16 c''16 d'16  |
  d'16 b'16 e'16 f'16 a'16 d'16 d'16 f'16 f'16 a'16 c''16 b'16 b'16 f'16 g'16 g'16  |
  g'16 c''16 d'16 b'16 c''16 b'16 g'16 f'16 b'16 g'16 b'16 d'16 d'16 a'16 a'16 e'16  |
  d'16 f'16 e'16 e'16 f'16 e'16 d'16 c''16 f'16 a'16 e'16 f'16 f'16 e'16 b'16 b'16  |
  a'16 g'16 d'16 c''16 d'16 d'16 g'16 b'16 d'16 g'16 f'16 b'16 a'16 g'16 e'16 e'16  |
  
  % Section: Nova seule. Elle baisse la tête. Une goutte d'huile tombe de son optique. (Emotion: tristesse)
  \tempo 4=45
  \mark "Lento"
  f'1 a'1 g'1 d'1  |
  
  % Section: L'apprenti revient et s'assoit. Nova stabilise ses ventilateurs. (Emotion: joie)
  \tempo 4=100
  \mark "Vivace"
  c'8 a8 f'8 f'8 a8 d'8 a8 g8  |
  a8 c'8 a8 f'8 f'8 e'8 f'8 f'8  |
  b8 e'8 b8 g8 e'8 g8 c'8 a8  |
  b8 b8 f'8 e'8 c'8 b8 f'8 f'8  |
  b8 b8 e'8 a8 a8 c'8 d'8 b8  |
  f'8 b8 g8 f'8 b8 e'8 f'8 f'8  |
  b8 e'8 a8 d'8 e'8 g8 f'8 c'8  |
  
  % Section: Nova touche la main de l'apprenti. Leurs mains s'illuminent ensemble. (Emotion: amour)
  \tempo 4=60
  \mark "Adagio"
  c'2 a2 e'2 d'2  |
  g2 a2 a2 c'2  |
  g2 d'2  |

  \bar "|."
}

\score {
  \new Staff \with {
    instrumentName = "Violon"
    midiInstrument = "violin"
  } \violin
  \layout { }
  \midi { }
}
