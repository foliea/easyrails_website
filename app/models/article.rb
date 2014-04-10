class Article < ActiveRecord::Base
  include Commentable

  belongs_to :user

  validates :locale, presence: true
end
