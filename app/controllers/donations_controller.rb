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
    logger.info event_json
    render nothing: true, status: :ok
  end
end
