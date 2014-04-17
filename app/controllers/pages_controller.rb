class PagesController < ApplicationController
  before_action :authenticate_admin!, only: :update
  before_action :get_page
  
  def show ; end

  def update
    @page.content = params[:content][:page_content][:value]
    @page.save!
    render json: {}
  end

  private

  def get_page
    @page = Page.get_by_name!(params[:name])
  end
end
