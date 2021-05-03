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
    assert_no_difference 'workouts.count' do
      post workouts_path, params: { workout: { name: " "} }
    end
    assert_match "errors", response.body
    #assert_select 'div.alert'
    #assert_select 'h4.alert-heading'
  end
  test "show fitness goal" do
    get "/workouts/new"
    assert_response :success
    assert_no_difference 'workouts.count' do
      post workouts_path, params: { workout: { fitness_goal: "General Fitness"} }
      post workouts_path, params: { workout: { fitness_goal: "Endurance"} }
      post workouts_path, params: { workout: { fitness_goal: "Muscle Mass"} }
      post workouts_path, params: { workout: { fitness_goal: "Muscle Strength"} }
    end
    assert_select "General Fitness", response.body
    assert_select "Endurance", response.body
    assert_select "Muscle Mass", response.body
    assert_select "Muscle Strength", response.body
    #assert_select 'div.alert'
    #assert_select 'h4.alert-heading'
  end
end
