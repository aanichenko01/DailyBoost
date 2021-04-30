require 'test_helper'

class CategoriesTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:three)
  end

  test "select Abs" do
    get workouts_path
    assert_response :success
    assert_difference 'Workout.count', 1 do
      post workouts_path, params: { workout: { category: "Abs"} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_select "Abs", response.body
  end
  # test "select Legs" do
  #   get workouts_path
  #   assert_response :success
  #   assert_difference 'Workout.count', 1 do
  #     post new_exercise_path, params: { workout: { category: "Legs"} }
  #     assert_response :redirect
  #   end
  #   follow_redirect!
  #   assert_response :success
  #   assert_select "Legs", response.body
  # end
  # test "select Back" do
  #   get workouts_path
  #   assert_response :success
  #   assert_difference 'Workout.count', 1 do
  #     post new_exercise_path, params: { workout: { category: "Back"} }
  #     assert_response :redirect
  #   end
  #   follow_redirect!
  #   assert_response :success
  #   assert_select "Back", response.body
  # end
  # test "select Shoulders" do
  #   get workouts_path
  #   assert_response :success
  #   assert_difference 'Workout.count', 1 do
  #     post new_exercise_path, params: { workout: { category: "Shoulders"} }
  #     assert_response :redirect
  #   end
  #   follow_redirect!
  #   assert_response :success
  #   assert_select "Shoulders", response.body
  # end
end
