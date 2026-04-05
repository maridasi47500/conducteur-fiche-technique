class AmbianceOptionsController < ApplicationController
  before_action :set_ambiance_option, only: %i[ show edit update destroy ]

  # GET /ambiance_options or /ambiance_options.json
  def index
    @ambiance_options = AmbianceOption.all
  end

  # GET /ambiance_options/1 or /ambiance_options/1.json
  def show
  end

  # GET /ambiance_options/new
  def new
    @ambiance_option = AmbianceOption.new
  end

  # GET /ambiance_options/1/edit
  def edit
  end

  # POST /ambiance_options or /ambiance_options.json
  def create
    @ambiance_option = AmbianceOption.new(ambiance_option_params)

    respond_to do |format|
      if @ambiance_option.save
        format.html { redirect_to @ambiance_option, notice: "Ambiance option was successfully created." }
        format.json { render :show, status: :created, location: @ambiance_option }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ambiance_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ambiance_options/1 or /ambiance_options/1.json
  def update
    respond_to do |format|
      if @ambiance_option.update(ambiance_option_params)
        format.html { redirect_to @ambiance_option, notice: "Ambiance option was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @ambiance_option }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ambiance_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ambiance_options/1 or /ambiance_options/1.json
  def destroy
    @ambiance_option.destroy!

    respond_to do |format|
      format.html { redirect_to ambiance_options_path, notice: "Ambiance option was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ambiance_option
      @ambiance_option = AmbianceOption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ambiance_option_params
      params.require(:ambiance_option).permit(:style_id, :category, :value)
    end
end
