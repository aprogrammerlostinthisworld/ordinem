class Task < ActiveRecord::Base
  attr_accessible :name, :priority, :description, :status,
                  :tasktable_id, :tasktable_type, :user_id
  after_create :increment_tasks
  after_destroy :decrement_tasks
  after_update :update_tasks_counts
  
  
  validates :name, :presence => true
  validates :tasktable_id, :presence => true
  
  belongs_to :user
  belongs_to :tasktable, :polymorphic => true
  has_many   :tasks,     :as => :tasktable, :dependent => :destroy
  
  
  
  #scope :named, lambda {|arg| { if :conditions => ["LOWER(#{table_name}.name) = LOWER(?)", arg.to_s.strip]}}
 
  scope :completed, where(:status => 1)
  scope :incompeted, where(:status != 1) 
  
  scope :complete, where(:status => 1) 
  scope :incomplete, where(:state => 0)

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
end
