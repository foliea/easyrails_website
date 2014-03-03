class Article < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'user_id'
  
  validates :user, 
            :title,
            :presence => true   
end
