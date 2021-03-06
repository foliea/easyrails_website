class PagesController < ApplicationController
  before_action :authenticate_admin!, only: :update
  before_action :set_page

  def show ; end

  def update
    @page.content = params[:content][:page_content][:value]
    @page.save!
    render json: {}
  end

  private

  def set_page
    @page = Page.from_name!(params[:name])
  end
end
