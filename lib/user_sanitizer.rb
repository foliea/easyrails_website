class UserParameterSanitizer < Devise::ParameterSanitizer
    private
    def account_update
      default_params.permit(:email, :password, :password_confirmation, :current_password)
    end
end