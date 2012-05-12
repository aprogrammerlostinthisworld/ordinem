class Page < ActiveRecord::Base
  attr_accessible :content, :locale, :name, :published, :title
  default_scope where(:published => true)
end
