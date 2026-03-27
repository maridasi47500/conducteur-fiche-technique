class MaterielNecessairesController < ApplicationController
  before_action :set_materiel_necessaire, only: %i[ show edit update destroy ]

  # GET /materiel_necessaires or /materiel_necessaires.json
  def index
    @materiel_necessaires = MaterielNecessaire.all
  end

  # GET /materiel_necessaires/1 or /materiel_necessaires/1.json
  def show
  end

  # GET /materiel_necessaires/new
  def new
    @materiel_necessaire = MaterielNecessaire.new
  end

  # GET /materiel_necessaires/1/edit
  def edit
  end

  # POST /materiel_necessaires or /materiel_necessaires.json
  def create
    @materiel_necessaire = MaterielNecessaire.new(materiel_necessaire_params)

    respond_to do |format|
      if @materiel_necessaire.save
        format.html { redirect_to @materiel_necessaire.fiche_technique, notice: "Materiel necessaire was successfully created." }
        format.json { render :show, status: :created, location: @materiel_necessaire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @materiel_necessaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materiel_necessaires/1 or /materiel_necessaires/1.json
  def update
    respond_to do |format|
      if @materiel_necessaire.update(materiel_necessaire_params)
        format.html { redirect_to @materiel_necessaire.fiche_technique, notice: "Materiel necessaire was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @materiel_necessaire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @materiel_necessaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materiel_necessaires/1 or /materiel_necessaires/1.json
  def destroy
    @materiel_necessaire.destroy!

    respond_to do |format|
      format.html { redirect_to materiel_necessaires_path, notice: "Materiel necessaire was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materiel_necessaire
      @materiel_necessaire = MaterielNecessaire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def materiel_necessaire_params
      params.require(:materiel_necessaire).permit(:fiche_technique_id, :materiel_id, :quantite, :precisions_observations)
    end
end
