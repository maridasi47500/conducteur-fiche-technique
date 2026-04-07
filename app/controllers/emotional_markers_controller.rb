class EmotionalMarkersController < ApplicationController
  before_action :set_emotional_marker, only: %i[ show edit update destroy ]

  # GET /emotional_markers or /emotional_markers.json
  def index
    @emotional_markers = EmotionalMarker.all
  end

  # GET /emotional_markers/1 or /emotional_markers/1.json
  def show
  end

  # GET /emotional_markers/new
  def new
    @emotional_marker = EmotionalMarker.new
  end

  # GET /emotional_markers/1/edit
  def edit
  end

  # POST /emotional_markers or /emotional_markers.json
  def create
    @emotional_marker = EmotionalMarker.new(emotional_marker_params)

    respond_to do |format|
      if @emotional_marker.save
        format.html { redirect_to @emotional_marker, notice: "Emotional marker was successfully created." }
        format.json { render :show, status: :created, location: @emotional_marker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emotional_marker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emotional_markers/1 or /emotional_markers/1.json
  def update
    respond_to do |format|
      if @emotional_marker.update(emotional_marker_params)
        format.html { redirect_to @emotional_marker, notice: "Emotional marker was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @emotional_marker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emotional_marker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emotional_markers/1 or /emotional_markers/1.json
  def destroy
    @emotional_marker.destroy!

    respond_to do |format|
      format.html { redirect_to emotional_markers_path, notice: "Emotional marker was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emotional_marker
      @emotional_marker = EmotionalMarker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def emotional_marker_params
      params.require(:emotional_marker).permit(:name)
    end
end
