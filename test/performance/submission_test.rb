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
    post_via_redirect '/users', user: { uid: 'alice_submission' }, password: 'pass'
    user = User.last
    Group.first.users.push(user)
    attend = user.attend(Contest.first)
    solve_problems(attend, Contest.first.problems.to_a)
  end

  def test_submit_550_times
    50.times do
      post_via_redirect '/contests/1/problems/1/submit', id: 1, input_type: Problem::SMALL, text_area: (0..10).to_a.sample
    end
  end
end
