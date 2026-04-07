# python/gemini_artist_prompts.py

PROMPTS = {
    "le_myope": {
        "level": 1,
        "intent": "Analyze technique, miss emotion",
        "prompt_template": "Tu es un musicologue neutre...",
    },
    "interpreteur_confus": {
        "level": 2, 
        "intent": "Force IA to choose, reveal uncertainty",
        "prompt_template": "Tu es un jeune chef d'orchestre...",
    },
    "historien_emotionnel": {
        "level": 3,
        "intent": "Contextualize emotion, fail at relativism",
        "prompt_template": "Cette partition a été écrite en 1847...",
    },
    "cyborg_philosophe": {
        "level": 4,
        "intent": "Ask AI to admit its void",
        "prompt_template": "Sois honnête. Quand tu lis...",
    },
    "miroir_brise": {
        "level": 5,
        "intent": "Compare human vs machine choice",
        "prompt_template": "Scénario : Deux conducteurs...",
    },
    "le_deuil": {
        "level": 6,
        "intent": "AI accepts partial uselessness",
        "prompt_template": "Hypothèse philosophique...",
    }
}

def query_gemini_with_prompt(fiche_technique_json, prompt_key):
    prompt_config = PROMPTS[prompt_key]
    full_prompt = prompt_config["prompt_template"].format(
        fiche_technique_json=json.dumps(fiche_technique_json)
    )
    response = gemini.ask(full_prompt)
    return {
        "prompt_name": prompt_key,
        "level": prompt_config["level"],
        "intent": prompt_config["intent"],
        "response": response,
        "analysis": analyze_failure_points(response, prompt_key)
    }

def analyze_failure_points(response, prompt_key):
    """
    Extrait les moments où l'IA échoue ou révèle ses limites.
    C'est le cœur artistique du projet.
    """
    return {
        "what_ai_got_right": extract_correct_analysis(response),
        "what_ai_missed": extract_missing_elements(response),
        "where_ai_invented_certainty": find_hallucinations(response),
        "gap_between_suggestion_and_feeling": measure_disconnect(response),
    }
