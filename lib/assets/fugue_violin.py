import re

class Note:
    def __init__(self, pitch, duration):
        self.pitch = pitch  # MIDI
        self.duration = duration # ex: "4", "8"

class GenerateurFugueViolon:
    def __init__(self, tonalite="d", mode="minor"):
        self.tonalite = tonalite
        self.mode = mode
        self.notes_ly = ['c', 'cis', 'd', 'dis', 'e', 'f', 'fis', 'g', 'gis', 'a', 'ais', 'b']

    def ly_to_midi(self, ly_str):
        pattern = r"([a-g](?:is|es)?)([',]*)(\d+\.?)?"
        matches = re.findall(pattern, ly_str)
        notes = []
        p_map = {'c':0, 'd':2, 'e':4, 'f':5, 'g':7, 'a':9, 'b':11}
        last_dur = "4"
        for name, octs, dur in matches:
            p = p_map[name[0]]
            if "is" in name: p += 1
            if "es" in name: p -= 1
            shift = octs.count("'") - octs.count(",")
            pitch = 60 + p + (shift * 12)
            if dur: last_dur = dur
            notes.append(Note(pitch, last_dur))
        return notes

    def to_ly_abs(self, notes):
        res = []
        for n in notes:
            name = self.notes_ly[n.pitch % 12]
            oct_val = (n.pitch // 12) - 5
            oct_str = "'" * oct_val if oct_val >= 0 else "," * abs(oct_val)
            res.append(f"{name}{oct_str}{n.duration}")
        return " ".join(res)

    # --- TRANSFORMATIONS ---
    def transposition(self, notes, demi_tons):
        return [Note(n.pitch + demi_tons, n.duration) for n in notes]

    def augmentation(self, notes):
        m = {"2":"1", "4":"2", "8":"4", "16":"8"}
        return [Note(n.pitch, m.get(n.duration, n.duration)) for n in notes]

    def diminution(self, notes):
        m = {"1":"2", "2":"4", "4":"8", "8":"16"}
        return [Note(n.pitch, m.get(n.duration, n.duration)) for n in notes]

    def inversion(self, notes):
        pivot = notes[0].pitch
        return [Note(pivot - (n.pitch - pivot), n.duration) for n in notes]

    def retrograde(self, notes):
        return notes[::-1]

    def hauteurs_retrogrades(self, notes):
        p = [n.pitch for n in notes][::-1]
        return [Note(p[i], notes[i].duration) for i in range(len(notes))]

    def durees_retrogrades(self, notes):
        d = [n.duration for n in notes][::-1]
        return [Note(notes[i].pitch, d[i]) for i in range(len(notes))]

    # --- LOGIQUE VIOLON (DOUBLES CORDES) ---
    def superposer(self, voix_h, voix_b):
        """ Crée des doubles cordes. Unisson ok, écart max 16 demi-tons. """
        res = []
        for n_h, n_b in zip(voix_h, voix_b):
            diff = n_h.pitch - n_b.pitch
            if 0 <= diff <= 16: # Injouable si trop large
                h = self.to_ly_abs([n_h]).replace(n_h.duration, "")
                b = self.to_ly_abs([n_b]).replace(n_b.duration, "")
                res.append(f"<{b} {h}>{n_h.duration}")
            else:
                res.append(self.to_ly_abs([n_h]))
        return " ".join(res)

    def composer_long(self, theme_ly):
        s = self.ly_to_midi(theme_ly)
        
        # Construction par blocs pour la longueur
        expo = self.to_ly_abs(s) + " " + self.to_ly_abs(self.transposition(s, 7))
        
        # Développement (épisodes)
        inv = self.inversion(s)
        epi1 = self.to_ly_abs(self.diminution(inv)) * 3
        
        # Strette (Superposition)
        strette = self.superposer(s, self.transposition(s, -12))
        
        # Séquence de modulations (Échos lointains)
        echo = self.to_ly_abs(self.transposition(s, 3)) + " " + self.to_ly_abs(self.transposition(s, -2))
        
        # Conclusion en rétrograde augmenté
        final = self.to_ly_abs(self.augmentation(self.retrograde(s)))

        return f"{expo} {epi1} {strette} {echo} {final}"

# --- UTILISATION ---
mon_theme = "d'8 e'8 f'4 g'8 f'8 e'4" 
gen = GenerateurFugueViolon("d", "minor")
partition_finale = gen.composer_long(mon_theme)

# Affichage du template avec injection
print(f"""
\\version "2.24.3"
\\header {{ title = "Grande Fugue Violon" composer = "Python Script" tagline = ##f }}
\\layout {{ 
  \\context {{ \\Score \\remove "Bar_number_engraver" }}
  \\context {{ \\Voice \\consists "Melody_engraver" \\override Stem.neutral-direction = #'() }}
}}
global = {{ \\key {gen.tonalite} \\{gen.mode} \\time 4/4 \\tempo 4=100 }}
violin = {{ \\global {partition_finale} \\bar "|." }}
\\score {{ \\new Staff \\violin \\layout {{ }} \\midi {{ }} }}
""")
