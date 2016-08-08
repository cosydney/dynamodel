class Client < ActiveRecord::Base
  belongs_to :user
  has_many :photo_shootings
end
