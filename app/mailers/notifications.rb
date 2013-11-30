class Notifications < ActionMailer::Base
  default from: 'support@jrlbconsulting.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.card_charged.subject
  #
  def card_charged(tranaction_id, donation)
    @donation = donation
    @txn = tranaction_id
    mail to: @donation.email, subject: 'South Texas Jazz Foundation Donation'
  end
end
