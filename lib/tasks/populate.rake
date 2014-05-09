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

  desc "Populate the database with mock data"
  task :mock => :environment do |t|
    puts "Creating a contest with some problems"
    FactoryGirl.create(:contest, save_problems: true)
    puts "Creating 10 groups"
    FactoryGirl.create_list(:group, 10)
    puts "Creating 100 contestants attending the first contest and solving some problems"
    FactoryGirl.create_list(:contestant, 100, attend_and_solve: true)
    puts "Creating a user with name 'alice' and password 'pass'"
    user = User.new_with_password({ uid: 'alice' }, 'pass')
    user.save
    Group.first.users.push(user)
    attend = user.attend(Contest.last)
    solve_problems(attend, Contest.last.problems.to_a)
  end

end
