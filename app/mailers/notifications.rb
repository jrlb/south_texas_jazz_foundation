class Notifications < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.card_charged.subject
  #
  def card_charged
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
