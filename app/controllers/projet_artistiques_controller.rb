require "./app/services/projet_artistique"
class ProjetArtistiquesController < ApplicationController
  before_action :set_projet_artistique, only: %i[ show edit update destroy ]

  # GET /projet_artistiques or /projet_artistiques.json
  def index
    @projet_artistiques = ProjetArtistique.all.order(:created_at => :desc).page params[:page]
  end

  # GET /projet_artistiques/1 or /projet_artistiques/1.json
  def show
  end

  # GET /projet_artistiques/new
  def new
    @projet_artistique = ProjetArtistique.new
  end

  # GET /projet_artistiques/1/edit
  def edit
  end

  # POST /projet_artistiques or /projet_artistiques.json
  def create
    @projet_artistique = ProjetArtistique.new(projet_artistique_params)

    respond_to do |format|
      if @projet_artistique.save
        g=MonProjetArtistique.new(@projet_artistique).generer_spectacle_complet()
        format.html { redirect_to @projet_artistique, notice: "Projet artistique was successfully created." }
        format.json { render :show, status: :created, location: @projet_artistique }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @projet_artistique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projet_artistiques/1 or /projet_artistiques/1.json
  def update
    respond_to do |format|
      if @projet_artistique.update(projet_artistique_params)
        g=MonProjetArtistique.new(@projet_artistique).generer_spectacle_complet()
        format.html { redirect_to @projet_artistique, notice: "Projet artistique was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @projet_artistique }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @projet_artistique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projet_artistiques/1 or /projet_artistiques/1.json
  def destroy
    @projet_artistique.destroy!

    respond_to do |format|
      format.html { redirect_to projet_artistiques_path, notice: "Projet artistique was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projet_artistique
      @projet_artistique = ProjetArtistique.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def projet_artistique_params
      params.require(:projet_artistique).permit(:fiche_technique_id, :conducteur_id, :title, :username, :useia, :style, :instrument_principal_id)
    end
end
