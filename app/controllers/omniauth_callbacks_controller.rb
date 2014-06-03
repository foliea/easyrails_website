class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  [:linkedin, :twitter, :github, :facebook, :google_oauth2].each do |method_name|
    define_method(method_name) { authenticate }
  end

  private

  def authenticate
    auth = request.env['omniauth.auth']

    if auth.present?
      user_params = format_to_user_params auth
      user = User.get_from_oauth(user_params[:provider].presence,
                                 user_params[:uid].presence,
                                 user_params[:email].presence)
      if user.present?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: auth.provider
        return sign_in_and_redirect user, event: :authentication
      end
      session['new_user_params'] = user_params
    end
    redirect_to new_user_registration_url
  end

  def format_to_user_params(auth)
    new_user_params = {
      provider:   auth.provider.presence,
      uid:        auth.uid.presence,
      name:       auth.info.name.presence,
      image:      auth.info.image.presence,
      email:      auth.info.email.presence
    }
  end
end
