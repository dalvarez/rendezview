class Meeting < ActiveRecord::Base
  validates_presence_of :title, :start_date, :end_date
  
  has_one :group
  has_many :comments
  has_many :users, :through => :usermeetings
  
  MEETINGS_LIST = Meeting.find(:all, :order => "title").map{ |l| ["#{l.title} ", l.id] }
  
  def find_schedule(user)
    @schedule = Schedule.find_by_user_id(user) 
  end
  
  def is_updatable_by(user, meeting)
    #user is host?

  end
end
