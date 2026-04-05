class MetierDependenciesController < ApplicationController
  before_action :set_metier_dependency, only: %i[ show edit update destroy ]

  # GET /metier_dependencies or /metier_dependencies.json
  def index
    @metier_dependencies = MetierDependency.all
  end

  # GET /metier_dependencies/1 or /metier_dependencies/1.json
  def show
  end

  # GET /metier_dependencies/new
  def new
    @metier_dependency = MetierDependency.new
  end

  # GET /metier_dependencies/1/edit
  def edit
  end

  # POST /metier_dependencies or /metier_dependencies.json
  def create
    @metier_dependency = MetierDependency.new(metier_dependency_params)

    respond_to do |format|
      if @metier_dependency.save
        format.html { redirect_to @metier_dependency, notice: "Metier dependency was successfully created." }
        format.json { render :show, status: :created, location: @metier_dependency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @metier_dependency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metier_dependencies/1 or /metier_dependencies/1.json
  def update
    respond_to do |format|
      if @metier_dependency.update(metier_dependency_params)
        format.html { redirect_to @metier_dependency, notice: "Metier dependency was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @metier_dependency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @metier_dependency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metier_dependencies/1 or /metier_dependencies/1.json
  def destroy
    @metier_dependency.destroy!

    respond_to do |format|
      format.html { redirect_to metier_dependencies_path, notice: "Metier dependency was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metier_dependency
      @metier_dependency = MetierDependency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def metier_dependency_params
      params.require(:metier_dependency).permit(:materiel_id, :required_item_id, :qty_multiplier, :note)
    end
end
