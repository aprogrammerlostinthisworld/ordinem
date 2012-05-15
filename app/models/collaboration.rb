class Collaboration < ActiveRecord::Base
  attr_accessible :create_at, :project_id, :role_id, :member_id

  
  # belongs_to :user #original
  belongs_to :member, :class_name => 'User'
  
  belongs_to :project #original
  belongs_to :role
  
  delegate :email, :to => :member, :allow_nil => true
  
#  def manage_tasks?
#    self.can_manage_tasks?
#  end
  
end
