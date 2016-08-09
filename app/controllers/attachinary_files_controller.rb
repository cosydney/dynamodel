class AttachinaryFilesController < ApplicationController
  before_action :set_attachinary_file, only: [:show, :edit, :update, :destroy]

  # GET /attachinary_files
  # GET /attachinary_files.json
  def index
    @attachinary_files = AttachinaryFile.all
  end

  # GET /attachinary_files/1
  # GET /attachinary_files/1.json
  def show
  end

  # GET /attachinary_files/new
  def new
    @attachinary_file = Attachinary_file.new
  end

  # GET /attachinary_files/1/edit
  def edit
  end

  # POST /attachinary_files
  # POST /attachinary_files.json
  def create
    @attachinary_file = Attachinary_file.new(attachinary_file_params)

    respond_to do |format|
      if @attachinary_file.save
        format.html { redirect_to @attachinary_file, notice: 'Attachinary_file was successfully created.' }
        format.json { render :show, status: :created, location: @attachinary_file }
      else
        format.html { render :new }
        format.json { render json: @attachinary_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachinary_files/1
  # PATCH/PUT /attachinary_files/1.json
  def update
    respond_to do |format|
      if @attachinary_file.update(attachinary_file_params)
        format.html { redirect_to @attachinary_file, notice: 'Attachinary_file was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachinary_file }
      else
        format.html { render :edit }
        format.json { render json: @attachinary_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachinary_files/1
  # DELETE /attachinary_files/1.json
  def destroy
    @attachinary_file.destroy
    respond_to do |format|
      format.html { redirect_to attachinary_files_url, notice: 'Attachinary_file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachinary_file
      @attachinary_file = Attachinary_file.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachinary_file_params
      params.require(:attachinary_file).permit(photos: [])#, :scope, :public_id, :version, :width, :height, :format, :resource_type, :created_at, :updated_at)
    end
end
