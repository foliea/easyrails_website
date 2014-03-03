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
    
    binding.pry
    @user = get_existant_user auth
    #Sign in if already exist
    unless @user.nil?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: auth.provider
      return sign_in_and_redirect @user, event: :authentication
    end
    new_user_params = format_to_user_params auth
    redirect_to new_user_registration_url
  end
  
  def get_existant_user auth
    @users = User.all
    
    @user = @users.where(:provider => auth.provider, :uid => auth.uid).first
    if @user.nil?
      unless auth.info.email.nil?
        @user = @users.where(:email => auth.info.email).first
      end
    end
  end
  
  def format_to_user_params auth
    new_user_params = { 
                        :provider =>  auth.provider,
                        :uid =>       auth.uid,
                        :name =>      auth.info.name,
                        :image =>     auth.info.image
                      }
    new_user_params[:email] = auth.info.email unless auth.info.email.nil?
    return new_user_params
  end
end