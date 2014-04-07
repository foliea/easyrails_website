class Setting < ActiveRecord::Base
  after_save :reload

  validates :keyname, :value, presence: true
  validates :keyname, uniqueness: true

  #silent_fail_check :validation, :keyname, :value

  protected

  def reload
    Settings.reload
  end
end
