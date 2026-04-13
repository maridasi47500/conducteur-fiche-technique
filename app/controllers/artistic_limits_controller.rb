class ArtisticLimitsController < ApplicationController
  before_action :set_artistic_limit, only: %i[ show edit update destroy ]

  # GET /artistic_limits or /artistic_limits.json
  def index
    @artistic_limits = ArtisticLimit.all
  end

  # GET /artistic_limits/1 or /artistic_limits/1.json
  def show
  end

  # GET /artistic_limits/new
  def new
    @artistic_limit = ArtisticLimit.new
  end

  # GET /artistic_limits/1/edit
  def edit
  end

  # POST /artistic_limits or /artistic_limits.json
  def create
    @artistic_limit = ArtisticLimit.new(artistic_limit_params)

    respond_to do |format|
      if @artistic_limit.save
        format.html { redirect_to @artistic_limit, notice: "Artistic limit was successfully created." }
        format.json { render :show, status: :created, location: @artistic_limit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artistic_limit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artistic_limits/1 or /artistic_limits/1.json
  def update
    respond_to do |format|
      if @artistic_limit.update(artistic_limit_params)
        format.html { redirect_to @artistic_limit, notice: "Artistic limit was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @artistic_limit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artistic_limit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artistic_limits/1 or /artistic_limits/1.json
  def destroy
    @artistic_limit.destroy!

    respond_to do |format|
      format.html { redirect_to artistic_limits_path, notice: "Artistic limit was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artistic_limit
      @artistic_limit = ArtisticLimit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artistic_limit_params
      params.require(:artistic_limit).permit(:conducteur_id, :what_i_want, :why_untranslatable, :contradiction, :emotional_truth, :left_unintentional)
    end
end
