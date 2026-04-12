class SequenceTemplatesController < ApplicationController
  before_action :set_sequence_template, only: %i[ show edit update destroy ]

  # GET /sequence_templates or /sequence_templates.json
  def newconducteur
  end
  def generateconducteur
    # --- ÉTAPE 4 : Créer le Conducteur (SequenceTemplates & AmbianceOptions) ---

    mystyle=style=Style.find(params[:style_id])
    fiche=FicheTechnique.create(name_event: "Projet #{mystyle.name}", date: Date.today, eleve_responsable: "eleve #{mystyle.name}", professeur_referent: "professeur #{mystyle.name}", notes_complementaires: "yeah")
    projet=ProjetArtistique.create(title: "Projet #{mystyle.name}")
    conducteur = Conducteur.create!(fiche_technique: fiche, title: "Conducteur #{projet.title}")
    projet.update(conducteur: conducteur)
    params[:marker_ids].each do |metier| 
      # 1. On pioche UNE intro au hasard parmi les intros possibles
      intro = SequenceTemplate.where(style: style, phase: "intro",target_talent: metier).sample
      
      # 2. On pioche DEUX moments de "corps" (body) au hasard
      milieux = SequenceTemplate.where(style: style, phase: "body",target_talent: metier).sample(2)
      
      # 3. On pioche UNE sortie
      outro = SequenceTemplate.where(style: style, phase: "outro",target_talent: metier).sample

      # 4. On assemble le tout dans un tableau ordonné
      mon_scenario = [intro] + milieux + [outro]

      # 5. On crée les lignes du conducteur dans l'ordre du tableau
      next if mon_scenario.length == 0
      mon_scenario.each_with_index do |temp, index|
        next if temp.nil? # Sécurité si une phase est vide
        
        Conducteurline.create!(
          conducteur: conducteur,
          ordre: index + 1,
          sequenceaction: temp.label,
          interpretes: metier,
          lumieres_ambiante: style.ambiance_options.where(category: "lumieres").sample&.value || "blanc",
          machine_brouillard: style.ambiance_options.where(category: "machine_brouillard").sample&.value || "non",
          duree: "00:02:00"
        )
      end
    end
    redirect_to conducteur

  end
  def index
    @sequence_templates = SequenceTemplate.all
  end

  # GET /sequence_templates/1 or /sequence_templates/1.json
  def show
  end

  # GET /sequence_templates/new
  def new
    @sequence_template = SequenceTemplate.new
  end

  # GET /sequence_templates/1/edit
  def edit
  end

  # POST /sequence_templates or /sequence_templates.json
  def create
    @sequence_template = SequenceTemplate.new(sequence_template_params)

    respond_to do |format|
      if @sequence_template.save
        format.html { redirect_to @sequence_template, notice: "Sequence template was successfully created." }
        format.json { render :show, status: :created, location: @sequence_template }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sequence_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sequence_templates/1 or /sequence_templates/1.json
  def update
    respond_to do |format|
      if @sequence_template.update(sequence_template_params)
        format.html { redirect_to @sequence_template, notice: "Sequence template was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @sequence_template }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sequence_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sequence_templates/1 or /sequence_templates/1.json
  def destroy
    @sequence_template.destroy!

    respond_to do |format|
      format.html { redirect_to sequence_templates_path, notice: "Sequence template was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequence_template
      @sequence_template = SequenceTemplate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sequence_template_params
      params.require(:sequence_template).permit(:label, :phase, :target_talent, :suggested_light, :intensity)
    end
end
