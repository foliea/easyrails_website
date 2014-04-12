class AddCommentsToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :commentable, :boolean
  end

  def self.down
    remove_column :pages, :commentable
  end
end
