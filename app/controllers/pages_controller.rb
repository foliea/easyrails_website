class PagesController < ApplicationController
  before_action :authenticate_admin!, only: :update

  def show
    @page_decorator = PageDecorator.new(get_page)
  end

  def update
    @page = get_page
    @page.content = params[:content][:page_content][:value]
    @page.save!
    render text: I18n.t('page.edit.saved')
  end

  private

  def get_page
    Page.get_page(name: params[:id], locale: I18n.locale)
  end
end
