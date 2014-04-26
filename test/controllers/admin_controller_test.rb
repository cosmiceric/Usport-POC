require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get approve_investors" do
    get :approve_investors
    assert_response :success
  end

end
