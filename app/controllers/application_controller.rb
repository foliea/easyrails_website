class ApplicationController < ActionController::Base
  include AdminAuthentication

  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :set_languages_available

  protected

  def set_locale
    # update sessions if passed
    if params[:locale].present? && I18n.available_locales.include?(params[:locale].to_sym)
      session[:locale] = params[:locale]
    end
    # set locale based on sessions
    I18n.locale = session[:locale] ||= I18n.default_locale
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
