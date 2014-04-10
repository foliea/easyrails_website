class ApplicationController < ActionController::Base
  include AdminAuthentication
  
  protect_from_forgery with: :exception

  before_action :set_default_locale
  before_action :set_locale
  before_action :set_languages_available

  protected

  def set_default_locale
    @default_language ||= Language.get_default
    I18n.default_locale = @default_language.locale if (@default_language) || :en
  end

  def set_locale
    # update sessions if passed
    session[:locale] = params[:locale] if params[:locale].present?
    # set locale based on sessions or default
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def set_languages_available
    @languages_available ||= Language.all
  end

  def devise_parameter_sanitizer
    if resource_class == User
      UserParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end

end
