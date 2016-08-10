class PagesController < ApplicationController
  # overades the default action of divise (authentificate user)
  # It let's the homepage be accsess by not log-in users
  skip_before_action :authenticate_user!, only: :home
  def home
    @mannequins = Mannequin.all
  end
end
