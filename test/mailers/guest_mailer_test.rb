require 'test_helper'

class GuestMailerTest < ActionMailer::TestCase
  test "survey" do
    mail = GuestMailer.survey
    assert_equal "Survey", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
