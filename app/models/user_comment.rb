class UserComment < SimpleDelegator
  def create item, message
    comment = self.comments.new(commentable: item, message: message)
    comment.save
    comment
  end
end
