class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name,         :litim => 100
      t.string :title
      t.text :content
      t.string :locale,       :limit => 5,    :null => false, :default => "en"
      t.boolean :published,   :default => false, :null => false
    end
  end
end
