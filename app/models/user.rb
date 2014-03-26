class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  before_create :set_profile

  devise :database_authenticatable,
            :registerable,
            :recoverable,
            :rememberable,
            :trackable,
            :validatable,
            :omniauthable
  validates :email, :password, presence: true

  def self.get_existant_user user_params
    user = self.get_by_provider(user_params[:provider].presence, user_params[:uid].presence)
    if user.nil?
      user = self.get_by_email(user_params[:email].presence)
    end  
  end
  
  def self.get_by_provider provider, uid
    if provider.present? && uid.present?
       user = self.find_by(provider: provider, uid: uid)
    end
  end
  
  def self.get_by_email email
    if email.present?
       user = self.find_by(email: email)
    end
  end
  
  protected

  def set_profile
    self.create_profile
  end
  
end
