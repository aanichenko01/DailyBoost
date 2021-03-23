require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "should return contact email" do
    mail = ContactMailer.contact_email("group8@me.com",
    "Group 8", "1234567890", @message = "Hello")
    assert_equal ['info@DailyBoost.com'], mail.to
    assert_equal ['group8@me.com'], mail.from
  end
end
