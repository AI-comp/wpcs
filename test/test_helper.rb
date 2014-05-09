ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")

# Populate database
puts "Creating a contest with some problems"
FactoryGirl.create(:contest, save_problems: true)
puts "Creating 40 groups"
FactoryGirl.create_list(:group, 40)
puts "Creating 200 contestants attending the first contest and solving some problems"
FactoryGirl.create_list(:contestant, 200, attend_and_solve: true)
