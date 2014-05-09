ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")

# Populate database
puts "Creating a contest with some problems"
FactoryGirl.create(:contest, save_problems: true)
puts "Creating 40 groups"
FactoryGirl.create_list(:group, 40)
puts "Creating 200 contestants"
FactoryGirl.create_list(:contestant, 200)
puts "Make users attend the contest"
puts "Solve some problems"
contest = Contest.first
problems = contest.problems.to_a
User.all.each do |user|
  attend = user.attend(contest)
  pcount = (1...problems.count).to_a.sample
  problems.shuffle!
  # Submit some wrong answers
  problems.take(pcount).each do |p|
    Problem.types.each do |type|
      (0...2).to_a.sample.times do 
        attend.submit(p, 'dummy', type)
      end
    end
  end
  # Submit some correct answers
  problems.take(pcount).each do |p|
    tcount = (1...Problem.types.count).to_a.sample
    Problem.types.take(tcount).each do |type|
      ans = p.output(type)
      attend.submit(p, ans, type)
    end
  end
end
