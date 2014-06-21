class User < ActiveRecord::Base
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
  validate :last_admin_stays_admin

  def self.get_from_oauth(provider, uid, email)
    user = find_by(provider: provider, uid: uid)
    user = find_by(email: email) if user.nil? && email.present?

    return user if user.present?
    create(provider: provider,
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

  def last_admin?
    admin_was == true &&
    self.class.where(admin: true).count <= 1
  end

  protected

  def build_profile
    Profile.create!(user: self)
  end

  def last_admin_stays_admin
    if admin == false && last_admin?
      errors[:admin] << I18n.t('error.validation.last_admin')
    end
  end

  def destroy?
    !last_admin?
  end
end
