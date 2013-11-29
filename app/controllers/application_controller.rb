class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def send_receipt(email, tranaction_id)
    donation = Donation.where(email: email).last
    donation.token = tranaction_id
    donation.save
    Notifications.card_charged(tranaction_id, donation).deliver
  end
end
