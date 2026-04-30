import re
import random

class Note:
    def __init__(self, pitch, duration):
        self.pitch = pitch  # MIDI (60 = do central)
        self.duration = duration # String (4, 8, 2, 1, etc.)

class FugueViolonIA:
    def __init__(self, tonalite="d", mode="minor"):
        self.tonalite = tonalite
        self.mode = mode
        self.notes_ly = ['c', 'cis', 'd', 'dis', 'e', 'f', 'fis', 'g', 'gis', 'a', 'ais', 'b']

    def parse_lilypond(self, ly_str):
        """ Transforme du LilyPond en liste d'objets Note """
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

    def vers_lily_absolu(self, notes):
        """ Convertit en texte LilyPond notation absolue """
        res = []
        for n in notes:
            name = self.notes_ly[n.pitch % 12]
            oct_val = (n.pitch // 12) - 5
            oct_str = "'" * oct_val if oct_val >= 0 else "," * abs(oct_val)
            res.append(f"{name}{oct_str}{n.duration}")
        return " ".join(res)

    # --- TRANSFORMATIONS ---
    def transposition(self, notes, intervalle=7):
        return [Note(n.pitch + intervalle, n.duration) for n in notes]

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

    # --- ASSEMBLAGE VIOLON ---
    def superposer_voix(self, voix_h, voix_b):
        """ Crée des doubles cordes jouables (unissons autorisés) """
        res = []
        # On s'aligne sur la voix la plus courte
        for n_h, n_b in zip(voix_h, voix_b):
            diff = abs(n_h.pitch - n_b.pitch)
            # Entre 0 (unisson) et 16 demi-tons (dixième)
            if 0 <= diff <= 16 and n_h.pitch != n_b.pitch:
                # Priorité à deux notes différentes si possible
                h_ly = self.vers_lily_absolu([n_h]).replace(n_h.duration, "")
                b_ly = self.vers_lily_absolu([n_b]).replace(n_b.duration, "")
                res.append(f"<{b_ly} {h_ly}>{n_h.duration}")
            elif n_h.pitch == n_b.pitch:
                # Unisson ok
                h_ly = self.vers_lily_absolu([n_h]).replace(n_h.duration, "")
                res.append(f"<{h_ly} {h_ly}>{n_h.duration}")
            else:
                # Trop loin : on garde la note la plus haute
                res.append(self.vers_lily_absolu([n_h if n_h.pitch > n_b.pitch else n_b]))
        return " ".join(res)

    def composer_aleatoire(self, theme_ly, iterations=15):
        sujet = self.parse_lilypond(theme_ly)
        flux_final = []
        
        # 1. Exposition classique (Sujet + Réponse Quinte)
        flux_final.append(self.vers_lily_absolu(sujet))
        flux_final.append(self.vers_lily_absolu(self.transposition(sujet, 7)))

        # 2. Cycle de transformations aléatoires pour la longueur
        transformations = [
            self.augmentation, self.diminution, self.inversion, 
            self.retrograde, self.hauteurs_retrogrades, self.durees_retrogrades
        ]
        
        for _ in range(iterations):
            choix = random.choice(transformations)
            transp = random.choice([-12, -5, 0, 5, 7, 12])
            modifie = choix(self.transposition(sujet, transp))
            
            # Aléatoirement, on superpose en double corde pour l'effet fugue
            if random.random() > 0.6:
                basse = self.transposition(modifie, -12) # Octave basse
                flux_final.append(self.superposer_voix(modifie, basse))
            else:
                flux_final.append(self.vers_lily_absolu(modifie))
        
        return " | ".join(flux_final)

# --- EXECUTION ---
comp = FugueViolonIA(tonalite="d", mode="minor")
mon_theme = "d'8 f'8 a'8 d''8 cis''4 a'4" # Sujet dynamique
musique = comp.composer_aleatoire(mon_theme)

print(f"""\\version "2.24.3"
\\header {{ title = "Fugue Aléatoire pour Violon" composer = "Python Script" tagline = ##f }}
\\layout {{ 
  \\context {{ \\Score \\remove "Bar_number_engraver" }}
  \\context {{ \\Voice \\consists "Melody_engraver" \\override Stem.neutral-direction = #'() }}
}}
global = {{ \\key {comp.tonalite} \\{comp.mode} \\time 4/4 \\tempo 4=110 }}
violin = {{ \\global {musique} \\bar "|." }}
\\score {{ \\new Staff \\with {{ midiInstrument = "violin" }} \\violin \\layout {{ }} \\midi {{ }} }}
""")
