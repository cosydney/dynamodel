class PhotoShooting < ActiveRecord::Base
  belongs_to :mannequin
  belongs_to :client
end
