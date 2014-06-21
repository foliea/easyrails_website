class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  Devise.omniauth_providers.each do |provider|
    define_method(provider) { authenticate }
  end

  private

  def authenticate
    auth = request.env['omniauth.auth']

    if auth.present?
      user_params = User.oauth_data auth
      user = User.from_oauth(user_params[:provider].presence,
                             user_params[:uid].presence,
                             user_params[:email].presence)
      if user.present?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: auth.provider
        return sign_in_and_redirect user, event: :authentication
      end
    end
    redirect_to new_user_registration_url
  end
end
