require 'test_helper'

class TimerControllerTest < ActionController::TestCase
  test "should get snack" do
    get :snack
    assert_response :success
  end

end
