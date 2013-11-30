require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test 'card_charged' do
    mail = Notifications.card_charged
    assert_equal 'Card charged', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

end
