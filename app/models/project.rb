class Project < ActiveRecord::Base
  attr_accessible :name, :description, :goal, :state,
                  :date_from, :date_to
    
  validates :name, :presence => true
  
  belongs_to :user 
  
  has_many :tasks,  :as => :tasktable, :dependent => :destroy
  has_many :collaborations
  has_many :members, :through => :collaborations
  
  # belongs_to :owner, :class_name => 'User'

  
  default_scope :order => 'projects.created_at DESC'

  def collaborators
    members.all << user
  end
  
# def permissions_for(user)
#		# false if self.collaborations.where(:can_manage_task => true, :user_id => user.id)
#    # return Collaboration.select(:can_manage_tasks).where("project_id = #{self.id} AND member_id = #{user.id}")
#    (Collaboration.first(:conditions => ['member_id = ? AND project_id = ?', user.id, self.id]) || false)
#	end
 
  def permissions_for(user)
   # Collaboration.first(:conditions => ['member_id = ? AND project_id = ?', user.id, self.id])
    
 #  Project.find(:all,
 #     :joins => "INNER JOIN 'collaborations' ON 'projects'.'id' = 'collaborations'.'project_id'",
 #     :conditions => " 'collaborations'.'member_id' = #{current_user.id} ") 
    return Role.find_by_name('Manager') if self.user_id == user.id 
    (Role.find(:first,
      :joins => "INNER JOIN `collaborations` ON `roles`.`id` = `collaborations`.`role_id`",
      :conditions => "`collaborations`.`member_id` = #{user.id} AND `collaborations`.`project_id` = #{self.id}") || false)
    
  end
  
  def active?
    true if self.state == 0
  end
end
