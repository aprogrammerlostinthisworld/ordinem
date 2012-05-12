class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :home_address, 
                  :home_number, :mobile_number, :fax_number, :office_number,
                  :locale, :is_admin
                  
  has_many :projects, :dependent => :destroy
  # has_many :collaborations
  
  def all_projects
    collaborations.map(&:project) | Project.where(:user_id => id)
  end
  

 
  def display_name
    if self.first_name? and self.last_name? then
      "#{self.first_name} #{self.last_name}"
    else
      self.email 
    end
  end
  
  
  def update_with_password(params={})
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end 

    # result = if valid_password?(current_password)
    result = if params[:password].blank? || valid_password?(current_password)
      update_attributes(params)
    else
      self.attributes = params
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end 

    clean_up_passwords
    result
  end


end
