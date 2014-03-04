class RemoveArticles < ActiveRecord::Migration
  def change
    drop_table :articles
    drop_table :admins
  end
end
