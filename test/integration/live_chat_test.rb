require 'test_helper'

class LiveChatTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:three)
    @channel = channels(:one)
    @message = messages(:one)
  end

  test "can see channels in the channel sections" do
    get channels_path
    assert_select "h1", "Channels"
  end

  test "can see name in the channel sections" do
    get channels_path
    assert_select "th", "Name"
  end

  test "channels's errors" do
    get "/channels/new"
    assert_response :success
    #no change in the channel count when posting nothing on the channel name field
    assert_no_difference 'Channel.count' do
      post channels_path, params: { channel: { name: " "} }
    end
    #error should be present in the html body if channel name field is blank
    assert_match "error", response.body
  end

  test "can create a channels called arms" do
  get "/channels/new"
  assert_response :success
  #posts the values in the params and follows the path
  post channels_url, params: { channel: { name: "arms" } }
  assert_response :redirect
  follow_redirect!
  assert_response :success
  #looks for "arms" in the strong tag
  assert_select "strong", "arms"
end

test "can create a channels called legs" do
get "/channels/new"
assert_response :success
#posts the values in the params and follows the path
post channels_url, params: { channel: { name: "legs" } }
assert_response :redirect
follow_redirect!
assert_response :success
#looks for "arms" in the strong tag
assert_select "strong", "legs"
end
end
