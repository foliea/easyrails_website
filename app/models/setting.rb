class Setting < ActiveRecord::Base
  after_save :reload!
  
  validates :keyname, :value, :presence => true
  validates :keyname, :uniqueness => true
  
  def self.reload!
    AppConfig.reload
    
    ActiveAdmin.setup do |c|
      c.site_title = AppConfig['site_title']
      c.site_title_link = AppConfig['site_title_link']
    end
  end

end