require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
 setup do
      sign_in users(:one)
  end

  test "should show categories listing" do
    get workouts_url
    assert_response :success
    assert_no_difference 'workouts.count' do
      post workouts_path, params: { workout: { category: "Legs"} }

      post workouts_path, params: { workout: { category: "Arms"} }
      post workouts_path, params: { workout: { category: "Back"} }
      post workouts_path, params: { workout: { category: "Calves"} }
      post workouts_path, params: { workout: { category: "Chest"} }
      post workouts_path, params: { workout: { category: "Shoulders"} }
    end
    assert_select "Legs", response.body
    assert_select "Abs", response.body
    assert_select "Arms", response.body
    assert_select "Back", response.body
    assert_select "Calves", response.body
    assert_select "Chest", response.body
    assert_select "Shoulders", response.body
  end

  test "should show abs" do
    get workouts_url
    assert_response :success
    assert_no_difference 'workouts.count' do
    post workouts_path, params: { workout: { category: "Abs"} }
  end
    assert_select "Abs", response.body
    end
end
