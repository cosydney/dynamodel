class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(user)
    if current_user.mannequin
      '/mannequin/edit'
    else
      '/client/edit'
    end
  end
end
