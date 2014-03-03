class AddUserToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |a|
      a.references :user, index: true
    end
  end
  
  def self.down
    change_table :articles do |a|
      a.remove :user_id
    end
  end
end
