class SequenceTemplatesController < ApplicationController
  before_action :set_sequence_template, only: %i[ show edit update destroy ]

  # GET /sequence_templates or /sequence_templates.json
  def index
    @sequence_templates = SequenceTemplate.all
  end

  # GET /sequence_templates/1 or /sequence_templates/1.json
  def show
  end

  # GET /sequence_templates/new
  def new
    @sequence_template = SequenceTemplate.new
  end

  # GET /sequence_templates/1/edit
  def edit
  end

  # POST /sequence_templates or /sequence_templates.json
  def create
    @sequence_template = SequenceTemplate.new(sequence_template_params)

    respond_to do |format|
      if @sequence_template.save
        format.html { redirect_to @sequence_template, notice: "Sequence template was successfully created." }
        format.json { render :show, status: :created, location: @sequence_template }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sequence_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sequence_templates/1 or /sequence_templates/1.json
  def update
    respond_to do |format|
      if @sequence_template.update(sequence_template_params)
        format.html { redirect_to @sequence_template, notice: "Sequence template was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @sequence_template }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sequence_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sequence_templates/1 or /sequence_templates/1.json
  def destroy
    @sequence_template.destroy!

    respond_to do |format|
      format.html { redirect_to sequence_templates_path, notice: "Sequence template was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequence_template
      @sequence_template = SequenceTemplate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sequence_template_params
      params.require(:sequence_template).permit(:label, :phase, :target_talent, :suggested_light, :intensity)
    end
end
