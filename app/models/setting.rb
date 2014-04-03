class Setting < ActiveRecord::Base
  after_save :reload

  validates :keyname, :value, presence: true
  validates :keyname, uniqueness: true

  fail_check :validation, :name do
    puts "lol"
  end

  protected

  def reload
    Settings.reload
  end
end
