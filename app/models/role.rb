class Role < ActiveRecord::Base
  attr_accessible :name, :can_view_tasks, :can_manage_tasks, :can_view_collaborators
  has_many :collaborations
end
