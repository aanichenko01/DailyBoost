require 'test_helper'

class WorkoutsControllerTest < ActionDispatch::IntegrationTest
  Devise::Test::IntegrationHelpers

  #Creates a workout
  #Signs in user so tests can run
  setup do
    get '/users/sign_in'
    @workout = workouts(:one)
    sign_in users(:one)
    post user_session_url
  end

  test "should get index" do
    get workouts_url
    assert_response :success

    assert_select 'h2', 'Your Workouts'
    assert_select 'li', 'Workout'
    assert_template layout: 'application'
    assert_template partial: '_header'
    assert_template partial: '_footer'
  end

  test "should get new" do
    get new_workout_url
    assert_response :success

    assert_select 'h1', 'New Workout'
    assert_template layout: 'application'
    assert_template partial: '_header'
    assert_template partial: '_footer'
  end

  test "should create workout" do
    assert_difference('Workout.count') do
      post workouts_url, params: { workout: { fitness_goal: @workout.fitness_goal, name: @workout.name } }
    end

    assert_redirected_to workout_url(Workout.last)
  end

  test "should show workout" do
    get workout_url(@workout)
    assert_response :success

    assert_template layout: 'application'
    assert_template partial: '_header'
    assert_template partial: '_footer'
  end

  test "should get edit" do
    get edit_workout_url(@workout)
    assert_response :success

    assert_select 'h1', 'Editing Name'
    assert_template layout: 'application'
    assert_template partial: '_header'
    assert_template partial: '_footer'
  end

  test "should update workout" do
    patch workout_url(@workout), params: { workout: { fitness_goal: @workout.fitness_goal, name: @workout.name } }
    assert_redirected_to workout_url(@workout)
  end

  test "should destroy workout" do
    assert_difference('Workout.count', -1) do
      delete workout_url(@workout)
    end

    assert_redirected_to workouts_url
  end

  test "should redirect to login if not logged in" do
    delete destroy_user_session_url

    get workouts_url
    assert_redirected_to new_user_session_url
  end
end