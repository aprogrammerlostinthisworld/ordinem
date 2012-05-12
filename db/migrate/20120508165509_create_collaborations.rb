class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.references  :project
      t.references  :member             
  
      t.boolean     :can_manage_tasks,      :default => false
    
      t.timestamps
    end
  end
end
