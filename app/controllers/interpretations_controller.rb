class InterpretationsController < ApplicationController
  before_action :set_interpretation, only: %i[ show edit update destroy ]

  # GET /interpretations or /interpretations.json
  def index
    @interpretations = Interpretation.all
  end

  # GET /interpretations/1 or /interpretations/1.json
  def show
  end

  # GET /interpretations/new
  def new
    @interpretation = Interpretation.new
  end

  # GET /interpretations/1/edit
  def edit
  end

  # POST /interpretations or /interpretations.json
  def create
    @interpretation = Interpretation.new(interpretation_params)

    respond_to do |format|
      if @interpretation.save
        format.html { redirect_to @interpretation, notice: "Interpretation was successfully created." }
        format.json { render :show, status: :created, location: @interpretation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interpretation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interpretations/1 or /interpretations/1.json
  def update
    respond_to do |format|
      if @interpretation.update(interpretation_params)
        format.html { redirect_to @interpretation, notice: "Interpretation was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @interpretation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interpretation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interpretations/1 or /interpretations/1.json
  def destroy
    @interpretation.destroy!

    respond_to do |format|
      format.html { redirect_to interpretations_path, notice: "Interpretation was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interpretation
      @interpretation = Interpretation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interpretation_params
      params.require(:interpretation).permit(:conducteur_id, :machine_analysis, :human_judgment, :the_gap, :artistic_truth)
    end
end
