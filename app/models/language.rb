class Language < ActiveRecord::Base
  before_destroy :destroy?
  before_save :update_defaults, if: :default
  after_save :change_default_locale, if: :default
  
  validates :name, :code, presence: true
  validates :code, uniqueness: true
  
  scope :defaults, -> { where(default: true) }

  private
  
  def destroy?
    # Only if Language is not configured as default
    if default
      errors.add :default, (I18n.t 'error.language.update')
    end
    return !default
  end
  
  def update_defaults
    Language.update_all(default: false)
  end
  
  def change_default_locale
    I18n.default_locale = code
  end
end
