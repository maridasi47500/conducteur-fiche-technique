class ShowThemesController < ApplicationController
  before_action :set_show_theme, only: %i[ show edit update destroy ]

  # GET /show_themes or /show_themes.json
  def index
    @show_themes = ShowTheme.all
  end

  # GET /show_themes/1 or /show_themes/1.json
  def show
  end

  # GET /show_themes/new
  def new
    @show_theme = ShowTheme.new
  end

  # GET /show_themes/1/edit
  def edit
  end

  # POST /show_themes or /show_themes.json
  def create
    @show_theme = ShowTheme.new(show_theme_params)

    respond_to do |format|
      if @show_theme.save
        format.html { redirect_to @show_theme, notice: "Show theme was successfully created." }
        format.json { render :show, status: :created, location: @show_theme }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @show_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /show_themes/1 or /show_themes/1.json
  def update
    respond_to do |format|
      if @show_theme.update(show_theme_params)
        format.html { redirect_to @show_theme, notice: "Show theme was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @show_theme }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @show_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /show_themes/1 or /show_themes/1.json
  def destroy
    @show_theme.destroy!

    respond_to do |format|
      format.html { redirect_to show_themes_path, notice: "Show theme was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show_theme
      @show_theme = ShowTheme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def show_theme_params
      params.require(:show_theme).permit(:projet_artistique_id, :title, :philosophical_inquiry, :emotional_frequency, :ai_blind_spot)
    end
end
