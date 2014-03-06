class Language < ActiveRecord::Base
  before_destroy :destroy?
  before_save :change_default
  
  validate :name, :code, :presence => true
  
  def destroy?
    # Only if Language is not configured as default
    errors[:default] = I18n.t 'error.language.destroy' if default == true
    binding.pry
    return !default
  end
  
  def change_default
    if default == true
      @languages = Language.where.not(id: id)
      
      @languages.each do |language|
        language.default = false
        unless language.save
           errors[:default] = I18n.t 'error.language.update'
        end
      end
      I18n.default_locale = code
    end
  end
end
