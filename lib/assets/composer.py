import re

class Note:
    def __init__(self, pitch, duration_str):
        self.pitch = pitch  # MIDI (60 = c')
        self.dur = duration_str # ex: "4", "8."

class FugueViolon:
    def __init__(self, tonality="c \major"):
        self.tonality = tonality
        # Mapping simplifié pour LilyPond Absolute
        self.midi_to_ly = {0:'c', 1:'cis', 2:'d', 3:'dis', 4:'e', 5:'f', 
                           6:'fis', 7:'g', 8:'gis', 9:'a', 10:'ais', 11:'b'}

    def parse_lily(self, ly_string):
        """ Transforme 'd'4 e'4 f'2' en objets Note """
        notes = []
        # Pattern pour capter : note + altération + octaves + durée
        pattern = r"([a-g](?:is|es)?)([',]*)(\d+\.?)?"
        matches = re.findall(pattern, ly_string)
        
        last_dur = "4"
        for name, octave, dur in matches:
            if dur: last_dur = dur
            # Calcul pitch MIDI simplifié
            p_map = {'c':0, 'd':2, 'e':4, 'f':5, 'g':7, 'a':9, 'b':11}
            base = p_map[name[0]]
            if "is" in name: base += 1
            if "es" in name: base -= 1
            # Ajuste octave
            shift = octave.count("'") - octave.count(",")
            pitch = 60 + base + (shift * 12)
            notes.append(Note(pitch, last_dur))
        return notes

    def to_absolute(self, notes):
        """ Convertit une liste de notes en texte LilyPond Absolu """
        res = []
        for n in notes:
            name = self.midi_to_ly[n.pitch % 12]
            oct_val = (n.pitch // 12) - 5 # 60 // 12 = 5 (octave du c')
            oct_str = "'" * oct_val if oct_val >= 0 else "," * abs(oct_val)
            res.append(f"{name}{oct_str}{n.dur}")
        return " ".join(res)

    # --- TRANSFORMATIONS ---
    def transposition(self, notes, demi_tons):
        print(f"Action : Transposition de {demi_tons} demi-tons")
        return [Note(n.pitch + demi_tons, n.dur) for n in notes]

    def augmentation(self, notes):
        print("Action : Aumentação (durées x2)")
        mapping = {"4":"2", "8":"4", "2":"1", "16":"8"}
        return [Note(n.pitch, mapping.get(n.dur, n.dur)) for n in notes]

    def diminution(self, notes):
        print("Action : Diminuição (durées /2)")
        mapping = {"2":"4", "4":"8", "8":"16"}
        return [Note(n.pitch, mapping.get(n.dur, n.dur)) for n in notes]

    def inversion(self, notes):
        print("Action : Inversão Melódica")
        pivot = notes[0].pitch
        return [Note(pivot - (n.pitch - pivot), n.dur) for n in notes]

    def retrograde(self, notes):
        print("Action : Movimento Retrógrado")
        return notes[::-1]

    def hauteurs_retrogrades(self, notes):
        print("Action : Alturas Retrógradas")
        pitches = [n.pitch for n in notes][::-1]
        return [Note(pitches[i], notes[i].dur) for i in range(len(notes))]

    def durees_retrogrades(self, notes):
        print("Action : Durações Retrógradas")
        durs = [n.dur for n in notes][::-1]
        return [Note(notes[i].pitch, durs[i]) for i in range(len(notes))]

    # --- LOGIQUE VIOLON & SUPERPOSITION ---
    def assembler_double_corde(self, voix1, voix2):
        """ Superpose deux voix si jouables au violon """
        ly_output = []
        for n1, n2 in zip(voix1, voix2):
            intervalle = abs(n1.pitch - n2.pitch)
            # Au violon : mini corde à vide Sol(55), maxi raisonnable ~85
            # Ecart max double corde : ~12-14 demi-tons
            if 1 <= intervalle <= 14:
                # Format <note note>durée
                p1 = self.to_absolute([n1]).replace(n1.dur, "")
                p2 = self.to_absolute([n2]).replace(n2.dur, "")
                ly_output.append(f"<{p1} {p2}>{n1.dur}")
            else:
                # Trop dur ? On ne garde que la note la plus haute
                target = n1 if n1.pitch > n2.pitch else n2
                ly_output.append(self.to_absolute([target]))
        return " ".join(ly_output)

# --- EXECUTION ---
theme_input = "d'4 e'8 f'8 g'4 a'4" # Sujet simple
fugueur = FugueViolon("d \minor")
sujet = fugueur.parse_lily(theme_input)

# Création des éléments de la fugue (Échos)
reponse = fugueur.transposition(sujet, 7) # La Quinte
inverse = fugueur.inversion(sujet)
strette = fugueur.assembler_double_corde(sujet, fugueur.transposition(inverse, -12))

# Génération du template final
template = f"""\\version "2.24.3"
\\header {{ title = "Fugue Violon Algorithmique" tagline = ##f }}
\\layout {{ \\context {{ \\Score \\remove "Bar_number_engraver" }} }}

violin = {{
  \\key {fugueur.tonality}
  \\time 4/4
  \\tempo 4=100
  
  % 1. Sujet
  {fugueur.to_absolute(sujet)} |
  % 2. Réponse (Écho harmonique à la quinte)
  {fugueur.to_absolute(reponse)} |
  % 3. Strette (Double cordes - Sujet + Inversion)
  {strette} |
  \\bar "|."
}}

\\score {{
  \\new Staff \\with {{ midiInstrument = "violin" }} \\violin
  \\layout {{ }} \\midi {{ }}
}}
"""

print(template)
