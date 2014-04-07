class UserComment
  def initialize(user)
    @user = user
  end

  def create item, message
    comment = @user.comments.new(commentable: item, message: message)
    comment.save
    comment
  end
end
