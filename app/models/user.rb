class User < ActiveRecord::Base
  has_one :profile
  before_create :create_profile
  before_destroy :destroy_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
            :registerable,
            :recoverable,
            :rememberable,
            :trackable,
            :validatable,
            :omniauthable
  validates :email, :password, presence: true

  def create_profile
    return true if profile.create
  end
  
  def destroy_profile
    return true if profile.destroy
  end
end
