class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # add is_client as a parameter for devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :is_client])
  end
  def after_sign_up_path_for(user)
    if user.mannequin
      edit_mannequin_path #here i’m defining the path
    else
      root_path
    end
  end
end



