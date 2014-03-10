class CreateProfiles < ActiveRecord::Migration
  def up
    create_table :profiles do |t|
      t.string :name
      t.string :location
      t.date :birthday
      t.string :public_email
      t.text :description
      t.string :image
      
      t.belongs_to :user
      t.timestamps
    end
  end
  
  def down
    drop_table :profiles  
  end
end
