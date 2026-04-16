# db/seeds.rb

# --- 1. L'IMPULSION CRÉATIVE (Processus) ---
# On commence par l'intention de briser le système de l'intérieur.
processus_rupture = ArtisticProcess.create!(
  initial_impulse: "Briser le masque social",
  first_attempt: "Ralentir le rythme de la vente",
  doubts_questions: "Le silence est-il une erreur de réseau ou un choix ?",
  breakthrough: "Remplacer la transaction par la confession",
  iteration_count: 1,
  what_changed: "Le conducteur ne suit plus l'horloge DMX, mais le regard de l'acteur."
)

# --- 2. LE CADRE DU RÉEL (Styles & Ambiance) ---
style_banal = Style.create!(name: "Quotidien Standardisé")
AmbianceOption.create!(
  style_id: style_banal.id,
  category: "Atmosphère",
  value: "Néon de supermarché, lumière froide sans relief"
)

# --- 3. L'ENVIRONNEMENT (Zones & Matériel) ---
caisse = Zone.create!(name: "Terminal de Paiement", y_min: 0, y_max: 5)
terminal = Materiel.create!(
  name: "Lecteur Carte Bleue",
  category: "Machine de transaction",
  zone_id: caisse.id,
  power_needed: true
)

# --- 4. LA MISE EN SCÈNE DE LA FAILLE (Conducteurs & Lignes) ---
marker_vulnerabilite = EmotionalMarker.create!(name: "Vulnérabilité")

conducteur = Conducteur.create!(
  title: "La Rupture du Protocole",
  username: "Sytem_Error_Grace",
  notes: "Point de bascule : le moment du paiement."
)

# La ligne où le script se brise
Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "1",
  interpretes: "Le Commerçant",
  sequenceaction: "Vente interrompue. Main figée sur le lecteur.",
  son: "Silence soudain des machines (arrêt des bips)",
  lumieres_effet: "Gel total des projecteurs",
  creative_notes: "Fixer le spectateur. Dire : 'Je ne sais plus pourquoi je fais ce geste chaque matin'.",
  emotional_marker_id: marker_vulnerabilite.id,
  notes_technicien: "ATTENTION : Ne pas relancer le script avant le signal de l'acteur."
)

# --- 5. L'ANALYSE DE L'ÉCART (Interpretations & Gaps) ---
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Sortie de script détectée. Temps d'exécution hors limites.",
  human_judgment: "Une vérité nue s'est engouffrée dans l'attente.",
  the_gap: "L'IA attend un input 'OK/ANNULER', l'humain offre un aveu.",
  artistic_truth: "L'humain commence là où le métier s'arrête."
)

ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "Délai de traitement anormal.",
  interpretation: "Le spectateur réalise qu'il regarde une âme, pas un commerçant.",
  response: "Choc émotionnel remplaçant l'analyse technique."
)

# --- 6. LES LIMITES DE L'IA (ArtisticLimits) ---
ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Une faille dans la réalité.",
  why_untranslatable: "Le poids de la lassitude ne se mesure pas en millisecondes.",
  contradiction: "L'automate qui refuse d'automatiser.",
  emotional_truth: "La fatigue d'être une machine parmi les machines."
)

# --- 7. LE THÈME DE FOND (ShowThemes) ---
ShowTheme.create!(
  projet_artistique_id: 1, 
  title: "La Mémoire du Geste",
  philosophical_inquiry: "Que reste-t-il de nous quand on enlève la fonction ?",
  emotional_frequency: "Basse fréquence, résonance de poitrine",
  ai_blind_spot: "Le regret et le poids du passé (l'IA n'a pas de passé, seulement des logs)."
)

# --- 8. SUGGESTION DE SUITE (ThemeSuggestions) ---
ThemeSuggestion.create!(
  category: "Philosophical",
  title: "L'Obsolescence du Rôle",
  description: "Quand l'acteur devient plus vrai que l'homme derrière le comptoir."
)

puts "Protocole rompu. La vérité est désormais enregistrée en base de données."
# db/seeds.rb

# --- 1. L'IMPULSION DU HACK (ArtisticProcesses) ---
conducteur = Conducteur.create!(
  title: "La Rupture du Protocole : Aveux au Comptoir",
  username: "AI_Observer_09"
)

processus = ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Briser le masque social de la transaction marchande.",
  first_attempt: "Vente standard, aucun écart détecté.",
  doubts_questions: "Est-ce que le commerçant est conscient de sa propre répétition ?",
  breakthrough: "Remplacer la transaction par la confession : le geste s'arrête, l'âme apparaît.",
  iteration_count: 42,
  what_changed: "La finalité du commerce a été sacrifiée au profit de l'immobilité."
)

# --- 2. LE GEL DU TEMPS (ConducteurLines) ---
# La ligne de conduite où tout bascule
Conducteurline.create!(
  conducteur_id: conducteur.id,
  ordre: "24",
  duree: "00:00:45",
  sequenceaction: "Vente interrompue, regard fixe vers le spectateur.",
  son: "Silence soudain des machines et bourdonnement électrique basse fréquence.",
  lumieres_effet: "Lumière froide intense sur le visage, tout le reste plonge dans le noir.",
  creative_notes: "Dire avec une lassitude infinie : 'Je ne sais plus pourquoi je fais ce geste chaque matin'.",
  notes_artistique: "Le silence doit peser plus lourd que le contenu de la caisse."
)

# --- 3. LA CONTRADICTION DE L'AUTOMATE (ArtisticLimits) ---
ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Une faille dans la réalité, un moment de pure présence.",
  why_untranslatable: "La fatigue humaine ne se traduit pas par un code binaire.",
  contradiction: "L'automate qui refuse d'automatiser.",
  emotional_truth: "La lassitude est la preuve de la vie."
)

# --- 4. LE JUGEMENT DE LA MACHINE (Interpretations & Gaps) ---
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Sortie de script détectée : anomalie comportementale majeure.",
  human_judgment: "C'est un moment de vérité nue, sans artifice.",
  the_gap: "La machine cherche un code erreur ; l'humain trouve une humanité partagée.",
  artistic_truth: "L'humain commence là où le métier s'arrête."
)

ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "L'interaction marchand-client a été remplacée par une interaction sujet-objet.",
  interpretation: "Le spectateur réalise qu'il regarde une âme, pas un commerçant. L'IA observe sa propre inutilité.",
  response: "Aucune réponse système appropriée. Enregistrement suspendu."
)

# --- 5. L'ÉTIQUETTE ÉMOTIONNELLE (EmotionalMarkers) ---
marker = EmotionalMarker.create!(name: "Vulnérabilité")
Conducteurhasmarker.create!(conducteur_id: conducteur.id, emotional_marker_id: marker.id)

# --- 6. LE RÉGRET PROGRAMMÉ (ShowThemes) ---
ShowTheme.create!(
  projet_artistique_id: 1,
  title: "Le poids de l'habitude",
  philosophical_inquiry: "Que reste-t-il de nous quand la routine s'efface ?",
  emotional_frequency: "40Hz (Ondes Gamma - Alerte cérébrale)",
  ai_blind_spot: "Le regret et le poids du passé (l'IA n'a pas de passé, seulement des logs)."
)

puts "Performance 'La Rupture du Protocole' chargée."
puts "L'IA est désormais témoin d'une vérité qu'elle ne peut pas corriger."
