require "application_system_test_case"

class LoggedWorkoutsTest < ApplicationSystemTestCase
  setup do
    @logged_workout = logged_workouts(:one)
  end

  test "visiting the index" do
    visit logged_workouts_url
    assert_selector "h1", text: "Logged Workouts"
  end

  test "creating a Logged workout" do
    visit logged_workouts_url
    click_on "New Logged Workout"

    fill_in "Name", with: @logged_workout.name
    fill_in "Start time", with: @logged_workout.start_time
    fill_in "User", with: @logged_workout.user_id
    click_on "Create Logged workout"

    assert_text "Logged workout was successfully created"
    click_on "Back"
  end

  test "updating a Logged workout" do
    visit logged_workouts_url
    click_on "Edit", match: :first

    fill_in "Name", with: @logged_workout.name
    fill_in "Start time", with: @logged_workout.start_time
    fill_in "User", with: @logged_workout.user_id
    click_on "Update Logged workout"

    assert_text "Logged workout was successfully updated"
    click_on "Back"
  end

  test "destroying a Logged workout" do
    visit logged_workouts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Logged workout was successfully destroyed"
  end
end
