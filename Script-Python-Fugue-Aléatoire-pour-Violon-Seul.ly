\version "2.24.3"
\header {
  title = "Fugue Aléatoire pour Violon Seul"
  composer = "Script Python"
  tagline = ##f
}
\paper { #(set-paper-size "a4") }
\layout {
  \context { \Score \remove "Bar_number_engraver" }
  \context { \Voice \consists "Melody_engraver" \override Stem.neutral-direction = #'() }
}
global = { \key d \minor \time 4/4 \tempo 4=110 }

violin = {
  \global
  d'4 <cis' f'>4 a'4 <ais' d''>4 <gis' cis''>2 <c' a'>2 | 
  d'16 f'16 a'16 d''16 cis''8 a'8 | 
  d''8 f''8 a''8 d'''8 cis'''4 a''4 | 
  d'4 f'4 a'8 d''8 cis''8 a'8 | 
  a'8 cis''8 d''8 a'8 f'4 d'4 | 
  d'4 f'4 a'4 d''4 cis''2 a'2 | 
  <a d'>4 <f f'>4 <cis' a'>8 <a' d''>8 <a' cis''>8 <a a'>8 | 
  d'4 f'4 a'4 d''4 cis''2 a'2 | 
  <b' d''>8 <g' f''>8 <cis'' a''>8 <ais'' d'''>8 <f'' cis'''>4 <e'' a''>4 | 
  d'8 b8 g8 d8 dis4 g4 | 
  d'4 f'4 a'4 d''4 cis''2 a'2 | 
  d'4 f'4 a'4 d''4 cis''2 a'2 | 
  d'16 f'16 a'16 d''16 cis''8 a'8 | 
  a'8 cis''8 d''8 a'8 f'4 d'4 | 
  <f d'>4 <cis' f'>4 <c' a'>8 <a' d''>8 <dis' cis''>8 <c' a'>8 | 
  d'16 f'16 a'16 d''16 cis''8 a'8 | 
  d'8 b8 g8 d8 dis4 g4 | 
  d'8 b8 g8 d8 dis4 g4 | 
  <ais d'>4 <a f'>4 <c' a'>8 <d' d''>8 <gis' cis''>8 <d' a'>8 | 
  d'16 f'16 a'16 d''16 cis''8 a'8 | 
  <g d'>4 <ais f'>4 <f' a'>8 <a' d''>8 cis''8 <cis' a'>8 | 
  <c' a'>4 <fis' cis''>4 d''8 <e' a'>8 <c' f'>8 <d d'>8 | 
  d'16 f'16 a'16 d''16 cis''8 a'8 | 
  a'8 cis''8 d''8 a'8 f'4 d'4 | 
  <a d'>4 <g f'>4 <fis' a'>8 <a' d''>8 <cis' cis''>8 <e' a'>8 | 
  d'4 f'4 a'4 d''4 cis''2 a'2 | 
  a'8 cis''8 d''8 a'8 f'4 d'4 | 
  a8 c'8 e'8 a'8 gis'4 e'4 | 
  <g d'>4 <g f'>4 <f' a'>4 <b' d''>4 <a' cis''>2 <a a'>2 | 
  d'4 f'4 a'8 d''8 cis''8 a'8 | 
  d'8 b8 g8 d8 dis4 g4
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
