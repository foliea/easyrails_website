module ApplicationHelper
  def title(page_title)
     content_for(:title) { page_title }   
  end
  
  def application_title
    title = 'Adrien Folie Tech Blog'
  end
  
  def languages
    @languages = Language.all
    return @languages
  end
end
