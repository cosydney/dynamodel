class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]
  has_one :mannequin
  has_one :client

  before_validation :set_profile
  validates :email, presence: true, uniqueness: true

  # validation of either the client if is_client true, or of mannequin
  validate :user_mannequin_or_client_validation

  def user_mannequin_or_client_validation
    puts is_client
    puts mannequin
    #if the user is not a client then the user needs a manequinn
    if !is_client && !mannequin
      errors.add(:base, "Can not create profile")
    elsif is_client && !client
      errors.add(:base, "Can not create profile")
    end
  end

  #before the validation of the user, build a profile (client or mannequin)
  #with empty first_name and last_name
  def set_profile
    return if mannequin || client
    if is_client
      build_client unless client
    else
      build_mannequin(first_name: "", last_name:"") unless mannequin
    end
  end

  def self.find_for_facebook_oauth(auth, is_client = false)
    user_params = auth.to_h.slice(:provider, :uid)
    # Get from facebook the email
    user_params.merge! auth.info.slice(:email)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation

      # When a user logs in, it gets the first_name and last_name to the mannequin
      if is_client == "true"
        user.build_client(auth.info.slice(:first_name, :last_name).to_h)
      else
        user.build_mannequin(auth.info.slice(:first_name, :last_name).to_h)
      end

      user.save

    end
    return user
  end

end
