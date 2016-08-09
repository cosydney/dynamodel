class MannequinsController < ApplicationController
  before_action :set_mannequin, only: [:show, :edit, :update, :destroy]

  # GET /mannequins
  # GET /mannequins.json
  def index
    @mannequins = Mannequin.all
  end

  # GET /mannequins/1
  # GET /mannequins/1.json
  def show
  end

  # GET /mannequins/new
  def new
    @mannequin = Mannequin.new
  end

  # GET /mannequins/1/edit
  def edit
  end

  # POST /mannequins
  # POST /mannequins.json
  def create
    @mannequin = Mannequin.new(mannequin_params)

    respond_to do |format|
      if @mannequin.save
        format.html { redirect_to @mannequin, notice: 'Mannequin was successfully created.' }
        format.json { render :show, status: :created, location: @mannequin }
      else
        format.html { render :new }
        format.json { render json: @mannequin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mannequins/1
  # PATCH/PUT /mannequins/1.json
  def update
    respond_to do |format|
      if @mannequin.update(mannequin_params)
        format.html { redirect_to @mannequin, notice: 'Mannequin was successfully updated.' }
        format.json { render :show, status: :ok, location: @mannequin }
      else
        format.html { render :edit }
        format.json { render json: @mannequin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mannequins/1
  # DELETE /mannequins/1.json
  def destroy
    @mannequin.destroy
    respond_to do |format|
      format.html { redirect_to mannequins_url, notice: 'Mannequin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mannequin
      @mannequin = Mannequin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mannequin_params
      params.require(:mannequin).permit(photos: [],:age, :location, :category, :description, :height, :waist, :chest, :hips, :hair_color, :eyes, :ethnicity)
    end
end
