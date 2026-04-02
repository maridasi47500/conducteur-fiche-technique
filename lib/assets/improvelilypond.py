import re
from collections import defaultdict

def parse_lilypond(file_path):
    with open(file_path, 'r') as f:
        content = f.read()
    # 1. Trouver la tonalité (key signature)
    key_match = re.search(r'\\key\s+([a-g])(\s+\\minor|\s+\\major)?', content)
    if not key_match:
        raise ValueError("Tonalité non trouvée dans le fichier LilyPond.")
    root = key_match.group(1)
    mode = key_match.group(2).strip() if key_match.group(2) else 'major'
    print(f"Tonalité : {root} {mode}")

    # 2. Déterminer les notes de la gamme naturelle
    if mode == '\\minor':
        minor_scale_intervals = [0, 2, 3, 5, 7, 8, 10]
        notes_in_scale = get_notes_in_minor_scale(root, minor_scale_intervals)
    else:
        major_scale_intervals = [0, 2, 4, 5, 7, 9, 11]
        notes_in_scale = get_notes_in_major_scale(root, major_scale_intervals)
    print(f"Notes de la gamme naturelle : {', '.join(notes_in_scale)}")

    # 3. Trouver la signature rythmique
    time_match = re.search(r'\\time\s+(\d+)\/(\d+)', content)
    if not time_match:
        raise ValueError("Signature rythmique non trouvée.")
    beats_per_measure = int(time_match.group(1))
    beat_unit = int(time_match.group(2))
    print(f"Signature rythmique : {beats_per_measure}/{beat_unit}")

    # 4. Extraire toutes les notes avec leur mesure, temps, durée et voix
    note_pattern = r'([a-g](is|es)?)(\d*)(\.?)'
    voice_pattern = r'(\w+) = \\relative\s*\{([^}]*)\}'
    voice_pattern = r'part(I|II|III|IV).=.[^\s]*voice(One|Two|Three|Four)\s*([^}]*)\}'
    voice_pattern = r'(part(?:I|II|III|IV))(?!(?:relative))(?:[(?!(?:\\))=a-z.\{\}^:\s]*)\\(voice(?:One|Two|Three|Four))\s*([^}]*)\}'
    voice_blocks = re.findall(voice_pattern, content, re.DOTALL)
    notes_data = []

    for block in voice_blocks:
        voice_name = block[0]+" "+block[1]
        notes_str = block[2]
        notes_data.extend(parse_notes_in_voice(notes_str, voice_name, beats_per_measure, beat_unit))

    # 5. Trouver les notes étrangères
    foreign_notes = [n for n in notes_data if (n['note'] not in notes_in_scale and n['note'] != "r")]
    print("\nNotes étrangères à la gamme naturelle :")
    for n in foreign_notes:
        if n["note"] == "r":
            continue
        print(f"Mesure {n['measure']}, temps {n['beat']:.2f}, note {n['note']} (voix {n['voice']})")

    return {
        'key': f"{root} {mode}",
        'scale': notes_in_scale,
        'foreign_notes': foreign_notes,
        'notes_data': notes_data,
    }

def enharmonic(note):
    enharmonic_equivalents = {
        'c#': 'd♭',
        'd#': 'e♭',
        'f#': 'g♭',
        'g#': 'a♭',
        'a#': 'b♭',
        'cs': 'des',
        'ds': 'ees',
        'fs': ' ges',
        'gs': 'aes',
        'as': 'b',
        'bes': 'ais',
        'bis': 'c',
        'eis': 'f',
        'cis': 'des',
        'dis': 'ees',
        'fis': 'ges',
        'gis': 'aes',
        'ais': 'bes'
    }

    note_lower = note.lower()
    if note_lower in enharmonic_equivalents:
        return enharmonic_equivalents[note_lower]
    else:
        return note  # Return original if no enharmonic equivalent found
def get_notes_in_minor_scale(root, intervals):
    notes = ['c', 'cs', 'd', 'ds', 'e', 'f', 'fs', 'g', 'gs', 'a', 'as', 'b']
    root_idx = notes.index(root)
    scale = []
    for interval in intervals:
        note_idx = (root_idx + interval) % 12
        scale.append(notes[note_idx].replace('s', 'is').replace('cs', 'cis'))
        myenharmonic=enharmonic(notes[note_idx].replace('s', 'is').replace('cs', 'cis'))
        if notes[note_idx].replace('s', 'is').replace('cs', 'cis') != myenharmonic:
            scale.append(myenharmonic)
      
    return scale

def get_notes_in_major_scale(root, intervals):
    notes = ['c', 'cs', 'd', 'ds', 'e', 'f', 'fs', 'g', 'gs', 'a', 'as', 'b']
    root_idx = notes.index(root)
    scale = []
    for interval in intervals:
        note_idx = (root_idx + interval) % 12
        scale.append(notes[note_idx].replace('s', 'is').replace('cs', 'cis'))
        myenharmonic=enharmonic(notes[note_idx].replace('s', 'is').replace('cs', 'cis'))
        if notes[note_idx].replace('s', 'is').replace('cs', 'cis') != myenharmonic:
            scale.append(myenharmonic)
    return scale

def parse_notes_in_voice(notes_str, voice_name, beats_per_measure, beat_unit):
    #note_pattern = r'([abcdefgr](is|es))?\'*(\d*)([\.~]?)(\~)?'
    #note_pattern = r'([abcdefgr](?:is|es)(?:\'*)(?:,*))?(\d+[\.~]?|~)?'
    #note_pattern = r'\s*([abcdefgr](?:is|es|))?\'*\,*(\d+[\.]?|([abcdefgr](?:is|es)).~.\d+|)\s*'
    #note_pattern = r'\s*(?!.*\b(bar|fermata)\b)([abcdefgr](?:is|es|))?\'*\,*(\d+[\.]?|([abcdefgr](?:is|es)).~.\d+|)\s*'
    #note_pattern = r'\s*((?![a-z]*bar\b)(?![a-z]*fermata\b)([abcdefgr](?:is|es|))?\'*\,*(\d+[\.]?|([abcdefgr](?:is|es)).~.\d+|))\s*'
    #note_pattern = r'\s*(?:(?!bar|fermata))([abcdefgr](?:is|es|))?\'*\,*(\d+[\.]?|([abcdefgr](?:is|es)).~.\d+|)\s*'
    #note_pattern = r'\s*(?!bar\b|fermata\b)([abcdefgr](?:is|es|))?\'*\,*(\d+[\.]?|([abcdefgr](?:is|es)).~.\d+|)\s*'

    #note_pattern = r'\s*(?!(?:fermata|bar)\b)([abcdefgr](?:is|es)?)?\'*\,*(\d+(?:\.|~)?|\d*)\s*'
    #note_pattern = r'\s*\b(?!(?:bar|fermata)\b)([abcdefgr](?:is|es|))?\'*\,*(\d+[\.]?|\b(?!(?:bar|fermata)\b)([abcdefgr](?:is|es)).~.\d+|\<([abcdefgr](?:is|es)).([abcdefgr](?:is|es))\>\d+\.*|)\s*' #marche sans double corde
    #note_pattern = r'\s*\b(<\s*\b(?!(?:bar|fermata)\b)([abcdefg](?:is|es)?\,*\'*).([abcdefg](?:is|es)?\,*\'*)\s*>(\d+)?\.*|\b(?!(?:bar|fermata)\b)([abcdefgr](?:is|es)?|))\'*\,*(\d+[\.]?|\b(?!(?:bar|fermata)\b)([abcdefgr](?:is|es)\'*\,*?).~.\d+|)\s*' ##essaie de marcher dans la double corde dans lilypond
    note_pattern=r'((?:(?:\d+)?[\.]?)|(?:\b(?!(?:bar|fermata)\b)(?:[abcdefgr](?:is|es)\'*\,*(?:\d+))?.~.\d+|(?:<\s*\b(?!bar|fermata)\b(?:[abcdefg](?:is|es)?)\,*\'*.(?:[abcdefg](?:is|es)?\,*\'*)\s*>)(?:\d+)?(?:\')?(?:\.)?)|\b(?!(?:bar|fermata)\b)(?:[abcdefgr](?:is|es)?))\'*\,*(\d+)?(\.)?'
    note_pattern=r'((?:(?:\d+)?[\.]?)|(?:\b(?!(?:bar|fermata)\b)(?:[abcdefgr](?:is|es)\'*\,*(?:\d+))?.~.\d+|\b(?:<\s*\b(?!bar|fermata)\b(?:[abcdefg](?:is|es)?)\,*\'*.(?:[abcdefg](?:is|es)?\,*\'*)\s*>)(?:\d+)?(?:\')?(?:\.)?)|\b(?!(?:bar|fermata)\b)(?:[abcdefgr](?:is|es)?))\'*\,*(\d+)?(\.)?'
    note_pattern=r'((?:(?:\d+)?[\.]?)|(?:\b(?!(?:bar|fermata)\b)(?:[abcdefgr](?:is|es)\'*\,*(?:\d+))?.~.\d+|(?:<\s*\b(?!bar|fermata)\b(?:[abcdefg](?:is|es)?)\,*\'*.(?:[abcdefg](?:is|es)?\,*\'*)\s*>)(?:\d+)?(?:\')?(?:\.)?)|\b(?!(?:bar|fermata)\b)(?:[abcdefgr](?:is|es)?))\'*\,*(\d+)?(\.)?'
    notes = []
    measure = 1
    beat = 0
    previous_duration = ''
    previous_note = ''
    duration_str=''
    for match in re.finditer(note_pattern, notes_str):

        note = match.group(1)
        othernote = match.group(1)
        rythme = match.group(2)
        if note != "":
            print("NOTE:",note)

        if (othernote == "" or othernote == None) and (note == "" or note == None):
            #print("passe")
            continue
        elif othernote != None and "~" in othernote:
            my_duration_str = match.group(1)
            second_duration_str=re.search("\d+", my_duration_str)
            if previous_duration != None and previous_duration != '':
                duration = 1 / int(previous_duration)+ 1 / int(second_duration_str.group(0))
            else:
                duration = 1 / int(second_duration_str.group(0))

            note=re.search("([abcdefgr](?:is|es|)|)\'*\,*", my_duration_str)
            try:
                print(note.group())
                note=note.group()
            except:
                print(note)
            #print("option ~~j")
            is_dotted_str = match.group(1)
            is_dotted = match.group(1) is not None and "." in is_dotted_str
            if is_dotted and is_dotted_str != "":
                duration = float(duration) * 1.5
            previous_duration= second_duration_str.group(0)
            previous_note= note
        elif othernote != None and ">" in othernote and "<" in othernote:
            print("par ici")
            my_duration_str = match.group(1)
            second_duration_str=re.search("\d+", my_duration_str)
            if second_duration_str == None:
                second_duration_str = previous_duration
            print(int(previous_duration))
            try: 
                print("group:",int(second_duration_str.group()))
                second_duration_str=second_duration_str.group()
            except:
                print(second_duration_str)
            duration = 1 / int(previous_duration)+ 1 / int(second_duration_str)
            note=re.search("([abcdefgr](?:is|es|)|)\'*\,*", my_duration_str)
            if note != None:
                note=note.group(0)
            #print("option ~~j")
            is_dotted_str = match.group(1)
            is_dotted = match.group(1) is not None and "." in is_dotted_str
            if is_dotted and is_dotted_str != "":
                duration = float(duration) * 1.5
            previous_duration= second_duration_str
            previous_note= note
            
        elif note != None and rythme != None:
            #print(match.groups())
            #print(othernote)
            if othernote != None and "~" in othernote:
                othernote=""
                note=previous_note
            my_duration_str = match.group(2)
            if my_duration_str != None:
                duration_str=re.search("\d+", my_duration_str)
            #print(duration_str)
            if duration_str != '' and duration_str != None:
                duration_str=duration_str[0]
            if (duration_str == '' or duration_str == None) and previous_duration != '':
                duration_str = previous_duration
                #print("option1")
            is_dotted_str = match.group(1)
            is_dotted = match.group(1) is not None and "." in is_dotted_str


            # Calcul de la durée en beats
            if duration_str != '' and duration_str != None:
                duration = 1.0 / int(duration_str) # noire
                #print("option2")
            elif duration_str == '' or duration_str == None:
                duration = 1.0 / beats_per_measure # noire
                #print("option3")
            else:
                duration = 1.0 / int(duration_str)
                #print("option4")
            if is_dotted and is_dotted_str != "":
                duration = float(duration) * 1.5
            if note == None or note == '':
                note=previous_note
            if duration_str == None or duration_str == '':
                duration_str=previous_duration

            previous_duration= duration_str
            previous_note= note
        else:
            #print(match.groups())
            #print(othernote)
            if othernote != None and "~" in othernote:
                othernote=""
                note=previous_note
            my_duration_str = match.group(1)
            if my_duration_str != None:
                duration_str=re.search("\d+", my_duration_str)
            #print(duration_str)
            if duration_str != '' and duration_str != None:
                duration_str=duration_str[0]
            if (duration_str == '' or duration_str == None) and previous_duration != '':
                duration_str = previous_duration
                #print("option1")
            is_dotted_str = match.group(1)
            is_dotted = match.group(1) is not None and "." in is_dotted_str


            # Calcul de la durée en beats
            if duration_str != '' and duration_str != None:
                duration = 1.0 / int(duration_str) # noire
                #print("option2")
            elif duration_str == '' or duration_str == None:
                duration = 1.0 / beats_per_measure # noire
                #print("option3")
            else:
                duration = 1.0 / int(duration_str)
                #print("option4")
            if is_dotted and is_dotted_str != "":
                duration = float(duration) * 1.5
            if note == None or note == '':
                note=previous_note
            if duration_str == None or duration_str == '':
                duration_str=previous_duration

            previous_duration= duration_str
            previous_note= note




        beat += duration

        if beat > (beats_per_measure * 1/beat_unit):
            measure += 1
            #beat -= beats_per_measure
            beat = duration
        #print({
        #    'measure': measure,
        #    'rythme': duration_str,
        #    #'beat': round(beat, 2),
        #    'beat': beat * beat_unit,
        #    'note': note,
        #    'duration': duration,
        #    'voice': voice_name,
        #})
        notes.append({
            'rythme': duration_str,
            'measure': measure,
            'beat': round(beat, 2),
            'note': note,
            'duration': duration,
            'voice': voice_name,
        })


    return notes

# Exemple d'utilisation
if __name__ == "__main__":
    result = parse_lilypond("ta_partition.ly")
    print("DONNEES DE NOTES")
    for note in result['notes_data']:
        print(f"Mesure {note['measure']}, temps {note['beat']:.2f}, note {note['note']} (durée: {note['duration']} beat)")
