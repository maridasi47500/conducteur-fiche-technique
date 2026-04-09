class DirectiveArtistiquesController < ApplicationController
  before_action :set_directive_artistique, only: %i[ show edit update destroy ]

  # GET /directive_artistiques or /directive_artistiques.json
  def index
    @directive_artistiques = DirectiveArtistique.all
  end

  # GET /directive_artistiques/1 or /directive_artistiques/1.json
  def show
  end

  # GET /directive_artistiques/new
  def new
    @directive_artistique = DirectiveArtistique.new
  end

  # GET /directive_artistiques/1/edit
  def edit
  end

  # POST /directive_artistiques or /directive_artistiques.json
  def create
    @directive_artistique = DirectiveArtistique.new(directive_artistique_params)

    respond_to do |format|
      if @directive_artistique.save
        format.html { redirect_to @directive_artistique, notice: "Directive artistique was successfully created." }
        format.json { render :show, status: :created, location: @directive_artistique }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @directive_artistique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /directive_artistiques/1 or /directive_artistiques/1.json
  def update
    respond_to do |format|
      if @directive_artistique.update(directive_artistique_params)
        format.html { redirect_to @directive_artistique, notice: "Directive artistique was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @directive_artistique }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @directive_artistique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directive_artistiques/1 or /directive_artistiques/1.json
  def destroy
    @directive_artistique.destroy!

    respond_to do |format|
      format.html { redirect_to directive_artistiques_path, notice: "Directive artistique was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_directive_artistique
      @directive_artistique = DirectiveArtistique.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def directive_artistique_params
      params.require(:directive_artistique).permit(:name, :stage_theme_id, :default_lumieres_ambiante, :default_lumieres_effet, :default_videoprojection, :default_son, :default_notes_technicien, :default_sequenceaction, :default_duree, :default_interpretes)
    end
end
