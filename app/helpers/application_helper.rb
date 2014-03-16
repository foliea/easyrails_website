module ApplicationHelper
  def title(page_title)
     content_for(:title) { page_title }
  end

  def description(description)
     content_for(:description) { description }
  end

  def site_owner
    return AppConfig['site_owner']
  end

  def site_title
    return AppConfig['site_title']
  end

  def site_title_link
    return AppConfig['site_title_link']
  end

  def site_description
    return AppConfig['site_description']
  end
end
