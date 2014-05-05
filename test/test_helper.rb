ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")

# FIXME: This is dirty because it's copy from lib/tasks/populate.rake
# Populate database
puts "Creating a contest with some problems"
FactoryGirl.create(:contest, save_problems: true)
puts "Creating 10 groups"
FactoryGirl.create_list(:group, 10)
puts "Creating 100 contestants"
FactoryGirl.create_list(:contestant, 100)
puts "Make users attend the contest"
contest = Contest.first
User.all.each do |user|
  user.attend(contest)
end
