class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      
      t.integer :user_id
      t.string :time_string
      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
