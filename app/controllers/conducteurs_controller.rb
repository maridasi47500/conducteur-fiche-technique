class ConducteursController < ApplicationController
  before_action :set_conducteur, only: %i[ show edit update destroy editformlines]

  # GET /conducteurs or /conducteurs.json
  def index
    @conducteurs = Conducteur.all.order(:created_at => :desc).page params[:page]
  end

  # GET /conducteurs/1 or /conducteurs/1.json
  def show
    @conducteurline=Conducteurline.new(conducteur_id: @conducteur.id)
  end

  # GET /conducteurs/new
  def new
    @conducteur = Conducteur.new
  end

  # GET /conducteurs/1/edit
  def edit
  end
  def editformlines
  end

  # POST /conducteurs or /conducteurs.json
  def create
    @conducteur = Conducteur.new(conducteur_params)

    respond_to do |format|
      if @conducteur.save
        format.html { redirect_to @conducteur, notice: "Conducteur was successfully created." }
        format.json { render :show, status: :created, location: @conducteur }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conducteur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conducteurs/1 or /conducteurs/1.json
  def update
    respond_to do |format|
      if @conducteur.update(conducteur_params)
        format.html { redirect_to @conducteur, notice: "Conducteur was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @conducteur }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conducteur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conducteurs/1 or /conducteurs/1.json
  def destroy
    @conducteur.destroy!

    respond_to do |format|
      format.html { redirect_to conducteurs_path, notice: "Conducteur was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conducteur
      @conducteur = Conducteur.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conducteur_params
      params.require(:conducteur).permit(:title, :username, :conducteurlines_attributes => {})
    end
end
