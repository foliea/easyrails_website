class RenameMercuryImages < ActiveRecord::Migration
  def self.up
    rename_table :mercury_images, :images
  end
  def self.down
    rename_table :images, :mercury_images
  end
end
