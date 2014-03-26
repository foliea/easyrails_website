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

  def set_profile
    self.create_profile
  end
end
