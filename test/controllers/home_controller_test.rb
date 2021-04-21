require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  Devise::Test::IntegrationHelpers

  test "should get home" do
    get root_url
    assert_response :success
    assert_template layout: 'application'

    assert_select 'title', 'DailyBoost'
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', 'DailyBoost'
    assert_select 'h1', 'Contact Us'
  end

end
