class Task < ActiveRecord::Base
  attr_accessible :name, :priority, :description, :status, :duration,
                  :completed_at, :completed_by_id, :updated_at,
                  :tasktable_id, :tasktable_type, :user_id
  after_create  :increment_tasks
  after_destroy :decrement_tasks
  after_update  :update_tasks_counts
  # after_save :notify
  
  validates :name, :presence => true
  validates :tasktable_id, :presence => true
  
  default_scope :order => 'tasks.priority DESC'

  #belongs_to :project
  belongs_to :user
  belongs_to :tasktable, :polymorphic => true
  has_many   :tasks,     :as => :tasktable, :dependent => :destroy
  
  
  def complete?
    true if self.status == 1 
  end
  
  def incomplete?
    true if self.status != 1 
  end
  
  def hold?
    true if self.status == -1
  end
  
  def active?
    true if self.status == 0
  end
  
  def low?
    true if self.priority == 0
  end
  
  def medium?
    true if self.priority == 1
  end
  
  def hight?
    true if self.priority == 2
  end
  
  def increment_tasks
    @project = tasks_project(self)
    @project.update_attribute(:tasks_counter, @project.tasks_counter + 1)
    @project.update_attribute(:tasks_complete_counter, @project.tasks_complete_counter + 1) if self.complete?
  end
  
  def decrement_tasks
    @project = tasks_project(self)
    @project.update_attribute(:tasks_counter, @project.tasks_counter - 1)
    @project.update_attribute(:tasks_complete_counter, @project.tasks_complete_counter - 1) if self.complete?
  end
  
  def update_tasks_counts
    @project = tasks_project(self)
    if self.complete? 
      @project.update_attribute(:tasks_complete_counter, @project.tasks_complete_counter + 1)
    else
      @project.update_attribute(:tasks_complete_counter, @project.tasks_complete_counter - 1)
    end
  end
  

  

  private
  
    def tasks_project(task)
      if task.tasktable_type == "Project"
        return task.tasktable
      else
        return tasks_project(task.tasktable)
      end
    end
    
 # def notify
 #   if assigned_id_changed?
 #     Mailer.delay.reassign(assigned, self)
 #   elsif status_changed?
 #     Mailer.delay.status(assigned, author, self)
 #   end
 # end
    
end
