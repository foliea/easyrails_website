class PagesController < ApplicationController
  before_action :authenticate_admin!, only: :update

  def show
    @page_decorator = PageDecorator.new(get_page)
  end

  def update
    @page = get_page
    @page.content = params[:content][:page_content][:value]
    @page.save!
    render json: {}
  end

  private

  def get_page
    p ||= Page.get_page_with_locale(params[:name], I18n.locale)
    p ||= Page.get_page_with_locale(params[:name], I18n.default_locale)
    p ||= Page.get_page!(params[:name])
    p
  end
end
