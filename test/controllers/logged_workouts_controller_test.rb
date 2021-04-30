require 'test_helper'

class LoggedWorkoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @logged_workout = logged_workouts(:one)
      sign_in users(:three)
  end

  test "should get index" do
    get logged_workouts_url
    assert_response :success
  end

  test "should get new" do
    get new_logged_workout_url
    assert_response :success
  end

  test "should create logged_workout" do
    assert_difference('LoggedWorkout.count') do
      post logged_workouts_url, params: { logged_workout: { name: @logged_workout.name, start_time: @logged_workout.start_time, user_id: @logged_workout.user_id } }
    end

    assert_redirected_to logged_workout_url(LoggedWorkout.last)
  end

  test "should show logged_workout" do
    get logged_workouts_url(@logged_workout)
    assert_response :success
  end

  test "should get edit" do
    get edit_logged_workout_url(@logged_workout)
    assert_response :success
  end

  test "should update logged_workout" do
    patch logged_workout_url(@logged_workout), params: { logged_workout: { name: @logged_workout.name, start_time: @logged_workout.start_time, user_id: @logged_workout.user_id } }
    assert_redirected_to logged_workout_url(@logged_workout)
  end

  test "should destroy logged_workout" do
    assert_difference('LoggedWorkout.count', -1) do
      delete logged_workout_url(@logged_workout)
    end

    assert_redirected_to logged_workouts_url
  end
end
