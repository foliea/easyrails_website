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
    @profile = Profile.new
    if @profile.save
      profile = @profile
    else
      return false
    end
  end
  
  def destroy_profile
    profile.destroy
  end
end
