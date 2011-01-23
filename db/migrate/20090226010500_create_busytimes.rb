class CreateBusytimes < ActiveRecord::Migration
  def self.up
    create_table :busytimes do |t|
      
      t.integer :schedule_id
      t.time :start_time
      t.time :end_time
      t.boolean  :m8am
      t.date :date
      
      t.timestamps
    end
  end

  def self.down
    drop_table :busytimes
  end
end
