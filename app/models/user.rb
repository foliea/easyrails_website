class User < ActiveRecord::Base
  TEMP_EMAIL = 'temp@temp.io'

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

  def self.get_from_oauth provider, uid, email
    user = find_by(provider: provider, uid: uid)
    if user.nil? && email.present?
     user = find_by(email: email)
    end
    if user.nil?
      user = self.create(provider: provider,
                         uid:      uid,
                         email:    TEMP_EMAIL,
                         password: Devise.friendly_token[0,20],
                        )
    end
  end

  protected

  def set_profile
    binding.pry
    self.create_profile
  end

end
