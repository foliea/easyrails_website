class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :check_ownership!

  def add_email
    if params[:user] && params[:user][:email]
      current_user.email = params[:user][:email]

      if current_user.valid? || current_user.errors[:email].blank?
        current_user.update_columns(email: params[:user][:email])
        return redirect_to root_url, notice: I18n.t('account.email.success')
      end
    end
    render 'users/registrations/email'
  end

  private

  def set_user
    @user = User.find params[:id]
  end

end
