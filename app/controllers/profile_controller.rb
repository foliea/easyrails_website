class ProfileController < ApplicationController
  before_action :find_profile
  before_action :own_profile?, only: [:edit, :update]

  def show
    binding.pry
  end

  def edit
  end

  def update
    binding.pry
    if @profile.update_attributes params[:profile]
      redirect_to show_profile_path, id: profile.id
    else
      render :action => :edit
    end
  end

  private

  def find_profile
    @profile = Profile.find params[:id]
  end

  def own_profile?
    owned = @profile == current_user.profile
    unauthorized if !owned
  end
end
