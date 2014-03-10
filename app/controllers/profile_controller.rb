class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  
  def show
  end
  
  def edit
    @profile = current_user.profile
  end
end
