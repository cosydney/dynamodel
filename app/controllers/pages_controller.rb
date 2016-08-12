# setting variable tu use the same everywhere
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
    # setting a default value for gender to female and male if the person hasn't checked anything, if he did than there goes his
    @gender = params["search"] && !params["search"]["gender"].reject {|c| c.blank?}.blank? ? params["search"]["gender"] : ["women", "men"]
    @hair = params["search"] && !params["search"]["hair_color"].reject {|c| c.blank?}.blank? ? params["search"]["hair_color"] : Mannequin.hair_color
    @ethnicity = params["search"] && !params["search"]["ethnicity"].reject {|c| c.blank?}.blank? ? params["search"]["ethnicity"] : Mannequin.ethnicity
    @category = params["search"] && !params["search"]["category"].reject {|c| c.blank?}.blank? ? params["search"]["category"] : Mannequin.category
    @mannequin = Mannequin.where(gender: @gender, hair_color: @hair, ethnicity: @ethnicity, category: @category)
    @searchy = params["search"] || {}
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


