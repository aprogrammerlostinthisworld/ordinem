class Member < ActiveRecord::Base
  attr_accessible :can_manage_tasks
  
  belongs_to :people,  :class_name => 'User'
  belongs_to :project
  
  
end
