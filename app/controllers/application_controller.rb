class ApplicationController < ActionController::Base
  include Authentication

  protect_from_forgery with: :exception

  before_action :set_locale
  before_cation :set_available_locales
  before_action :set_available_languages

  protected

  def set_locale
    # update sessions if passed
    if params[:locale].present? && @available_locales
      session[:locale] = params[:locale]
    end
    # set locale based on sessions
    I18n.locale = session[:locale] ||= I18n.default_locale
  end

  def set_available_locales
    @available_locales ||= Language.available_locales
  end

  def set_available_languages
    @available_languages ||= Language.all
  end
end
