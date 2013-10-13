class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(params[:donation])
    if @donation.save
      redirect_to new_donation_path, notice: 'Thank you for donating!'
    else
      render :new
    end
  end
end
