require 'test_helper'
require 'rails/performance_test_help'
require 'rake'

class ScoreboardTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { :runs => 5, :metrics => [:wall_time, :memory]
  #                          :output => 'tmp/performance', :formats => [:flat] }

  def setup
    get '/'
    # Register and login
    post_via_redirect '/users', user: { uid: 'alice' }, password: 'pass'
  end

  def test_scoreboard
    get '/contests/1/score'
  end
end
