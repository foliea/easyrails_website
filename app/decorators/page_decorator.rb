class PageDecorator < SimpleDelegator
  def edit_link page_path
    "/editor#{page_path}"
  end
  
  def to_param
    "#{name.parameterize}"
  end
  
  def data page_url
    {
      disqus_shortname: AppConfig['disqus_shortname'],
      disqus_url: page_url,
      disqus_identifier: self.to_param
    }
  end
end
