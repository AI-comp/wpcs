require 'test_helper'
require 'rails/performance_test_help'
require 'rake'
require 'populate_helper'

class RenderingTest < ActionDispatch::PerformanceTest
  include PopulateHelper

  # Refer to the documentation for all available options
  # self.profile_options = { :runs => 5, :metrics => [:wall_time, :memory]
  #                          :output => 'tmp/performance', :formats => [:flat] }

  def setup
    get '/'
    # Register and login
    post_via_redirect '/users', user: { uid: 'alice_rendering' }, password: 'pass'
    user = User.last
    Group.first.users.push(user)
    attend = user.attend(Contest.first)
    solve_problems(attend, Contest.first.problems.to_a)
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
