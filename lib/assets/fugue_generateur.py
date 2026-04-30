import re

class Note:
    def __init__(self, pitch, duration):
        self.pitch = pitch  # MIDI (60 = c')
        self.duration = duration # String LilyPond (4, 8, 2, etc.)

class FugueViolon:
    def __init__(self, cle_tonale="c", mode="major"):
        self.cle = cle_tonale
        self.mode = mode
        self.notes_ly = ['c', 'cis', 'd', 'dis', 'e', 'f', 'fis', 'g', 'gis', 'a', 'ais', 'b']

    def ly_to_midi(self, ly_str):
        """ Convertit une ligne LilyPond simple en objets Note """
        pattern = r"([a-g](?:is|es)?)([',]*)(\d+\.?)?"
        matches = re.findall(pattern, ly_str)
        notes = []
        p_map = {'c':0, 'd':2, 'e':4, 'f':5, 'g':7, 'a':9, 'b':11}
        last_dur = "4"
        for name, octaves, dur in matches:
            p = p_map[name[0]]
            if "is" in name: p += 1
            if "es" in name: p -= 1
            shift = octaves.count("'") - octaves.count(",")
            pitch = 60 + p + (shift * 12)
            if dur: last_dur = dur
            notes.append(Note(pitch, last_dur))
        return notes

    def midi_to_ly_abs(self, notes):
        """ Convertit des objets Note en LilyPond Absolute """
        res = []
        for n in notes:
            name = self.notes_ly[n.pitch % 12]
            oct_val = (n.pitch // 12) - 5 
            oct_str = "'" * oct_val if oct_val >= 0 else "," * abs(oct_val)
            res.append(f"{name}{oct_str}{n.duration}")
        return " ".join(res)

    # --- TRANSFORMATIONS ---
    def transposition(self, notes, intervalle):
        return [Note(n.pitch + intervalle, n.duration) for n in notes]

    def augmentation(self, notes):
        # Simplifié : 4 -> 2, 8 -> 4
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
    def assembler_doubles_cordes(self, voix_haut, voix_bas):
        """ Fusionne deux voix pour violon avec vérification physique """
        resultat = []
        for n_h, n_bas in zip(voix_haut, voix_bas):
            diff = n_h.pitch - n_bas.pitch
            # Un violoniste peut jouer la même note sur deux cordes (unisson)
            # ou un intervalle jusqu'à une 10ème (16 demi-tons)
            if 0 <= diff <= 16:
                h_str = self.midi_to_ly_abs([n_h]).replace(n_h.duration, "")
                b_str = self.midi_to_ly_abs([n_bas]).replace(n_bas.duration, "")
                resultat.append(f"<{b_str} {h_str}>{n_h.duration}")
            else:
                # Si impossible, on ne garde que la mélodie
                resultat.append(self.midi_to_ly_abs([n_h]))
        return " ".join(resultat)

    def composer_fugue(self, theme_ly):
        sujet = self.ly_to_midi(theme_ly)
        
        # 1. Exposition
        partie1 = self.midi_to_ly_abs(sujet) 
        # 2. Réponse (Echo à la quinte)
        reponse = self.transposition(sujet, 7)
        partie2 = self.midi_to_ly_abs(reponse)
        # 3. Épisode (Inversion et diminution)
        episode = self.diminution(self.inversion(sujet))
        partie3 = self.midi_to_ly_abs(episode * 2) # On le répète pour la longueur
        # 4. Strette (Doubles cordes : Sujet + Sujet Transposé octave basse)
        basse = self.transposition(sujet, -12)
        partie4 = self.assembler_doubles_cordes(sujet, basse)
        # 5. Final (Rétrograde)
        partie5 = self.midi_to_ly_abs(self.retrograde(sujet))

        return f"{partie1} | {partie2} | {partie3} | {partie4} | {partie5}"

# --- GÉNÉRATION DU FICHIER ---
generateurs = FugueViolon("d", "minor")
mon_theme = "d'4 a'8 g'8 f'4 e'4" # Input utilisateur
musique = generateurs.composer_fugue(mon_theme)

template = f"""\\version "2.24.3"
\\header {{ title = "Fugue Violon Automatique" tagline = ##f }}
\\layout {{ \\context {{ \\Score \\remove "Bar_number_engraver" }} }}

global = {{ \\key {generateurs.cle} \\{generateurs.mode} \\time 4/4 \\tempo 4=100 }}

violin = {{
  \\global
  {musique}
  \\bar "|."
}}

\\score {{
  \\new Staff \\with {{ instrumentName = "Violon" midiInstrument = "violin" }} \\violin
  \\layout {{ }}
  \\midi {{ }}
}}"""

print(template)
