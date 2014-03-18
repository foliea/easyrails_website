class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :authenticate

  def linkedin
  end

  def twitter
  end

  def github
  end

  def facebook
  end

  def google_oauth2
  end

  private

  def authenticate
    auth = request.env['omniauth.auth']

    if auth.present?
      user_params = format_to_user_params auth
      @user = get_existant_user user_params

      #Sign in if already exist
      if @user
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: auth.provider
        return sign_in_and_redirect @user, event: :authentication
      end
      session['new_user_params'] = user_params
    end
    redirect_to new_user_registration_url
  end

  def get_existant_user user_params
    user = User.where(provider: user_params[:provider], uid: user_params[:uid]).first
    if user.nil?
      if user_params.present?
        user = User.where(email: user_params[:email]).first
      end
    end
  end

  def format_to_user_params auth
    new_user_params = {
                        provider:   auth.provider.presence,
                        uid:        auth.uid.presence,
                        name:       auth.info.name.presence,
                        image:      auth.info.image.presence,
                        email:      auth.info.email.presence
                      }
  end
end
