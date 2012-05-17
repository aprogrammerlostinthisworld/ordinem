source 'https://rubygems.org'
#ruby "1.9.3"

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


gem 'cancan'
gem 'simple_form'
gem 'devise'
gem 'devise_invitable'
#gem 'rails_admin'
gem 'rails_admin'#, :git => 'git://github.com/sferik/rails_admin.git'

gem 'rails-i18n'
gem 'haml-rails'
gem 'jquery-rails'
gem 'heroku'


gem 'RedCloth'
gem 'redcarpet'
gem 'albino'
gem 'nokogiri'
#gem 'rails_markitup'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'

  gem 'twitter-bootstrap-rails'
#  gem 'less-rails-bootstrap'

end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
group :production do
  gem 'pg'
  gem 'thin'
end

group :development do
  gem 'sqlite3-ruby', :require => "sqlite3"
  gem 'hpricot'
  gem 'ruby_parser'
#  gem 'annotate'
  gem 'faker'
end

group :test do
  gem 'turn', '0.8.2', :require => false
  gem 'factory_girl_rails', '~> 1.2'
  gem 'cucumber', '1.1.4'
  gem 'cucumber-rails', '1.2.1'
  gem 'capybara', '1.1.2'
  gem 'database_cleaner'
  gem 'rspec-rails'
end
