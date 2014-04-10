class PageDecorator < SimpleDelegator
  def edit_link page_path
    "/editor#{page_path}"
  end
  
  def to_param
    "#{name.parameterize}"
  end
end
