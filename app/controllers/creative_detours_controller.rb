class CreativeDetoursController < ApplicationController
  before_action :set_creative_detour, only: %i[ show edit update destroy clone ]

  # GET /creative_detours or /creative_detours.json
  def clone
    x=@creative_detour.clone_without_relations
    redirect_to x

  end
  def index
    @creative_detours = CreativeDetour.all
  end

  # GET /creative_detours/1 or /creative_detours/1.json
  def show
  end

  # GET /creative_detours/new
  def new
    @creative_detour = CreativeDetour.new
  end

  # GET /creative_detours/1/edit
  def edit
  end

  # POST /creative_detours or /creative_detours.json
  def create
    @creative_detour = CreativeDetour.new(creative_detour_params)

    respond_to do |format|
      if @creative_detour.save
        format.html { redirect_to @creative_detour, notice: "Creative detour was successfully created." }
        format.json { render :show, status: :created, location: @creative_detour }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @creative_detour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creative_detours/1 or /creative_detours/1.json
  def update
    respond_to do |format|
      if @creative_detour.update(creative_detour_params)
        format.html { redirect_to @creative_detour, notice: "Creative detour was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @creative_detour }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @creative_detour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creative_detours/1 or /creative_detours/1.json
  def destroy
    @creative_detour.destroy!

    respond_to do |format|
      format.html { redirect_to creative_detours_path, notice: "Creative detour was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creative_detour
      @creative_detour = CreativeDetour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def creative_detour_params
      params.require(:creative_detour).permit(:title, :concept, :action, :database_usage, :reaction, :storage_impact, :challenge)
    end
end
