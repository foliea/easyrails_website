class PagesController < ApplicationController
  before_action :authenticate_admin!, only: :update
  before_action :set_page

  def show
  end

  def update
    @page.content = params[:content][:page_content][:value]
    @page.save!
    render text: ''
  end

  def set_page
    @page = Page.get_page(name: params[:id], locale: I18n.locale)
  end
end
