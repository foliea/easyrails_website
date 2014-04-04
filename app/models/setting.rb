require 'silent_fail_check'

class Setting < ActiveRecord::Base
  after_save :reload

  validates :keyname, :value, presence: true
  validates :keyname, uniqueness: true

  silent_fail_check :validation, :keyname, :value do
    puts 'test'
  end

  protected

  def reload
    Settings.reload
  end
end
