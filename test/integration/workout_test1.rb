require 'test_helper'

class WorkoutTest1 < ActionDispatch::IntegrationTest
 setup do
   sign_in users(:three)
 end

test "can get workouts" do
  get workouts_url
  assert_response :success
end

  test "workout's errors" do
    get workouts_url
    assert_response :success
    #no change in the workouts count when posting nothing on the workout name field
    assert_no_difference 'workouts.count' do
      post workouts_path, params: { workout: { name: " "} }
    end
    #error should be present in the html body if workout name field is blank
    assert_match "errors", response.body
  end

  test "show and General Fitness exercise was created" do
    get "/workouts/new"
    assert_response :success
    #posts the values in the params and follows the path
      post workouts_url, params: { workout: { name: "12314", fitness_goal: "General Fitness"} }
      assert_response :redirect
      follow_redirect!
      assert_response :success
      #looks for "Workout successfully created." in the p tag
    assert_select "p", "Workout successfully created."
  end

  test "show and Endurence exercise was created" do
    get "/workouts/new"
    assert_response :success
    #posts the values in the params and follows the path
      post workouts_url, params: { workout: { name: "12314", fitness_goal: "Endurence"} }
      assert_response :redirect
      follow_redirect!
      assert_response :success
      #looks for "Workout successfully created." in the p tag
    assert_select "p", "Workout successfully created."
  end

  test "show Muscle Mass exercise was created" do
    get "/workouts/new"
    assert_response :success
    #posts the values in the params and follows the path
      post workouts_url, params: { workout: { name: "12314", fitness_goal: "Muscle Mass"} }
      assert_response :redirect
      follow_redirect!
      assert_response :success
    #looks for "Workout successfully created." in the p tag
    assert_select "p", "Workout successfully created."
  end

  test "show and Muscle Strength exercise was created" do
    get "/workouts/new"
    assert_response :success
    #posts the values in the params and follows the path
      post workouts_url, params: { workout: { name: "12314", fitness_goal: "Muscle Strength"} }
      assert_response :redirect
      follow_redirect!
      assert_response :success
      #looks for "Workout successfully created." in the p tag
    assert_select "p", "Workout successfully created."
  end
end
