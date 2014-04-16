class PagesController < ApplicationController
  before_action :authenticate_admin!, only: :update

  def show
    @page_decorator = PageDecorator.new(get_page, view_context)
    #@page = get_page
  end

  def update
    @page = get_page
    binding.pry
    @page.content = params[:content][:page_content][:value]
    @page.save!
    render json: {}
  end

  private

  def get_page
    Page.get_by_name!(params[:name])
  end
end
