class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected 
  
  def check_admin
    unless current_user.try(:admin?)
      redirect_to root_url, alert: 'You need to sign in as administrator first.'
    end
  end
end
