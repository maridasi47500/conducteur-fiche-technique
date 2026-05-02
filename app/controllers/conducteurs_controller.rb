class ConducteursController < ApplicationController
  before_action :set_conducteur, only: %i[ show edit update destroy editformlines star ingredients mixer_ingredients advanced_generator generate_advanced_conductor getexcelsheet]
  # Ce dictionnaire fait le pont entre le "Truc" coché et les colonnes SQL
  ARTISTIC_CONFIGS=StageTheme.to_artistic_hash
  #ARTISTIC_CONFIGS = {
  #    "Conducting Technique" => {
  #      "Directives" => {
  #        "Gestes amples (Air)" => { lumieres_effet: "gradateur lent", videoprojection: "nuages fluides", son: "nappes synthé" },
  #        "Saccades (Électricité)" => { lumieres_effet: "stroboscope", videoprojection: "flashs blancs", son: "glitch audio" }
  #      }
  #    },
  #    "Stage Lighting" => {
  #      "Directives" => {
  #        "Ombres décalées" => { lumieres_ambiante: "rasant", videoprojection: "silhouette différée", machine_brouillard: "léger" },
  #        "Douche isolante" => { lumieres_effet: "douche", lumieres_ambiante: "noir", notes_technicien: "Suivre l'interprète" }
  #      }
  #    },
  #    "Storytelling" => {
  #      "Directives" => {
  #        "Voix IA déformée" => { son: "ia_voice_pitch.mp3", videoprojection: "texte défilant", interpretes: "Acteur + IA" },
  #        "Souvenirs numériques" => { videoprojection: "photos archives", son: "bruit de bande", lumieres_ambiante: "ambre" }
  #      }
  #    }  # Ajoutez les autres 13 thématiques ici...
  #}.freeze

  # GET /conducteurs or /conducteurs.json
  def getexcelsheet
    csv=""
    csv+=["duree", "sequence / action", "interpretes", "son","lumieres ambiantes", "lumieres effet", "machine brouillard", "videoprojection", "notes technicien"].map{|g|g.gsub(",","")}.join(",")+"\n"

    @conducteur.conducteurlines.each do |x|
      csv+=""+[x.maduree.to_s, x.sequenceaction, x.interpretes, x.son,x.lumieres_ambiante, x.lumieres_effet, x.machine_brouillard, x.videoprojection, x.notes_technicien].map{|g|g.to_s.gsub(",","")}.join(",")+"\n"
    end
    hello="./public/uploads/conducteur#{@conducteur.id}.csv"
    File.write(hello, csv)
    x=`libreoffice "#{hello}"`
    
  end
  def index
    @conducteurs = Conducteur.all.order(:created_at => :desc).page params[:page]
  end
  def advanced_generator
    # Un exemple de structure de données pour alimenter votre formulaire dynamique
    @ARTISTIC_MAPPING=ARTISTIC_CONFIGS
  end
  def generate_advanced_conductor
    @conducteur.update(starred: true)
    
    params[:directives].each_with_index do |label, index|
      # On retrouve la configuration technique associée au label choisi
      config = find_config_by_label(label) 
  
      @conducteur.conducteurlines.create!(
        ordre: index + 1,
        sequenceaction: "Exploration de : #{label}",
        # On fusionne les valeurs par défaut avec la config spécifique
        **config 
      )
    end
    redirect_to @conducteur
  end
  def ingredients
  end
  def mixer_ingredients
    @conducteur.generate_random_performance!(params[:marker_ids])
    redirect_to @conducteur
  end
  # app/controllers/conducteurs_controller.rb
  def inspiration_view
    @conducteur = Conducteur.find(params[:id])
    @random_resources = InspirationResource.order("RANDOM()").limit(3)
    @conducteurlines = @conducteur.conducteurlines.order(:ordre)
    
    render :inspiration, layout: 'inspiration' # minimal layout
  end

  # GET /conducteurs/1 or /conducteurs/1.json
  def star
    if @conducteur.starred
      @conducteur.update(starred: false)
    else
      @conducteur.update(starred: true)

    end
    render json: {on: (@conducteur.starred ? "true" : "false")}
  end
  def show
    @conducteurline=Conducteurline.new(conducteur_id: @conducteur.id)
  end

  # GET /conducteurs/new
  def new
    @conducteur = Conducteur.new
  end

  # GET /conducteurs/1/edit
  def edit
  end
  def editformlines
  end

  # POST /conducteurs or /conducteurs.json
  def create
    @conducteur = Conducteur.new(conducteur_params)

    respond_to do |format|
      if @conducteur.save
        format.html { redirect_to @conducteur, notice: "Conducteur was successfully created." }
        format.json { render :show, status: :created, location: @conducteur }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conducteur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conducteurs/1 or /conducteurs/1.json
  def update
    respond_to do |format|
      if @conducteur.update(conducteur_params)
        format.html { redirect_to @conducteur, notice: "Conducteur was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @conducteur }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conducteur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conducteurs/1 or /conducteurs/1.json
  def destroy
    @conducteur.destroy!

    respond_to do |format|
      format.html { redirect_to conducteurs_path, notice: "Conducteur was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
  
  def find_config_by_label(label)
    # On cherche dans le dictionnaire, sinon on renvoie une config par défaut vide
    ARTISTIC_CONFIGS.values.find { |v| v["Directives"].key?(label) }&.dig("Directives", label) || { 
      lumieres_ambiante: "neutre", 
      lumieres_effet: "aucun", 
      videoprojection: "rien", 
      son: "aucun" 
    }
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_conducteur
      @conducteur = Conducteur.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conducteur_params
      params.require(:conducteur).permit(:title, :fiche_technique_id, :username,:tempo_range,:notes, :conducteurlines_attributes => {}, :emotional_marker_ids=>[])
    end
end
