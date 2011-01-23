class CreateMeetings < ActiveRecord::Migration
  def self.up
    create_table :meetings do |t|
      t.integer :group_id
      t.string :title
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.date :actual_date
      t.time :actual_time
      t.integer :duration
      t.string :location
      t.string :agenda
      t.string :attendees
      

      t.timestamps
    end
  end

  def self.down
    drop_table :meetings
  end
end
