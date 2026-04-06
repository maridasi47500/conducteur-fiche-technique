class InspirationResourcesController < ApplicationController
  before_action :set_inspiration_resource, only: %i[ show edit update destroy ]

  # GET /inspiration_resources or /inspiration_resources.json
  def index
    @inspiration_resources = InspirationResource.all
  end

  # GET /inspiration_resources/1 or /inspiration_resources/1.json
  def show
  end

  # GET /inspiration_resources/new
  def new
    @inspiration_resource = InspirationResource.new
  end

  # GET /inspiration_resources/1/edit
  def edit
  end

  # POST /inspiration_resources or /inspiration_resources.json
  def create
    @inspiration_resource = InspirationResource.new(inspiration_resource_params)

    respond_to do |format|
      if @inspiration_resource.save
        format.html { redirect_to @inspiration_resource, notice: "Inspiration resource was successfully created." }
        format.json { render :show, status: :created, location: @inspiration_resource }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inspiration_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inspiration_resources/1 or /inspiration_resources/1.json
  def update
    respond_to do |format|
      if @inspiration_resource.update(inspiration_resource_params)
        format.html { redirect_to @inspiration_resource, notice: "Inspiration resource was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @inspiration_resource }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inspiration_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inspiration_resources/1 or /inspiration_resources/1.json
  def destroy
    @inspiration_resource.destroy!

    respond_to do |format|
      format.html { redirect_to inspiration_resources_path, notice: "Inspiration resource was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inspiration_resource
      @inspiration_resource = InspirationResource.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inspiration_resource_params
      params.require(:inspiration_resource).permit(:title, :url, :category)
    end
end
