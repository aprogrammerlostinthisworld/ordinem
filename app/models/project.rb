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
  
  def active?
    true if self.state == 0
  end
end
