require 'test_helper'

class DeviseControllerTest < ActionDispatch::IntegrationTest
  Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
  end

  test "should get sign up page" do
    get new_user_registration_url
    assert_response :success

    assert_select 'h2', 'Sign up'
    assert_select 'form', count: 1
    assert_select 'li', 'Login'


    assert_template layout: 'application'
    assert_template partial: '_header'
    assert_template partial: '_footer'
  end

  test "should get log in page" do
    get new_user_session_url
    assert_response :success

    assert_select 'h2', 'Log in'
    assert_select 'form', count: 1
    assert_select 'label', 'Remember me'

    assert_template layout: 'application'
    assert_template partial: '_header'
    assert_template partial: '_footer'
  end

  test "should redirect to home page when user logs outs" do
    delete destroy_user_session_url
    assert_redirected_to root_url
  end

  test "should get edit page if user signed in" do
    sign_in @user
    get edit_user_registration_url
    assert_response :success

    assert_select 'h2', 'Edit Profile'
    assert_select 'form', count: 2

    assert_template layout: 'application'
    assert_template partial: '_header'
    assert_template partial: '_footer'
  end 

  test "should get forgot password page" do
    get new_user_password_url
    assert_response :success

    assert_select 'h2', 'Forgot your password?'
    assert_select 'form', count: 1

    assert_template layout: 'application'
    assert_template partial: '_header'
    assert_template partial: '_footer'
  end 

  test "should destroy user and redirect to homepage" do
    sign_in @user

    assert_difference('User.count', -1) do
        delete user_registration_url
    end
  
    assert_redirected_to root_url
  end

end