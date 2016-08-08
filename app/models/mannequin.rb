class Mannequin < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :photo_shootings
  has_many :clients, through: :photo_shootings
  validates :age, presence :true
end