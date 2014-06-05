module Authentication
  def self.included(base)
    base.class_eval do
      before_action :ensure_valid_email
    end
  end

  protected

  def authenticate_admin!
    authenticate_user!

    return if current_user.admin?

    unauthorized!
  end

  def check_ownership!
    unauthorized! if @user != current_user
  end

  def unauthorized
    flash[:alert] = I18n.t('account.unauthorized')
    redirect_to root_path
  end

  def ensure_valid_email
    return if action_name == 'add_email'
    return unless current_user && User::TEMP_EMAIL_REGEX.match(current_user.email)

    redirect_to add_user_email_path(current_user)
  end

  def devise_parameter_sanitizer
    if resource_class == User
      UserParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end
end
