class MannequinsController < ApplicationController
  before_action :set_mannequin, only: [:edit, :update, :destroy]
  before_action :desauthorize_client, only:[:edit]
  # A visitor can view each mannequin's profile
  skip_before_action :authenticate_user!, only: [:show, :index]
  # GET /mannequins
  # GET /mannequins.json
  def index
    @mannequins = Mannequin.all
  end

  # GET /mannequins/1
  # GET /mannequins/1.json
  def show
    @mannequin = Mannequin.find(params[:id])

    @photo_shooting = @mannequin.photo_shootings.build()
    # this disables the header and footer on this specific pages
    @disable = true
  end

  # GET /mannequins/edit
  def edit
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mannequin
      @mannequin = current_user.mannequin
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mannequin_params
      # here the photos need to be at the end for some mystic reasons
      params.require(:mannequin).permit(:first_name, :last_name, :phone, :age, :location, :category, :description, :height, :waist, :chest, :hips, :hair_color, :eyes, :ethnicity, photos: [])
    end

    def desauthorize_client
    # If the current user is not a client, he gets redirected to the root page
    if !current_user.mannequin
      redirect_to root_path, alert: "You don't have the rights"
    end
  end
end
