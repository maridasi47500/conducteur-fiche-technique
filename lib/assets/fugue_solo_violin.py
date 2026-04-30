import re
import random

class Note:
    def __init__(self, pitch, duration):
        self.pitch = pitch  # MIDI (60 = do central)
        self.duration = duration # String (4, 8, 2, etc.)

class CompositeurFugue:
    def __init__(self, tonalite="d", mode="minor"):
        self.tonalite = tonalite
        self.mode = mode
        self.notes_noms = ['c', 'cis', 'd', 'dis', 'e', 'f', 'fis', 'g', 'gis', 'a', 'ais', 'b']

    # --- PARSING & UTILITAIRES ---
    def ly_vers_midi(self, ly_str):
        pattern = r"([a-g](?:is|es)?)([',]*)(\d+\.?)?"
        matches = re.findall(pattern, ly_str)
        notes = []
        p_map = {'c':0, 'd':2, 'e':4, 'f':5, 'g':7, 'a':9, 'b':11}
        derniere_dur = "4"
        for nom, octs, dur in matches:
            p = p_map[nom[0]]
            if "is" in nom: p += 1
            if "es" in nom: p -= 1
            decalage = octs.count("'") - octs.count(",")
            pitch = 60 + p + (decalage * 12)
            if dur: derniere_dur = dur
            notes.append(Note(pitch, derniere_dur))
        return notes

    def midi_vers_ly_abs(self, notes):
        res = []
        for n in notes:
            nom = self.notes_noms[n.pitch % 12]
            oct_val = (n.pitch // 12) - 5
            oct_str = "'" * oct_val if oct_val >= 0 else "," * abs(oct_val)
            res.append(f"{nom}{oct_str}{n.duration}")
        return " ".join(res)

    # --- TRANSFORMATIONS (2.2.2) ---
    def transposition(self, notes, intervalle):
        return [Note(n.pitch + intervalle, n.duration) for n in notes]

    def augmentation(self, notes, k=2):
        m = {"2":"1", "4":"2", "8":"4", "16":"8"} # Simplifié k=2
        return [Note(n.pitch, m.get(n.duration, n.duration)) for n in notes]

    def diminution(self, notes, k=2):
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

    # --- SUPERPOSITION & VIOLON ---
    def superposer_voix(self, voix1, voix2):
        """ Assemble deux voix en doubles cordes si jouables """
        output = []
        for n1, n2 in zip(voix1, voix2):
            diff = abs(n1.pitch - n2.pitch)
            # Contrainte violon : unisson (0) ou intervalle < 16 demi-tons (10ème)
            if 0 <= diff <= 16:
                v1_str = self.midi_vers_ly_abs([n1]).replace(n1.duration, "")
                v2_str = self.midi_vers_ly_abs([n2]).replace(n2.duration, "")
                # On met la note la plus basse en premier dans l'accord LilyPond
                acc = f"<{v1_str} {v2_str}>" if n1.pitch < n2.pitch else f"<{v2_str} {v1_str}>"
                output.append(f"{acc}{n1.duration}")
            else:
                # Si injouable, on garde la voix 1 (mélodie principale)
                output.append(self.midi_vers_ly_abs([n1]))
        return " ".join(output)

    # --- ASSEMBLAGE LONG ---
    def composer_fugue(self, theme_initial):
        s = self.ly_vers_midi(theme_initial)
        print("--- Début de la composition de la fugue ---")
        
        # 1. Exposition (Sujet puis Réponse à la Quinte)
        expo = self.midi_vers_ly_abs(s) + " " + self.midi_vers_ly_abs(self.transposition(s, 7))
        
        # 2. Épisode 1 (Inversion + Rétrograde)
        epi1 = self.midi_vers_ly_abs(self.retrograde(self.inversion(s)))
        
        # 3. Épisode 2 (Diminution en échos)
        dim = self.diminution(s)
        epi2 = self.midi_vers_ly_abs(dim) + " " + self.midi_vers_ly_abs(self.transposition(dim, -5))
        
        # 4. Développement (Superposition / Doubles cordes)
        # On superpose le sujet avec son inversion transposée à l'octave
        strette = self.superposer_voix(s, self.transposition(self.inversion(s), -12))
        
        # 5. Grand final (Augmentation + Hauteurs Rétrogrades)
        final = self.midi_vers_ly_abs(self.augmentation(self.hauteurs_retrogrades(s)))

        # On combine pour faire une pièce longue (on peut répéter des blocs)
        partition = f"{expo} | {epi1} | {epi2} | {strette} | {final}"
        return partition

# --- PARAMÈTRES ---
theme_input = "d'4 a'8 g'8 f'4 e'8 f'8" # Un thème simple en Ré mineur
comp = CompositeurFugue(tonalite="d", mode="minor")
musique_generee = comp.composer_fugue(theme_input)

# --- GÉNÉRATION DU CODE LILYPOND ---
lily_code = f"""\\version "2.24.3"
\\header {{
  title = "Fugue pour Violon Seul"
  composer = "Python Algorithm"
  tagline = ##f
}}
\\paper {{ #(set-paper-size "a4") }}
\\layout {{
  \\context {{ \\Score \\remove "Bar_number_engraver" }}
  \\context {{ \\Voice \\consists "Melody_engraver" \\override Stem.neutral-direction = #'() }}
}}
global = {{ \\key {comp.tonalite} \\{comp.mode} \\time 4/4 \\tempo 4=100 }}
violin = {{
  \\global
  {musique_generee}
  \\bar "|."
}}
\\score {{
  \\new Staff \\with {{ instrumentName = "Violon" midiInstrument = "violin" }} \\violin
  \\layout {{ }}
  \\midi {{ }}
}}
"""

print("\n--- CODE LILYPOND GÉNÉRÉ ---")
print(lily_code)
