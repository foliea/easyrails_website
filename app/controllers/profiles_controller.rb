class ProfilesController < ApplicationController
  before_action :get_profile
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :check_ownership, only: [:edit, :update]

  def show
  end

  def edit
  end

  def update
    @profile.picture_from_url(get_avatar_from_session) if get_avatar_from_session
    if @profile.update profile_params
      session.delete 'new_user_params'
      redirect_to @profile, notice: I18n.t('profile.edit.success')
    else
      render :edit
    end
  end

  private

  def get_profile
    @profile = Profile.find params[:id]
  end

  def get_avatar_from_session
    (session['new_user_params'][:image] if session['new_user_params']) || nil
  end

  def check_ownership
    if @profile != current_user.profile
      redirect_to @profile, alert: I18n.t('account.unauthorized')
    end
  end

  def profile_params
    params.require(:profile).permit(:avatar, :name, :location, :birthday, :public_email, :description, :image)
  end
end