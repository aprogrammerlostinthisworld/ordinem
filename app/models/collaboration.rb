class Collaboration < ActiveRecord::Base
  attr_accessible :can_manage_tasks
  
  # belongs_to :user #original
  belongs_to :member, :class_name => 'User'
  
  belongs_to :project #original
  
  
end
