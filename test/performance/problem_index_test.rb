require 'test_helper'
require 'rails/performance_test_help'
require 'rake'
require 'populate_helper'

puts "Creating 200 contestants attending the first contest and solving some problems"
FactoryGirl.create_list(:contestant, 200, attend_and_solve: true)

class ProblemIndexTest < ActionDispatch::PerformanceTest
  include PopulateHelper

  def setup
    get '/'
    post_via_redirect '/users', user: { uid: 'alice_problem_list' }, password: 'pass'
    user = User.last
    Group.first.users.push(user)
    attend = user.attend(Contest.first)
    solve_problems(attend, Contest.first.problems.to_a)
  end

  def test_show_problem_index_100_times
    100.times do
      get '/contests/1/problems'
    end
  end

end
