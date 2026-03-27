class PlanDeSceneDessinsController < ApplicationController
  before_action :set_plan_de_scene_dessin, only: %i[ show edit update destroy ]

  # GET /plan_de_scene_dessins or /plan_de_scene_dessins.json
  def index
    @plan_de_scene_dessins = PlanDeSceneDessin.all
  end

  # GET /plan_de_scene_dessins/1 or /plan_de_scene_dessins/1.json
  def show
  end

  # GET /plan_de_scene_dessins/new
  def new
    @plan_de_scene_dessin = PlanDeSceneDessin.new
  end

  # GET /plan_de_scene_dessins/1/edit
  def edit
  end

  # POST /plan_de_scene_dessins or /plan_de_scene_dessins.json
  def create
    @plan_de_scene_dessin = PlanDeSceneDessin.new(plan_de_scene_dessin_params)

    respond_to do |format|
      if @plan_de_scene_dessin.save
        format.html { redirect_to @plan_de_scene_dessin.fiche_technique, notice: "Plan de scene dessin was successfully created." }
        format.json { render :show, status: :created, location: @plan_de_scene_dessin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plan_de_scene_dessin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plan_de_scene_dessins/1 or /plan_de_scene_dessins/1.json
  def update
    respond_to do |format|
      if @plan_de_scene_dessin.update(plan_de_scene_dessin_params)
        format.html { redirect_to @plan_de_scene_dessin.fiche_technique, notice: "Plan de scene dessin was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @plan_de_scene_dessin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plan_de_scene_dessin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plan_de_scene_dessins/1 or /plan_de_scene_dessins/1.json
  def destroy
    @plan_de_scene_dessin.destroy!

    respond_to do |format|
      format.html { redirect_to plan_de_scene_dessins_path, notice: "Plan de scene dessin was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan_de_scene_dessin
      @plan_de_scene_dessin = PlanDeSceneDessin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plan_de_scene_dessin_params
      params.require(:plan_de_scene_dessin).permit(:fiche_technique_id, :disposition, :materiel_musicien, :ordre)
    end
end
