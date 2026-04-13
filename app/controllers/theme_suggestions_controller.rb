class ThemeSuggestionsController < ApplicationController
  before_action :set_theme_suggestion, only: %i[ show edit update destroy ]

  # GET /theme_suggestions or /theme_suggestions.json
  def index
    @theme_suggestions = ThemeSuggestion.all
  end

  # GET /theme_suggestions/1 or /theme_suggestions/1.json
  def show
  end

  # GET /theme_suggestions/new
  def new
    @theme_suggestion = ThemeSuggestion.new
  end

  # GET /theme_suggestions/1/edit
  def edit
  end

  # POST /theme_suggestions or /theme_suggestions.json
  def create
    @theme_suggestion = ThemeSuggestion.new(theme_suggestion_params)

    respond_to do |format|
      if @theme_suggestion.save
        format.html { redirect_to @theme_suggestion, notice: "Theme suggestion was successfully created." }
        format.json { render :show, status: :created, location: @theme_suggestion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @theme_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /theme_suggestions/1 or /theme_suggestions/1.json
  def update
    respond_to do |format|
      if @theme_suggestion.update(theme_suggestion_params)
        format.html { redirect_to @theme_suggestion, notice: "Theme suggestion was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @theme_suggestion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @theme_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theme_suggestions/1 or /theme_suggestions/1.json
  def destroy
    @theme_suggestion.destroy!

    respond_to do |format|
      format.html { redirect_to theme_suggestions_path, notice: "Theme suggestion was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme_suggestion
      @theme_suggestion = ThemeSuggestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def theme_suggestion_params
      params.require(:theme_suggestion).permit(:category, :title, :description)
    end
end
