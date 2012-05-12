class Project < ActiveRecord::Base
  attr_accessible :name, :description, :goal, :state,
                  :date_from, :date_to
    
  validates :name, :presence => true
  
  belongs_to :user
  has_many :tasks,  :as => :tasktable, :dependent => :destroy
  has_many :members
  has_many :peoples, :through => :members

  #belongs_to :author, :class_name => 'User'
  default_scope :order => 'projects.created_at DESC'

  def membs
    peoples.all << user
  end
  
  def active?
    true if self.state == 0
  end
end
