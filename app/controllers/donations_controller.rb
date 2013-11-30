class DonationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :hook
  def new
    if params[:level] == 'custom'
      @donation = Donation.new
    else
      @donation = Donation.new amount: params[:level]
    end

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
    if event_json['type'] == 'charge.succeeded'
      send_receipt(event_json['data']['object']['description'],
                   event_json['data']['object']['id'])
    end
    render nothing: true, status: :ok
  end

  private

  def amount?
    !@donation.amount_cents.zero?
  end

  helper_method :amount?
end
