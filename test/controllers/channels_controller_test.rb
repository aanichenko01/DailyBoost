require 'test_helper'

class ChannelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @channel = channels(:one)
    sign_in users(:three)
  end

  test "should get index" do
    get channels_url
    assert_response :success
  end

  test "should get new" do
    get "/channels/new"
    assert_response :success
  end

  test "should create channel" do
    assert_difference('Channel.count') do
      post channels_url, params: { channel: { name: @channel.name } }
    end

    assert_redirected_to channel_url(Channel.last)
  end

  test "should show channel" do
    get channels_url(@channel)
    assert_response :success
  end

  test "should get edit" do
    get edit_channel_url(@channel)
    assert_response :success
  end

  test "should update channel" do
    patch channel_url(@channel), params: { channel: { name: @channel.name } }
    assert_redirected_to channel_url(@channel)
  end

  test "should destroy channel" do
    assert_difference('Channel.count', -1) do
      delete channel_url(@channel), xhr: false
    end
    assert_redirected_to channels_url
  end
end
