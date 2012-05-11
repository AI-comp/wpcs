require 'test_helper'

class Contests::ScoresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get ranking" do
    get :ranking
    assert_response :success
  end

end
