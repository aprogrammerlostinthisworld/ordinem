class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :can_view_tasks,         :default => false, :null => false
      t.boolean :can_manage_tasks,       :default => false, :null => false
      t.boolean :can_view_collaborators, :default => false, :null => false

     # t.timestamps
    end
  end
end
