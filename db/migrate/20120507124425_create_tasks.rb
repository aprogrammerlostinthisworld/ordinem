class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user
      t.string     :name
      t.text       :description
      t.integer    :priority
      t.integer    :status,    :default => 0 # [0-active, -1-hold, 1-complete]
      t.datetime   :date_start
      t.datetime   :date_due

      
      t.integer    :updated_by_id
      t.datetime   :completed_at
      t.integer    :completed_by_id
      
      t.integer    :tasktable_id,     :null => false
      t.string     :tasktable_type,   :null => false
      t.timestamps
    end
    add_index :tasks, [:tasktable_id, :tasktable_type]
  end
end
