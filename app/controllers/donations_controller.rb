class DonationsController < ApplicationController
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
    logger.info event_json
  end
end
