require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:three)
  end

  test "can get home" do
    get root_url
    assert_response :success
  end

  test "can get achievements" do
    get achievements_url
    assert_response :success
  end

  test "can get calendar" do
    get calendar_url
    assert_response :success
  end

  test "can get tracker" do
    get logged_workouts_url
    assert_response :success
  end

  test "can get chat forum" do
    get channels_url
    assert_response :success
  end

  test "can get workouts" do
    get workouts_url
    assert_response :success
  end
end
