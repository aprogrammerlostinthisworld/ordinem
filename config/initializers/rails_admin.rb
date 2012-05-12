# RailsAdmin config file. Generated on May 09, 2012 21:57
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|
 
  
  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.current_user_method { current_user } # auto-generated

  config.authorize_with :cancan
  
  # If you want to track changes on your models:
  # config.audit_with :history, User

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Ordinem', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [ImType, ImValue, Member, Page, Project, Task, User]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [ImType, ImValue, Member, Page, Project, Task, User]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model ImType do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer 
  #     configure :name, :string 
  #     configure :description, :text 
  #     configure :goal, :text 
  #     configure :state, :integer 
  #     configure :public, :boolean 
  #     configure :date_from, :date 
  #     configure :date_to, :date   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model ImValue do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :im_type, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :im_type_id, :integer         # Hidden 
  #     configure :value, :string 
  #     configure :is_default, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Member do
  #   # Found associations:
  #     configure :project, :belongs_to_association 
  #     configure :user, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :project_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :can_manage_tasks, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Page do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :title, :string 
  #     configure :content, :text 
  #     configure :locale, :string 
  #     configure :published, :boolean   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Project do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :tasks, :has_many_association 
  #     configure :members, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :name, :string 
  #     configure :description, :text 
  #     configure :goal, :text 
  #     configure :state, :integer 
  #     configure :public, :boolean 
  #     configure :date_from, :date 
  #     configure :date_to, :date 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :tasks_counter, :integer 
  #     configure :tasks_complete_counter, :integer   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Task do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :tasktable, :polymorphic_association 
  #     configure :tasks, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :name, :string 
  #     configure :description, :text 
  #     configure :priority, :integer 
  #     configure :status, :integer 
  #     configure :date_start, :datetime 
  #     configure :date_due, :datetime 
  #     configure :updated_by_id, :integer 
  #     configure :completed_on, :datetime 
  #     configure :completed_by_id, :integer 
  #     configure :tasktable_id, :integer         # Hidden 
  #     configure :tasktable_type, :string         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model User do
  #   # Found associations:
  #     configure :projects, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :first_name, :string 
  #     configure :last_name, :string 
  #     configure :home_address, :string 
  #     configure :home_number, :string 
  #     configure :office_number, :string 
  #     configure :fax_number, :string 
  #     configure :mobile_number, :string 
  #     configure :time_zone, :string 
  #     configure :locale, :string 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :password_salt, :string         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :confirmation_token, :string 
  #     configure :confirmed_at, :datetime 
  #     configure :confirmation_sent_at, :datetime 
  #     configure :unconfirmed_email, :string 
  #     configure :failed_attempts, :integer 
  #     configure :unlock_token, :string 
  #     configure :locked_at, :datetime 
  #     configure :authentication_token, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
