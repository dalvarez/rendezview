class Usergroup < ActiveRecord::Base
  belongs_to :group
  has_one :user
end
