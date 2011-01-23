class Usermeeting < ActiveRecord::Base
  has_one :user
  belongs_to :meeting
end
