class RegistrationsController < Devise::RegistrationsController
  protected

  # To redirct users after sign-up to edit of either client or mannequin
  def after_sign_up_path_for(user)
    if current_user.mannequin
      '/mannequin/edit'
    else
      '/client/edit'
    end
  end
end
