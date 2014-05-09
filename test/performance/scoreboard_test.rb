require 'test_helper'
require 'rails/performance_test_help'
require 'rake'
require 'populate_helper'

class SubmissionTest < ActionDispatch::PerformanceTest
  include PopulateHelper

  # Refer to the documentation for all available options
  # self.profile_options = { :runs => 5, :metrics => [:wall_time, :memory]
  #                          :output => 'tmp/performance', :formats => [:flat] }

  def setup
    get '/'
    # Register and login
    post_via_redirect '/users', user: { uid: 'alice' }, password: 'pass'
    u = User.last
    Group.last.users.push(u)
    attend = u.attend(Contest.last)
    solve_problems(attend, Contest.last.problems.to_a)
  end

  def test_show_scoreboard
    get '/contests/1/score'
  end

  def test_index_problems
    get '/contests/1/problems'
  end

  def test_show_problem
    get '/contests/1/problems/1'
  end
end
