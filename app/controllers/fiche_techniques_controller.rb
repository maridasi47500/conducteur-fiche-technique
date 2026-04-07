class FicheTechniquesController < ApplicationController
  before_action :set_fiche_technique, only: %i[ show edit update destroy editplandescene refaireplandescene]

  # GET /fiche_techniques or /fiche_techniques.json
  def refaireplandescene
    fiche=@fiche_technique
    fiche.plan_de_scene_dessins.destroy_all
    @materiel_necessaire=MaterielNecessaire.new(fiche_technique_id:@fiche_technique.id)
    @plan_de_scene_dessin=PlanDeSceneDessin.new(fiche_technique_id: @fiche_technique.id)
    fiche.materiel_necessaires.each do |mn|
      mat = mn.materiel
      zone = mat.zone # On utilise la table Zone liée au matériel

      mn.quantite.to_i.times do
        x = (mat.x_pref.to_i + rand(-mat.spread.to_i..mat.spread.to_i)).clamp(5, 95)
        y = rand(zone.y_min..zone.y_max)

        PlanDeSceneDessin.create!(
          fiche_technique: fiche,
          materiel_musicien: mat.name,
          coord_x: x, coord_y: y,
          layer: zone.name
        )
      end
    end
    render :show

  end
  def index
    @fiche_techniques = FicheTechnique.all.order(:created_at => :desc).page params[:page]
  end

  # GET /fiche_techniques/1 or /fiche_techniques/1.json
  def show
    @materiel_necessaire=MaterielNecessaire.new(fiche_technique_id:@fiche_technique.id)
    @plan_de_scene_dessin=PlanDeSceneDessin.new(fiche_technique_id: @fiche_technique.id)
  end

  # GET /fiche_techniques/new
  def new
    @fiche_technique = FicheTechnique.new(date: Date.today)
  end

  # GET /fiche_techniques/1/edit
  def edit
  end
  def editplandescene

  end
  # POST /fiche_techniques or /fiche_techniques.json
  def create
    @fiche_technique = FicheTechnique.new(fiche_technique_params)

    respond_to do |format|
      if @fiche_technique.save
        format.html { redirect_to @fiche_technique, notice: "Fiche technique was successfully created." }
        format.json { render :show, status: :created, location: @fiche_technique }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fiche_technique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fiche_techniques/1 or /fiche_techniques/1.json
  def update
    respond_to do |format|
      if @fiche_technique.update(fiche_technique_params)
        format.html { redirect_to @fiche_technique, notice: "Fiche technique was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @fiche_technique }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fiche_technique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fiche_techniques/1 or /fiche_techniques/1.json
  def destroy
    @fiche_technique.destroy!

    respond_to do |format|
      format.html { redirect_to fiche_techniques_path, notice: "Fiche technique was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fiche_technique
      @fiche_technique = FicheTechnique.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fiche_technique_params
      params.require(:fiche_technique).permit(:name_event, :eleve_responsable, :date, :professeur_referent, :notes_complementaires, :plan_de_scene_dessins_attributes=>{}, :materiel_necessaires_attributes=>{})
    end
end
