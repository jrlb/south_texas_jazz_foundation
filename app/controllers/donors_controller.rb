class DonorsController < ApplicationController
  def index
    @donors = Donation.donors
  end
end
