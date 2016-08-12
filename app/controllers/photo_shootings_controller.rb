class PhotoShootingsController < ApplicationController
  before_action :set_photo_shooting, only: [:destroy, :show, :create]

  def show

  end

  def new
    @photo_shooting = PhotoShooting.new
  end

  def create
    @photo_shooting = PhotoShooting.build_photoShooting(photo_shooting_params)
    @photo_shooting.save
  end

  def destroy
    @photo_shooting.destroy
  end



  private

  def set_photo_shooting
    @photo_shooting = current_user.client
  end

  def photo_shooting_params
    params.require(:photo_shooting).permit(:address, :zip_code, :city, :country, :date, :budget, :description, :client_id)
  end
end


