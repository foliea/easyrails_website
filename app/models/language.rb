class Language < ActiveRecord::Base
  after_save :set_default_locale, if: :default
  
  validates :name, :code, presence: true
  validates :code, uniqueness: true
  
  has_default
  
  private
  
  def set_default_locale
    I18n.default_locale = code
  end
end