class Group < ActiveRecord::Base
  has_many :users, :through => :usergroups
  has_many :meetings

  GROUPS_LIST = Group.find(:all, :order => "name").map {|g| ["#{g.name}", g.id]}
end
