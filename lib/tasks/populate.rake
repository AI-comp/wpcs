namespace :populate do

  desc "Populate the database with some sample groups"
  task :group, [:count] => :environment do |t, args|
    args.with_defaults(:count => 10)
    puts "Creating #{args[:count]} groups"
    FactoryGirl.create_list(:group, args[:count].to_i)
    puts "Done!"
  end

  desc "Populate the database with some sample users"
  task :user, [:count] => :environment do |t, args|
    args.with_defaults(:count => 10)
    puts "Creating #{args[:count]} users"
    new_users = FactoryGirl.create_list(:user, args[:count].to_i)
    puts "Assigning random groups for each user"
    new_users.each do |u|
      Group.all.to_a.sample.users.push(u)
    end
    puts "Done!"
  end

end
