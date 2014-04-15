class PageDecorator < BaseDecorator
  def edit_link
    "/editor#{h.page_path(self)}"
  end
  
  def to_param
    "#{name.parameterize}"
  end
  
  def data
    {
      disqus_shortname: AppConfig['disqus_shortname'],
      disqus_url: h.page_url(self),
      disqus_identifier: self.to_param
    }
  end
end
