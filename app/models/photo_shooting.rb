class PhotoShooting < ActiveRecord::Base
  belongs_to :mannequin
  belongs_to :client

  validates :date, presence: true
  validates :budget, presence: true
  validates :description, presence: true

  validate :client, presence: true, uniqueness: true
  validate :mannequin, presence: true

end
