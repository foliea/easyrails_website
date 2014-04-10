class PageDecorator < SimpleDelegator
  def edit_link
    "/editor/pages/#{self.name}"
  end
end
