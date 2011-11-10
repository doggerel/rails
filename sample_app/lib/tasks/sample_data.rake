namespace :db do
  desc "Fill database with sample data"
    task :populate => :environment do
      Rake::Task['db:reset'].invoke
      make_users
      make_microposts
      make_relationships
    end
end

    def make_users
        admin = User.create!(:name => "Example User",
                     :email => 
                      "gritty@sympatico.ca",
                     :password => "foobar",
                     :password_confirmation => "foobar",
                     :handle => "grit",
                     :aasm_state => "confirmed"
                    )
          admin.toggle!(:admin)            
                
      99.times do |n|
        name = Faker::Name.name
        email = "example-#{n+1}@railstutorial.org"
        password = "password"
        handle = "grit-#{n+1}"
        User.create!(:name =>name,
                     :email => email, 
                     :password =>password, 
                     :password_confirmation =>password,
                     :handle  => handle
        )
      end
    end
    def make_microposts
      User.all(:limit => 50).each do |user|
        99.times do |n| 
         content = Faker::Lorem.sentence(5)
        user.microposts.create!(:content=>content)
       end
      end
    end

    def make_relationships
      users = User.all
      user = users.first
      following = users[1..50]
      followers =  users[3..40]
      following.each {|followed| user.follow!(followed)}
      followers.each{|follower| follower.follow!(user)}
    end
   
