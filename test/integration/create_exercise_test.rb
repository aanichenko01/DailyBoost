require 'test_helper'

class CreateExerciseTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:three)
    @exercise = exercises(:one)
    @workout = workouts(:one)
  end

 test "can create an exercises" do
   get "/exercises/new"
   assert_response :success

   post exercises_url,
   params: { exercise: { workout_id:(:one),
     title: "Axe Hold", category: "Arms",
    description: "Grab dumbbells and extend arms to side and hold as long as you can",
    equipment: " ", sets: " 2 to 3", reps: " 6" } }
   assert_response :redirect
   follow_redirect!
   assert_response :success
   assert_select "Axe Hold", response.body
 end



 # test "should create exercise" do
 #  get "/exercises/new"
 #  assert_response :success
 #   assert_difference('Exercise.count') do
 #     post exercises_url, params: { exercise: { title: "Exercises" } }
 #     assert_response :redirect
 #   end
 #   follow_redirect!
 #   assert_response :success
 #   assert_select "Exercises", response.body
 # end
 #
 #  test "get the new exercise form and create exercise" do
 #    get "/exercises/new"
 #    assert_response :success
 #    assert_difference 'Exercise.count', 1 do
 #      post exercises_url, params: { exercise: { title: ""} }
 #    end
 #    follow_redirect!
 #    assert_response :success
 #    assert_select "errors", response.body
 #  end
  # test "get new exercise form and reject invalid exercise submission" do
  #   get "/exercise/new"
  #   assert_response :success
  #   assert_no_difference 'exercise.count' do
  #     post exercise_path, params: { exercise: { name: " "} }
  #   end
  #   assert_match "errors", response.body
  #   #assert_select 'div.alert'
  #   #assert_select 'h4.alert-heading'
  # end
end
