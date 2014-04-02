module ApplicationHelper
  def title(title)
     content_for(:title, title)
  end

  def description(description)
     content_for(:description, description)
  end
  
  def setting(key)
    AppConfig[key]
  end
end
