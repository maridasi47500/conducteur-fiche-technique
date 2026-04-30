1.1

Musique algorithmique
La composition algorithmique (ou composition automatisée) désigne la « méthode consistant à utiliser un processus formel pour créer de la musique, avec une intervention humaine minimale » [4].:w!

voici le script lilypond a quoi doit ressembler le script: \version "2.24.3"

\header {
  title = "fugue violon"
  composer = "script python anonyme"
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
}   .ce que je veux faire : choisir une tonalité, python/lillypond ecrire un script avec une fonction par transformation musicale, en francais si des trucs à afficher, script qui utiliise 1 à plusieurs fois chaque fonction de transformation musicale (nombre aleatoire pour chaque fois script execute), script qui generer une partition lilypond differente à chaque fois, avec les transformations musicales mélangées dans un ordre aléatoire (jusqu'à 10 transformations musicales de chaque  transformation musicale dans ce morceau),  il manque transposition et superposer les voix, prendre en input une ligne lilypond (un theme simple) : apres, comment faire un script  pour composer une fugue qu'on peut jouer au violon (gerer les double corde, ecrire des double coprdes qu'on peut faire , memes notes dans l'accord double corde est ok mais si possible deux note différente, écart d'intervalle de double aléatoire pour chaque accord de double corde, comment faire pour melanger plus de techniques et avoir une partition d'une longueur aléatoire, ecrire en lilypond absolute), assembler les  trandformations harmoniques pour que ca fasse des "echos", les transformations harmonique:2.2.2
Transformações Melódicas
Uma série de transformações melódicas foram utilizadas por vários compositores no pro-
cesso de composição de fugas. Tem-se como uma importante referência o compositor J. S.
Bach e sua obra O cravo bem temperado [9, 10]. Dentre as transformações mais comuns,
foram implementadas:
• Aumentação - A duração de cada nota da estrutura melódica é multiplicada por
uma constante k (Figura 2.14).
Figura 2.14: Transformação de aumentação para k = 2.
• Diminuição - A duração de cada nota da estrutura melódica é reduzida por uma
constante k (Figura 2.15).
Figura 2.15: Transformação de diminuição para k = 2.
• Inversão Melódica - Os intervalos são invertidos em relação à primeira nota da
estrutura melódica. Isto é, os intervalos ascendentes se tornam descendentes e vice-
versa (Figura 2.16).
17Figura 2.16: Transformação de inversão melódica.
• Movimento Retrógrado - As notas são executadas começando da última nota e
se encerrando na primeira nota da estrutura melódica. Isto é, são executadas no
sentido inverso (Figura 2.17).
Figura 2.17: Transformação de movimento retrógrado.
Além disso, como resultado de testes derivados das transformações anteriores, foram
desenvolvidas duas novas transformações:
• Alturas Retrógradas - As alturas das notas são colocadas em movimento retró-
grado, preservando-se a ordem das durações (Figura 2.18).
Figura 2.18: Transformação de alturas retrógradas.
• Durações Retrógradas - As durações das notas são colocadas em movimento
retrógrado, preservando-se a ordem das alturas (Figura 2.19).
18Figura 2.19: Transformação de durações retrógradas.
2.3
Linguagem de Programação
O sistema resultante do conjunto de algoritmos aqui apresentados foi desenvolvido utilizando-
se o paradigma de orientação a objetos, visando obter uma maior abstração em relação à
implementação dos elementos da notação musical, os quais são representados por simples
objetos manipuláveis.
