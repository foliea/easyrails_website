module ApplicationHelper
  def title(title)
     content_for(:title, title)
  end

  def description(description)
     content_for(:description, description)
  end

  def settings(key)
    AppConfig[key]
  end

  def decorate decorator, instance, &block
    capture do
      block.call decorator.new(instance, self)
    end
  end
  
  def include_specifics_javascripts
    case controller.controller_name 
    when 'pages'
      javascript_include_tag 'page'
    end
  end
end
