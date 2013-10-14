class DonationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :hook
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(params[:donation])
    if @donation.save_with_payment(params[:stripe_card_token])
      redirect_to new_donation_path, notice: 'Thank you for donating!'
    else
      render :new
    end
  end

  def hook
    event_json = JSON.parse(request.body.read)
    if event_json["type"] == "charge.succeeded"
      logger.info event_json["type"]
      logger.info event_json["data"]["object"]["description"]
      send_receipt(event_json["data"]["object"]["description"])
    end
    render nothing: true, status: :ok
  end

  private

  def send_receipt(email)
    logger.info email
    donation = Donation.where(email: email).last
    Notifications.card_charged(email, donation.amount.to_f)
  end
end
