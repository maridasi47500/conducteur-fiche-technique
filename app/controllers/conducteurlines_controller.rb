class ConducteurlinesController < ApplicationController
  before_action :set_conducteurline, only: %i[ show edit update destroy ]

  # GET /conducteurlines or /conducteurlines.json
  def index
    @conducteurlines = Conducteurline.all
  end

  # GET /conducteurlines/1 or /conducteurlines/1.json
  def show
  end

  # GET /conducteurlines/new
  def new
    @conducteurline = Conducteurline.new
  end

  # GET /conducteurlines/1/edit
  def edit
  end

  # POST /conducteurlines or /conducteurlines.json
  def create
    @conducteurline = Conducteurline.new(conducteurline_params)

    respond_to do |format|
      if @conducteurline.save
        format.html { redirect_to @conducteurline.conducteur, notice: "Conducteurline was successfully created." }
        format.json { render :show, status: :created, location: @conducteurline }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conducteurline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conducteurlines/1 or /conducteurlines/1.json
  def update
    respond_to do |format|
      if @conducteurline.update(conducteurline_params)
        format.html { redirect_to @conducteurline.conducteur, notice: "Conducteurline was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @conducteurline }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conducteurline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conducteurlines/1 or /conducteurlines/1.json
  def destroy
    @conducteurline.destroy!

    respond_to do |format|
      format.html { redirect_to conducteurlines_path, notice: "Conducteurline was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conducteurline
      @conducteurline = Conducteurline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conducteurline_params
      params.require(:conducteurline).permit(:conducteur_id, :duree, :sequenceaction, :interpretes, :lumieres_ambiante, :lumieres_effet, :machine_brouillard, :videoprojection, :notes_technicien, :son, :notes_artistique, :creative_notes, :emotional_marker_id, :conducteur_line_positions_attributes=>{})
    end
end
