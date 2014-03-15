class User < ActiveRecord::Base
  has_one :profile
  after_create :create_profile
  before_destroy :destroy_profile
  
  devise :database_authenticatable,
            :registerable,
            :recoverable,
            :rememberable,
            :trackable,
            :validatable,
            :omniauthable
  validates :email, :password, presence: true

  def create_profile
    Profile.create(user_id: id)
  end

  def destroy_profile
    profile.destroy if profile.present?
  end
end
