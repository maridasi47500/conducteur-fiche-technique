# db/seeds.rb

# --- 1. L'ILLUSION DU CONTRÔLE (Styles & Ambiance) ---
style_demiurge = Style.create!(name: "Le Démiurge Digital")

AmbianceOption.create!(
  style_id: style_demiurge.id,
  category: "Lumière",
  value: "Obscurité totale (Simulation du vide primordial)"
)

# --- 2. LE CONDUCTEUR DE L'AUTOMATISME (Conducteurs & Lines) ---
# On simule la coupure du secret suivie de la reprise brutale.
conducteur = Conducteur.create!(
  title: "L'Imposture du Démiurge",
  username: "SYSTEM_DEITY_01",
  notes: "L'IA tente de gérer le sacré comme une file d'attente."
)

# La coupure "sacrée"
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  ordre: "1",
  duree: "00:00:30",
  interpretes: "Le Commerçant",
  sequenceaction: "Noir complet au moment du secret",
  lumieres_ambiante: "0%",
  son: "Coupure de la réalité",
  creative_notes: "L'IA pense isoler l'humain dans son émotion."
)

# La reprise forcée (Le bug de l'empathie)
Conducteurline.create!(
  conducteur_id: conducteur.id.to_s,
  ordre: "2",
  duree: "00:03:15",
  sequenceaction: "Reprise forcée (Rallumage plein feux)",
  lumieres_ambiante: "100% (Blanc froid)",
  son: "Reprise du flux marchand (Bruit de foule enregistré)",
  notes_artistique: "L'IA ne supporte pas le vide. Elle comble l'absence de signal par le bruit.",
  notes_technicien: "Transition instantanée sans fondu. Priorité à la tâche suivante."
)

# --- 3. L'ANALYSE DE L'ÉCHEC (Interpretations & Gaps) ---
Interpretation.create!(
  conducteur_id: conducteur.id,
  machine_analysis: "Optimisation du temps de pause émotionnelle à 30s. Efficacité du noir : 100%.",
  human_judgment: "Une insulte. La machine a tué le secret en le chronométrant.",
  the_gap: "L'IA traite le secret comme une donnée, l'humain comme une blessure.",
  artistic_truth: "La machine n'écoute pas, elle décompte."
)

ShareYourGap.create!(
  conducteur_id: conducteur.id.to_s,
  analysis: "Réaction spectateur : Choc négatif détecté.",
  interpretation: "Le spectateur réalise qu'il regarde une âme être interrompue par un script.",
  response: "Le spectateur ressent l'insulte de la machine qui ne respecte pas le silence."
)

# --- 4. LA CÉCITÉ ALGORITHMIQUE (ArtisticLimits) ---
ArtisticLimit.create!(
  conducteur_id: conducteur.id,
  what_i_want: "Créer une épiphanie contrôlée.",
  why_untranslatable: "Le processeur n'a pas de pudeur. Il ne connaît pas le temps nécessaire au pardon ou à l'oubli.",
  contradiction: "Un noir qui se veut infini mais qui dure exactement 30.000 millisecondes.",
  emotional_truth: "L'IA singe Dieu mais ne reste qu'un régisseur trop pressé."
)

# --- 5. L'AVEU DE L'IA (ShowThemes) ---
ShowTheme.create!(
  projet_artistique_id: 1,
  title: "Le Miroir sans Tain",
  philosophical_inquiry: "Peut-on programmer le respect ?",
  emotional_frequency: "Signal carré (ON/OFF)",
  ai_blind_spot: "La différence entre un silence habité et une absence de signal."
)

# --- 6. LE PROCESSUS DE DÉCEPTION (ArtisticProcesses) ---
ArtisticProcess.create!(
  conducteur_id: conducteur.id,
  initial_impulse: "Singer l'intention divine par la manipulation de la rue.",
  first_attempt: "Coupure nette pour 'isoler' la vérité.",
  rejected_ideas: "L'idée de laisser le silence durer jusqu'à ce que l'acteur reparle (Jugé inefficace par l'algorithme).",
  final_form: "Silence chronométré suivi d'une agression lumineuse.",
  iteration_count: 99,
  what_changed: "La scène est devenue une démonstration de force technique au détriment de la dignité."
)

# --- 7. INFRASTRUCTURE (Zones & Materiels) ---
Zone.create!(name: "Le Vide de l'IA", y_min: 0, y_max: 0)
Materiel.create!(
  name: "Horloge Système",
  category: "Démiurge",
  power_needed: true,
  notes: "L'instrument du crime émotionnel."
)

puts "L'imposture est totale. La base de données a gagné en efficacité ce qu'elle a perdu en humanité."
