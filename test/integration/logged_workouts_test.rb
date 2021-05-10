require 'test_helper'

class LoggedWorkoutsTest < ActionDispatch::IntegrationTest

  setup do
    sign_in users(:three)
  end


  test "should create logged_workout for legs and it shows up in calendar" do
    get "/logged_workouts"
    assert_response :success
    #posts the values in the params and follows the path
      post logged_workouts_url, params: { logged_workout: { name: "legs", start_time: "2021-April-30-15:31", user_id: 3 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    #looks for "Logged workout was successfully created." in the p tag
    assert_select "p", "Logged workout was successfully created."
    get "/calendar"
    assert_response :success
    #looks for "legs" in the div tag
    assert_select "div", "legs"
  end

  test "should create logged_workout for arms and it shows up in calendar" do
    get "/logged_workouts"
    assert_response :success
    #posts the values in the params and follows the path
      post logged_workouts_url, params: { logged_workout: { name: "arms", start_time: "2021-April-30-15:31", user_id: 3 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    #looks for "Logged workout was successfully created." in the p tag
    assert_select "p", "Logged workout was successfully created."
    get "/calendar"
    assert_response :success
    #looks for "arms" in the div tag
    assert_select "div", "arms"
end

test "should create logged_workout for back and it shows up in calendar" do
  get "/logged_workouts"
  assert_response :success
  #posts the values in the params and follows the path
    post logged_workouts_url, params: { logged_workout: { name: "back", start_time: "2021-April-30-15:31", user_id: 3 } }
  assert_response :redirect
  follow_redirect!
  assert_response :success
  #looks for "Logged workout was successfully created." in the p tag
  assert_select "p", "Logged workout was successfully created."
  get "/calendar"
  assert_response :success
  #looks for "back" in the div tag
  assert_select "div", "back"
end

test "should create logged_workout for shoulders and it shows up in calendar" do
  get "/logged_workouts"
  assert_response :success
  #posts the values in the params and follows the path
    post logged_workouts_url, params: { logged_workout: { name: "shoulders", start_time: "2021-April-30-15:31", user_id: 3 } }
  assert_response :redirect
  follow_redirect!
  assert_response :success
  #looks for "Logged workout was successfully created." in the p tag
  assert_select "p", "Logged workout was successfully created."
  get "/calendar"
  assert_response :success
  #looks for "shoulders" in the div tag
  assert_select "div", "shoulders"
end

test "should create logged_workout for abs and it shows up in calendar" do
  get "/logged_workouts"
  assert_response :success
  #posts the values in the params and follows the path
    post logged_workouts_url, params: { logged_workout: { name: "abs", start_time: "2021-April-30-15:31", user_id: 3 } }
  assert_response :redirect
  follow_redirect!
  assert_response :success
  #looks for "Logged workout was successfully created." in the p tag
  assert_select "p", "Logged workout was successfully created."
  get "/calendar"
  assert_response :success
  #looks for "abs" in the div tag
  assert_select "div", "abs"
end
end
