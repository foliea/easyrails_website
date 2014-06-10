class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_profile, only: [:edit, :update]

  def show
    @profile = Profile.find(params[:id])
  end

  def edit ; end

  def update
    if @profile.update profile_params
      redirect_to @profile, notice: I18n.t('profile.edit.success')
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:avatar,
                                    :name,
                                    :location,
                                    :birthday,
                                    :public_email,
                                    :description,
                                    :image)
  end
end
