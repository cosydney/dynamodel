class Mannequin < ActiveRecord::Base
  @@hair_color = ["Blond", "Brunnette", "Red Hair", "Auburn", "Black"]
  @@ethnicity = %w(caucasian asian black american francais)
  @@category = ["beaute", "haute-couture", "atypique", "new-face", "hipster"]

  belongs_to :user
  has_many :attachinary_files
  has_many :photo_shootings
  has_many :clients, through: :photo_shootings

  validates :age, presence: true, on: :update
  has_attachments :photos

  def self.hair_color
    @@hair_color
  end

  def self.ethnicity
    @@ethnicity
  end

  def self.category
    @@category
  end

end
