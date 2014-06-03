class Language < ActiveRecord::Base
  after_save :set_default_locale, if: :default
  after_save :set_available_locales
  after_destroy :set_available_locales

  validates :name, :locale, presence: true
  validates :locale, uniqueness: true

  has_default

  def self.available_locales
    pluck(:locale)
  end

  protected

  def set_default_locale
    I18n.default_locale = locale
  end

  def set_available_locales
    I18n.available_locales = self.class.available_locales
  end
end
