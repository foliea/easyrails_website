class Language < ActiveRecord::Base
  before_destroy :destroy?
  before_save :change_default
  
  validates :name, :code, :presence => true
  validates :code, :uniqueness => true
  
  scope :default, -> { where(default: true).first }
  
  private
  
  def destroy?
    # Only if Language is not configured as default
    if default == true
      errors[:default] = I18n.t 'error.language.update'
    end
    return !default
  end
  
  def change_default
    if default == true
      @languages = Language.where.not(id: id)
      
      @languages.each do |language|
        language.default = false
        unless language.save
          errors[:default] = I18n.t 'error.language.update'
          return false
        end
      end
      I18n.default_locale = code
    end
  end
end
