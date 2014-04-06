class CreateSilentFailLog < ActiveRecord::Migration
  def self.up
    create_table :silent_fail_logs do |t|
      t.string :message
      t.timestamps
    end
  end

  def self.down
    drop_table :silent_fail_logs
  end
end
