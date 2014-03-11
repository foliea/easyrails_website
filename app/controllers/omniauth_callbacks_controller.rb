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
      @user = get_existant_user auth
      #Sign in if already exist
      if @user.present?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: auth.provider
        return sign_in_and_redirect @user, event: :authentication
      end
      session['new_user_params'] = format_to_user_params auth
    end
    redirect_to new_user_registration_url
  end
  
  def get_existant_user auth
    @user = User.where(provider: auth.provider, uid: auth.uid).first
    if @user.nil?
      if auth.info.email.present?
        @user = User.where(email: auth.info.email).first
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