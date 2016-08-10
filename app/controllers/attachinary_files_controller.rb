# Need a controller to have a separate page for photos
# What we did here is to set up the mannequin to know which mannequin we assigned the pictures to

class AttachinaryFilesController < ApplicationController
  before_action :set_attachinaryfile, only: [:show, :edit, :update, :destroy]

  # GET /attachinaryfiles
  # GET /attachinaryfiles.json
  def index
    @mannequin = Mannequin.find(params[:mannequin_id])
    @attachinaryfiles = AttachinaryFile.all
  end

  # GET /attachinaryfiles/1
  # GET /attachinaryfiles/1.json
  def show
  end

  # GET /attachinaryfiles/new
  def new
    @mannequin = Mannequin.find(params[:mannequin_id])
    @attachinaryfile = AttachinaryFile.new
  end

  # GET /attachinaryfiles/1/edit
  def edit
  end

  # POST /attachinaryfiles
  # POST /attachinaryfiles.json
  def create
    @mannequin = Mannequin.find(params[:mannequin_id])
    # @attachinaryfile = AttachinaryFile.new(attachinaryfile_params)
    respond_to do |format|
      if @mannequin.update(mannequin_params)

        format.html { redirect_to new_mannequin_attachinary_file_path(@mannequin), notice: 'Attachinaryfile was successfully created.' }
        format.json { render :show, status: :created, location: mannequin_attachinary_files(@attachinaryfile) }
      else
        format.html { render :new }
        format.json { render json: @mannequin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachinaryfiles/1
  # PATCH/PUT /attachinaryfiles/1.json
  def update
    respond_to do |format|
      if @attachinaryfile.update(attachinaryfile_params)
        format.html { redirect_to new_mannequin_attachinary_file_path, notice: 'Attachinaryfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachinaryfile }
      else
        format.html { render :edit }
        format.json { render json: @attachinaryfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachinaryfiles/1
  # DELETE /attachinaryfiles/1.json
  def destroy
    @attachinaryfile.destroy
    respond_to do |format|
      format.html { redirect_to attachinaryfiles_url, notice: 'Attachinaryfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   # Use callbacks to share common setup or constraints between actions.
    def set_attachinaryfile
      @attachinaryfile = AttachinaryFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mannequin_photos
      params.require(:mannequin) #.permit(photos: [])#, :scope, :public_id, :version, :width, :height, :format, :resource_type, :created_at, :updated_at)
    end
end
