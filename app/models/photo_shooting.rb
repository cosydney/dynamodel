class PhotoShooting < ActiveRecord::Base
  belongs_to :mannequin
  belongs_to :client

  validates :date, presence: true
  validates :budget, presence: true
  validates :description, presence: true

  validates :client, presence: true, uniqueness: true
  validates :mannequin, presence: true

end
