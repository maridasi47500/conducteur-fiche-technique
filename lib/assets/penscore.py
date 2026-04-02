Voici un ensemble de expressions régulières utiles pour repérer et extraire la plupart des éléments de notation LilyPond présents dans votre texte (notes, altérations, indications d'octave, durées, points, silences, accords, ties). Les motifs sont fournis prêts à copier-coller ; utilisez-les avec le drapeau global (g) et, si besoin, insensible à la casse (i).

    Note simple (nom, altération is/es, marque d’octave ' ou , facultative, durée et points facultatifs, tie facultatif)

/\b([a-g](?:is|es)?[',]*)(\d+)(\.*)(~?)/gi

    Capture 1 : nom+altération+octave (ex. d', bes, fis,, ees)
    Capture 2 : durée numérique (1 2 4 8 16 ...)
    Capture 3 : points de prolongation (., ..)
    Capture 4 : tie (~) s’il existe

    Silence (rest) avec octave/durée/points/tie

/\b(r[',]*)(\d+)(\.*)(~?)/gi

    Ex. r4, r8, r, r4~ etc.

    Accord (chord) complet avec notes internes et durée/points/tie éventuels

/<\s*([a-g](?:is|es)?[',]*(?:\s+[a-g](?:is|es)?[',]*)*)\s*>(\d+)?(\.*)(~?)/gi

    Capture 1 : contenu du <...> (p. ex. "g b" ou "a c" ou "d, g")
    Capture 2 : durée optionnelle après le chevron (ex. 8, 16)
    Capture 3 : points
    Capture 4 : tie

    Accord sans durée (simple détection du bloc d’accord)

/<\s*([a-g](?:is|es)?[',]*(?:\s+[a-g](?:is|es)?[',]*)*)\s*>/gi

    Token général (attrape note, accord ou silence en un seul motif)

/<\s*[a-g](?:is|es)?[',]*(?:\s+[a-g](?:is|es)?[',]*)*\s*>\d*\.?~?|\b[a-g](?:is|es)?[',]*\d*\.?~?|\br[',]*\d*\.?~?/gi

    Utile pour parcourir une partition et récupérer chaque "jeton" LilyPond dans l’ordre.

    Durée isolée (si besoin d’extraire seulement les valeurs de durée)

/(?<=\b[ a-gr][a-z'is,]*)(\d+)(\.*)/gi

    Utilise lookbehind simple (adapté selon moteur regex) : récupère la durée qui suit un nom de note ou r.

    Altérations complexes (captures is/es répétés si existants)

/\b([a-g](?:is|es){0,2})[',]*/gi

    Pour détecter des altérations multiples (par ex. "eses" ou "isis") si nécessaire.

