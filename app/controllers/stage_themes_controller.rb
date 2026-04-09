class StageThemesController < ApplicationController
  before_action :set_stage_theme, only: %i[ show edit update destroy ]

  # GET /stage_themes or /stage_themes.json
  def index
    @stage_themes = StageTheme.all
  end

  # GET /stage_themes/1 or /stage_themes/1.json
  def show
  end

  # GET /stage_themes/new
  def new
    @stage_theme = StageTheme.new
  end

  # GET /stage_themes/1/edit
  def edit
  end

  # POST /stage_themes or /stage_themes.json
  def create
    @stage_theme = StageTheme.new(stage_theme_params)

    respond_to do |format|
      if @stage_theme.save
        format.html { redirect_to @stage_theme, notice: "Stage theme was successfully created." }
        format.json { render :show, status: :created, location: @stage_theme }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stage_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stage_themes/1 or /stage_themes/1.json
  def update
    respond_to do |format|
      if @stage_theme.update(stage_theme_params)
        format.html { redirect_to @stage_theme, notice: "Stage theme was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @stage_theme }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stage_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stage_themes/1 or /stage_themes/1.json
  def destroy
    @stage_theme.destroy!

    respond_to do |format|
      format.html { redirect_to stage_themes_path, notice: "Stage theme was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage_theme
      @stage_theme = StageTheme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stage_theme_params
      params.require(:stage_theme).permit(:name)
    end
end
