class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references  :project
      t.references  :user              
  
      t.boolean     :can_manage_tasks,      :default => false
    
      t.timestamps
    end
  end
end