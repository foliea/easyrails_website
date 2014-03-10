class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :location
      t.date :birthday
      t.string :public_email
      t.text :description
      t.string :image
      
      t.belongs_to :customer
      t.timestamps
    end
  end
end
