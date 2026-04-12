class ShareYourGapsController < ApplicationController
  before_action :set_share_your_gap, only: %i[ show edit update destroy ]

  # GET /share_your_gaps or /share_your_gaps.json
  def index
    @share_your_gaps = ShareYourGap.all
  end

  # GET /share_your_gaps/1 or /share_your_gaps/1.json
  def show
  end

  # GET /share_your_gaps/new
  def new
    @share_your_gap = ShareYourGap.new
  end

  # GET /share_your_gaps/1/edit
  def edit
  end

  # POST /share_your_gaps or /share_your_gaps.json
  def create
    @share_your_gap = ShareYourGap.new(share_your_gap_params)

    respond_to do |format|
      if @share_your_gap.save
        format.html { redirect_to @share_your_gap, notice: "Share your gap was successfully created." }
        format.json { render :show, status: :created, location: @share_your_gap }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @share_your_gap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /share_your_gaps/1 or /share_your_gaps/1.json
  def update
    respond_to do |format|
      if @share_your_gap.update(share_your_gap_params)
        format.html { redirect_to @share_your_gap, notice: "Share your gap was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @share_your_gap }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @share_your_gap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /share_your_gaps/1 or /share_your_gaps/1.json
  def destroy
    @share_your_gap.destroy!

    respond_to do |format|
      format.html { redirect_to share_your_gaps_path, notice: "Share your gap was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share_your_gap
      @share_your_gap = ShareYourGap.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def share_your_gap_params
      params.require(:share_your_gap).permit(:conducteur_id, :analysis, :response, :interpretation)
    end
end
