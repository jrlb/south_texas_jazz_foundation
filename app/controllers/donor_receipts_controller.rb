class DonorReceiptsController < ApplicationController
  before_filter :authenticate_member!

  def index
    @donors = Donation.all
  end

  def resend_receipt
    donation = Donation.find(params[:id])
    send_receipt(donation.email, donation.token)
    redirect_to donor_receipts_path, notice: 'Receipt Sent'
  end
end
