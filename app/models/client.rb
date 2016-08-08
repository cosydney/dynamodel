class Client < ActiveRecord::Base
  belongs_to :user
  has_many :photo_shootings
  has_many :mannequins, through: :photo_shootings
end
