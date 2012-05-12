class AddTasksCountToProject < ActiveRecord::Migration
  def change
    add_column :projects, :tasks_counter, :integer, :default => 0, :null => false
    add_column :projects, :tasks_complete_counter, :integer, :default => 0, :null => false
  end
end
