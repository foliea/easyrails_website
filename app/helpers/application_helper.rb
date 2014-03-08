module ApplicationHelper
  def title(page_title)
     content_for(:title) { page_title }   
  end
  
  def application_title
    title = AppConfig['site_title']
  end
  
  def languages_available
    @languages = Language.all
    return @languages
  end
end
