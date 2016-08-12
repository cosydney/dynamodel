class PhotoShootingsController < ApplicationController
  before_action :set_photo_shooting, only: [:destroy, :show, :create]

  def show

  end

  def new
    @photo_shooting = current_user.client.photo_shootings.build

    @mannequins = Mannequin.all.order(:first_name)
  end

  def create
    @photo_shooting = current_user.client.photo_shootings.build(photo_shooting_params)

    if @photo_shooting.save
      redirect_to client_photo_shooting_path(@photo_shooting), notice: "photo shoot Added!"
    else
      @mannequin = Mannequin.find(photo_shooting_params[:mannequin_id])
      render :template => "mannequins/show", notice: "Error!"
    end
  end

  def destroy
    @photo_shooting.destroy
  end

  private

  def set_photo_shooting
    @photo_shooting = current_user.client
  end

  def photo_shooting_params
    params.require(:photo_shooting).permit(:address, :zip_code, :city, :country, :date, :budget, :description, :mannequin_id)
  end
end


