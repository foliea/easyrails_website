class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  after_create :create_profile
  
  devise :database_authenticatable,
            :registerable,
            :recoverable,
            :rememberable,
            :trackable,
            :validatable,
            :omniauthable
  validates :email, :password, presence: true

  def create_profile
    self.create_profile
  end
end
