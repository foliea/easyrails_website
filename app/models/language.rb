class Language < ActiveRecord::Base
  after_save :set_default_locale, if: :default

  validates :name, :locale, presence: true
  validates :locale, uniqueness: true

  has_default

  protected

  def set_default_locale
    I18n.default_locale = locale
  end
end
