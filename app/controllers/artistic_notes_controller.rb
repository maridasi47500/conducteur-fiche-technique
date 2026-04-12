class ArtisticNotesController < ApplicationController
  before_action :set_artistic_note, only: %i[ show edit update destroy ]

  # GET /artistic_notes or /artistic_notes.json
  def index
    @artistic_notes = ArtisticNote.all
  end

  # GET /artistic_notes/1 or /artistic_notes/1.json
  def show
  end

  # GET /artistic_notes/new
  def new
    @artistic_note = ArtisticNote.new
  end

  # GET /artistic_notes/1/edit
  def edit
  end

  # POST /artistic_notes or /artistic_notes.json
  def create
    @artistic_note = ArtisticNote.new(artistic_note_params)

    respond_to do |format|
      if @artistic_note.save
        format.html { redirect_to @artistic_note, notice: "Artistic note was successfully created." }
        format.json { render :show, status: :created, location: @artistic_note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artistic_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artistic_notes/1 or /artistic_notes/1.json
  def update
    respond_to do |format|
      if @artistic_note.update(artistic_note_params)
        format.html { redirect_to @artistic_note, notice: "Artistic note was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @artistic_note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artistic_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artistic_notes/1 or /artistic_notes/1.json
  def destroy
    @artistic_note.destroy!

    respond_to do |format|
      format.html { redirect_to artistic_notes_path, notice: "Artistic note was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artistic_note
      @artistic_note = ArtisticNote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artistic_note_params
      params.require(:artistic_note).permit(:title, :content)
    end
end
