class MachineLogsController < ApplicationController
  before_action :set_machine_log, only: %i[ show edit update destroy ]

  # GET /machine_logs or /machine_logs.json
  def index
    @machine_logs = MachineLog.all
  end

  # GET /machine_logs/1 or /machine_logs/1.json
  def show
  end

  # GET /machine_logs/new
  def new
    @machine_log = MachineLog.new
  end

  # GET /machine_logs/1/edit
  def edit
  end

  # POST /machine_logs or /machine_logs.json
  def create
    @machine_log = MachineLog.new(machine_log_params)

    respond_to do |format|
      if @machine_log.save
        format.html { redirect_to @machine_log, notice: "Machine log was successfully created." }
        format.json { render :show, status: :created, location: @machine_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @machine_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machine_logs/1 or /machine_logs/1.json
  def update
    respond_to do |format|
      if @machine_log.update(machine_log_params)
        format.html { redirect_to @machine_log, notice: "Machine log was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @machine_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @machine_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machine_logs/1 or /machine_logs/1.json
  def destroy
    @machine_log.destroy!

    respond_to do |format|
      format.html { redirect_to machine_logs_path, notice: "Machine log was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine_log
      @machine_log = MachineLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def machine_log_params
      params.require(:machine_log).permit(:level, :module, :raw_data, :fb_translation, :human_perspective)
    end
end
