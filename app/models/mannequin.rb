class Mannequin < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :photo_shootings
end
