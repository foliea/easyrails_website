class PageDecorator < BaseDecorator
  def edit_link
    "/editor#{h.page_path(self)}"
  end

  def to_param
    "#{name.parameterize}"
  end

  def content
    h.raw super
  end
  
  def mercury_data
    { mercury: 'full' }
  end

  def disqus_data
    {
      disqus_shortname: h.setting('disqus_shortname'),
      disqus_url: h.page_url(self),
      disqus_identifier: self.to_param
    }
  end
end
