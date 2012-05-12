namespace :db do
  desc "Fill database with sample data"
  task :make_data => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_projects
    # make_tasks
    end
end

def make_users
  puts '*** Make users ***'
  
  admin = User.create!(:first_name => "Bohdan",
                       :last_name => "Shevchuk",
                       :email => "bohdan.shevchuk@facebook.com",
                       :password => "123456",
                       :password_confirmation => "123456")
  admin.toggle!(:admin)
  
  40.times do |n|
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = "u#{n+1}@email.com"
    password = "123456"
    User.create!(:first_name => first_name,
                 :last_name => last_name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end

def make_projects
  puts '*** Make projects ***'
  
  User.all(:limit => 5).each do |user|
    10.times do
      user.projects.create!(:name => Faker::Lorem.sentence(5),
                            :description => Faker::Lorem.sentence(5),
                            :goal => Faker::Lorem.sentence(5))
    end
  end
end

def make_tasks 
  10.times do 
    (1..80).each do |n|
      Task.create!(:task_list_id => n, :name => Faker::Lorem.sentence(5),
                   :description => Faker::Lorem.sentence(5))
    end
  end
end


