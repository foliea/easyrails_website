class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  before_create :add_profile

  devise :database_authenticatable,
            :registerable,
            :recoverable,
            :rememberable,
            :trackable,
            :validatable,
            :omniauthable
  validates :email, :password, presence: true

  def add_profile
    self.create_profile
  end
end
