require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest

  test "can get home" do
    get home_url
    assert_response :redirect
  end

#   test "can get achievements" do
#     get achievements_url
#     assert_response :success
#   end
#
#   test "can get calendar" do
#     get calendar_url
#     assert_response :success
#   end
#
#   test "can get tracker" do
#     get logged_workouts_url
#     assert_response :success
#   end
#
#   test "can get chat forum" do
#     get channels_url
#     assert_response :success
#   end
#
#   test "can get workouts" do
#     get workouts_url
#     assert_response :success
#   end
end



#   test "get the new exercise form and create exercise" do
#     get "/exercise/new"
#     assert_reponse :success
#     assert_difference 'Exercise.count', 1 do
#       post exercise_path, params: { exercise: { name: "workout"} }
#       assert_reponse :redirect
#     end
#     follow_redirect!
#     assert_repsonse :success
#     assert_match "legs", repsonse.body
#   end
#   test "get new exercise form and reject invalid exercise submission" do
#     get "/exercise/new"
#     assert_response :success
#     assert_no_difference 'exercise.count' do
#       post exercise_path, params: { exercise: { name: " "} }
#     end
#     assert_match "errors", response.body
#     #assert_select 'div.alert'
#     #assert_select 'h4.alert-heading'
#   end
# end
