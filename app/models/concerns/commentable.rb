module Commentable
  def self.included(base)
    base.class_eval do
      has_many :comments, as: :commentable
    end
  end

  def comments_by_user(id)
    comments.where(user_id: id)
  end
end
