class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :keyname,       null: false, limit: 64
      t.text :value,         null: false
      t.string :value_format,  limit: 64,   default: 'string'
      t.string :name,          limit: 64
      t.string :description,   limit: 512
      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
