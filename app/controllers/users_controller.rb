class UsersController < ApplicationController
  before_action :authenticate_user!

  def add_email
    return unless params[:user]

    current_user.email = params[:user][:email].presence

    if current_user.valid? || current_user.errors[:email].blank?
      current_user.update_columns(email: params[:user][:email])
      return redirect_to root_url, notice: I18n.t('account.email.success')
    end
    @show_error = true
  end
end
