# setting variable tu use the same everywhere

@@hair_color = ["Blond", "Brunnette", "Red Hair", "Auburn", "Black"]
# for randoms http://stackoverflow.com/questions/2752231/random-record-in-activerecord
class PagesController < ApplicationController
  # overades the default action of divise (authentificate user)
  # It let's the homepage be accsess by not log-in users
  skip_before_action :authenticate_user!, only: [:home, :women, :men, :contact, :search]

  def home
    @hautecouture = findbycategory("haute-couture")
    @beaute = findbycategory("beaute")
    @atypique = findbycategory("atypique")
    @newface = findbycategory("new-face")
  end

  def search
    @gender = params["search"] && !params["search"]["gender"].reject {|c| c.blank?}.blank? ? params["search"]["gender"] : ["women", "men"]
    @hair = params ["search"]&& !params["search"]["hair_color"].reject{|c| c.blank?}.blank? ? params["search"]["hair_color"] : $hair_color
    # @ethnicity = params["search"]["ethinicity"]
    # @category = params["search"]["category"]
    @mannequin = Mannequin.where(gender: @gender)
  end

  def contact
  end

  def findbycategory(category)
    Mannequin.where(category: category).limit(4)
  end

  def women
    @women = Mannequin.where(gender: :women)
  end

  def men
    @men = Mannequin.where(gender: :men)
  end

end


