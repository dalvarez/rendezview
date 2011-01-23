class CreateUsermeetings < ActiveRecord::Migration
  def self.up
    create_table :usermeetings do |t|
      t.integer :user_id
      t.integer :meeting_id
      t.boolean :is_host, :default => false
      t.boolean :is_attending, :default => false
      t.boolean :is_executive, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :usermeetings
  end
end
