class Mannequin < ActiveRecord::Base
  belongs_to :user
  has_many :attachinary_files, dependent: :destroy
  has_many :photo_shootings
  has_many :clients, through: :photo_shootings
<<<<<<< HEAD

  validates :age, presence: true, on: :update
=======
  validates :age, presence: true
  has_attachments :photos
>>>>>>> 78574f593424cf2d33ca0486efaab1831f996c82
end
