class PhotosController < ApplicationController

def photo_params
  params.require(:photo).permit(:name, :description, photos: [])
end

end