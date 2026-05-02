class ConducteurLinePositionsController < ApplicationController
  before_action :set_conducteur_line_position, only: %i[ show edit update destroy ]

  # GET /conducteur_line_positions or /conducteur_line_positions.json
  def index
    @conducteur_line_positions = ConducteurLinePosition.all
  end

  # GET /conducteur_line_positions/1 or /conducteur_line_positions/1.json
  def show
  end

  # GET /conducteur_line_positions/new
  def new
    @conducteur_line_position = ConducteurLinePosition.new
  end

  # GET /conducteur_line_positions/1/edit
  def edit
  end

  # POST /conducteur_line_positions or /conducteur_line_positions.json
  def create
    @conducteur_line_position = ConducteurLinePosition.new(conducteur_line_position_params)

    respond_to do |format|
      if @conducteur_line_position.save
        format.html { redirect_to @conducteur_line_position, notice: "Conducteur line position was successfully created." }
        format.json { render :show, status: :created, location: @conducteur_line_position }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conducteur_line_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conducteur_line_positions/1 or /conducteur_line_positions/1.json
  def update
    respond_to do |format|
      if @conducteur_line_position.update(conducteur_line_position_params)
        format.html { redirect_to @conducteur_line_position, notice: "Conducteur line position was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @conducteur_line_position }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conducteur_line_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conducteur_line_positions/1 or /conducteur_line_positions/1.json
  def destroy
    @conducteur_line_position.destroy!

    respond_to do |format|
      format.html { redirect_to conducteur_line_positions_path, notice: "Conducteur line position was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conducteur_line_position
      @conducteur_line_position = ConducteurLinePosition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conducteur_line_position_params
      params.require(:conducteur_line_position).permit(:conducteurline_id_id, :materiel_id, :coord_x, :coord_y, :transition_type)
    end
end
