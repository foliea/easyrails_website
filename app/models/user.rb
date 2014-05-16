class User < ActiveRecord::Base
  TEMP_EMAIL       = '@temp.com'
  TEMP_EMAIL_REGEX = /.+#{TEMP_EMAIL}$/

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
    return user if user.present?
    user = self.create(provider: provider,
                       uid:      uid,
                       email:    "#{uid}_#{provider}#{TEMP_EMAIL}",
                       password: Devise.friendly_token[0,20],
                      )
  end

  protected

  def set_profile
    self.create_profile
  end

end
