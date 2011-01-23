class Schedule < ActiveRecord::Base
  has_many :busytimes
  belongs_to :user

  validates_uniqueness_of :time_string, :scope => :user_id

#A constructor function needs to be defined here
  @time_string = []
  224.times do
    @time_string << "0"
  end

end
