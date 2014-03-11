class Setting < ActiveRecord::Base
  after_save :reload
  
  validates :keyname, :value, presence: true
  validates :keyname, uniqueness: true
  
  def reload
    Settings.reload
  end
end