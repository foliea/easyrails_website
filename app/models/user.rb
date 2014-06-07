class User < ActiveRecord::Base
  TEMP_EMAIL       = '@temp.com'
  TEMP_EMAIL_REGEX = /.+#{TEMP_EMAIL}$/

  has_one :profile, dependent: :destroy
  before_create :set_profile
  before_destroy :destroy?

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable

  def self.get_from_oauth(provider, uid, email)
    user = find_by(provider: provider, uid: uid)
    user = find_by(email: email) if user.nil? && email.present?

    return user if user.present?
    create(provider: provider,
           uid:      uid,
           email:    "#{uid}_#{provider}#{TEMP_EMAIL}",
           password: Devise.friendly_token[0, 20]
               )
  end

  protected

  def set_profile
    self.profile = Profile.create
  end

  def destroy?
    !admin? || User.count(:admin) > 1
  end

end
