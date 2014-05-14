module Authentication

  protected

  def authenticate_admin!
    authenticate_user!
    unless current_user.admin?
      unauthorized
    end
  end

  def check_ownership!
    if @user != current_user
      unauthorized   
    end
  end

  def unauthorized
    flash[:alert] = I18n.t('account.unauthorized')
    redirect_to root_path
  end
end
