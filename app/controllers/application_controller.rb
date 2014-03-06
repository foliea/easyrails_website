class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_locale
  
  protected
  
  def set_locale
    # update sessions if passed
    session[:locale] = params[:locale] if params[:locale]
    
    # set locale based on sessions or default
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def authenticate_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = I18n.t 'account.unauthorized'
      redirect_to root_path
    end
  end
  
  def devise_parameter_sanitizer
    if resource_class == User
      UserParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end
  
end
