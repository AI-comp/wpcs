ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")

# Populate database
puts "Creating a contest with some problems"
FactoryGirl.create(:contest, save_problems: true)
puts "Creating 40 groups"
FactoryGirl.create_list(:group, 40)
