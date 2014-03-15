class ProfileController < ApplicationController
  before_action :set_profile
  before_action :own_profile?, only: [:edit, :update]

  def show
  end

  def edit
  end

  def update
    if @profile.update_attributes profile_params
      redirect_to @profile, notice: I18n.t('profile.edit.success')
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find params[:id]
  end

  def own_profile?
    owned = @profile == current_user.profile
    unauthorized if !owned
  end

  def profile_params
    params.require(:profile).permit(:name, :location, :birthday, :public_email, :description, :image)
  end
end
