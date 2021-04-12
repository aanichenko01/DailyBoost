require 'test_helper'

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  Devise::Test::IntegrationHelpers

  #Creates an exercise and workout
  #Signs in user so tests can run
  setup do
    get '/users/sign_in'
    @exercise = exercises(:one)
    @workout = workouts(:one)
    sign_in users(:one)
    post user_session_url
  end

  test "should create exercise" do
    assert_difference('Exercise.count') do
      post exercises_url, params: { exercise: { reps: @exercise.reps, sets: @exercise.sets, title: @exercise.title, category: @exercise.category, description: @exercise.description, equipment: @exercise.equipment, workout_id: @exercise.workout_id } }
    end

    assert_redirected_to workout_url(@workout)
  end

  test "should show exercise" do
    get exercise_url(@exercise)
    assert_response :success
    
    assert_template layout: 'application'
    assert_template partial: '_header'
    assert_template partial: '_footer'
  end

  test "should get edit" do
    get edit_exercise_url(@exercise)
    assert_response :success

    assert_template layout: 'application'
    assert_template partial: '_header'
    assert_template partial: '_footer'
  end

  test "should update exercise" do
    patch exercise_url(@exercise), params: { exercise: { reps: @exercise.reps, sets: @exercise.sets, title: @exercise.title, category: @exercise.category, description: @exercise.description, equipment: @exercise.equipment, workout_id: @exercise.workout_id } }
    assert_redirected_to exercise_url(@exercise)
  end

  test "should destroy exercise" do
    assert_difference('Exercise.count', -1) do
      delete exercise_url(@exercise), xhr: true
    end
  end
  
end