class User < ActiveRecord::Base
  include SuperActive::Validators

  TEMP_EMAIL       = '@temp.com'
  TEMP_EMAIL_REGEX = /.+#{TEMP_EMAIL}$/

  has_one :profile, dependent: :destroy
  before_destroy :destroy?
  after_create :build_profile

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable

  validates :email, presence: true, email: true
  validates :admin, last_stays: true

  def self.from_oauth(provider, uid, email = nil)
    user = find_by(provider: provider, uid: uid)
    user ||= find_by(email: email) if email.present?
    user || create(provider: provider,
                   uid:      uid,
                   email:    email.presence || "#{uid}_#{provider}#{TEMP_EMAIL}",
                   password: Devise.friendly_token[0, 20]
                  )
  end

  def self.oauth_data(auth)
    {
      provider:   auth.provider.presence,
      uid:        auth.uid.presence,
      name:       auth.info.name.presence,
      image:      auth.info.image.presence,
      email:      auth.info.email.presence
    }
  end

  protected

  def build_profile
    Profile.create!(user: self)
  end

  def destroy?
    admin == false || self.class.where(admin: true).count > 1
  end
end
