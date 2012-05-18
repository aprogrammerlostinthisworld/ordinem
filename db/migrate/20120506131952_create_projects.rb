class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user
      t.string     :name
      t.text       :description
      t.text       :goal
      t.integer    :state,      :default => 0
      t.boolean    :public,     :default => false
      t.date       :date_from
      t.date       :date_to
      
      t.timestamps
    end

  end
end
