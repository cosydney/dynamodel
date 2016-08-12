class Client < ActiveRecord::Base
  belongs_to :user
  has_many :photo_shootings
  has_many :mannequins, through: :photo_shootings

  # validates :company_name, presence: true
  # validates :website, presence: true
end
