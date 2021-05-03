require 'test_helper'

class LiveChatTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:three)
    @channel = channels(:one)
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
    assert_no_difference 'Channel.count' do
      post channels_path, params: { channel: { name: " "} }
    end
    assert_match "error", response.body
    #assert_select 'div.alert'
    #assert_select 'h4.alert-heading'
  end

  test "can create a channels called arms" do
  get "/channels/new"
  assert_response :success
  post channels_url, params: { channel: { name: "arms" } }
  assert_response :redirect
  follow_redirect!
  assert_response :success
  assert_select "strong", "arms"
end

test "can create a channels called legs" do
get "/channels/new"
assert_response :success
post channels_url, params: { channel: { name: "legs" } }
assert_response :redirect
follow_redirect!
assert_response :success
assert_select "strong", "legs"
end

test "create message" do
  get channels_url
  assert_response :success
  post channels_path, params: { message: { body: "hello", users: @current_user} }
  assert_response :redirect
  follow_redirect!
  assert_response :success
  assert_select "message.body", "hello"
end
end
