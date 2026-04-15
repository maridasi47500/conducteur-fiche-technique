class HomeController < ApplicationController
  def index
    @conducteurs = Conducteur.limit(3)
    @conducteurlines = Conducteurline.limit(3)
    @artistic_notes = ArtisticNote.limit(3)
    @artistic_processes = ArtisticProcess.limit(3)
    @artistic_limits = ArtisticLimit.limit(3)
    @emotional_markers = EmotionalMarker.limit(3)
    @stage_themes = StageTheme.limit(3)
    @directive_artistiques = DirectiveArtistique.limit(3)
    @materiels = Materiel.limit(3)
    @fiche_techniques = FicheTechnique.limit(3)
    @projet_artistiques = ProjetArtistique.limit(3)
    @sequence_templates = SequenceTemplate.limit(3)
    @ambiance_options = AmbianceOption.limit(3)
    @inspiration_resources = InspirationResource.limit(3)
    @creative_detours = CreativeDetour.limit(3)
    @interpretations = Interpretation.limit(3)
    @theme_suggestions = ThemeSuggestion.limit(3)
    @zones = Zone.limit(3)
    @metier_dependencies = MetierDependency.limit(3)
    @materiel_necessaires = MaterielNecessaire.limit(3)
    @plan_de_scene_dessins = PlanDeSceneDessin.limit(3)
    @show_themes = ShowTheme.limit(3)
    @share_your_gaps = ShareYourGap.limit(3)
  end
end

