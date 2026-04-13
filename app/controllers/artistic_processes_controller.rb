class ArtisticProcessesController < ApplicationController
  before_action :set_artistic_process, only: %i[ show edit update destroy ]

  # GET /artistic_processes or /artistic_processes.json
  def index
    @artistic_processes = ArtisticProcess.all
  end

  # GET /artistic_processes/1 or /artistic_processes/1.json
  def show
  end

  # GET /artistic_processes/new
  def new
    @artistic_process = ArtisticProcess.new
  end

  # GET /artistic_processes/1/edit
  def edit
  end

  # POST /artistic_processes or /artistic_processes.json
  def create
    @artistic_process = ArtisticProcess.new(artistic_process_params)

    respond_to do |format|
      if @artistic_process.save
        format.html { redirect_to @artistic_process, notice: "Artistic process was successfully created." }
        format.json { render :show, status: :created, location: @artistic_process }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artistic_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artistic_processes/1 or /artistic_processes/1.json
  def update
    respond_to do |format|
      if @artistic_process.update(artistic_process_params)
        format.html { redirect_to @artistic_process, notice: "Artistic process was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @artistic_process }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artistic_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artistic_processes/1 or /artistic_processes/1.json
  def destroy
    @artistic_process.destroy!

    respond_to do |format|
      format.html { redirect_to artistic_processes_path, notice: "Artistic process was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artistic_process
      @artistic_process = ArtisticProcess.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artistic_process_params
      params.require(:artistic_process).permit(:conducteur_id, :initial_impulse, :first_attempt, :doubts_questions, :rejected_ideas, :breakthrough, :final_form, :iteration_count, :what_changed)
    end
end
