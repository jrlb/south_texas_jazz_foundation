class DonationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :hook
  def new
    @level    = params[:price]
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
      send_receipt(event_json["data"]["object"]["description"],
                   event_json["data"]["object"]["id"])
    end
    render nothing: true, status: :ok
  end

  private

  def send_receipt(email, tranaction_id)
    donation = Donation.where(email: email).last
    Notifications.card_charged(tranaction_id, donation).deliver
  end
end
