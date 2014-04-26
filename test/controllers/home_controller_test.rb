require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get cards" do
    get :cards
    assert_response :success
  end

  test "should get player" do
    get :player
    assert_response :success
  end

  test "should get team" do
    get :team
    assert_response :success
  end

  test "should get research" do
    get :research
    assert_response :success
  end

  test "should get events" do
    get :events
    assert_response :success
  end

end
