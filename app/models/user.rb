class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :firstname, :lastname, :home_address, 
                  :home_phone, :mobile_phone,
                  :skype, :icq, 
                  :locale
                  
                  
  # validates :current_password, :presence => TRUE, :if => :email_changed?
  
  has_many :projects, :dependent => :destroy
  
  
  
  
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
