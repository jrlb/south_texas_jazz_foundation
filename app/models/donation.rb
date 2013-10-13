# -*- coding: utf-8 -*-
class Donation < ActiveRecord::Base
  attr_accessible :amount, :email, :name

  monetize :amount_cents

  validates :name, :email,  presence: true
  validates :amount, numericality: { greater_than: 0 }, presence: true

  def save_with_payment(token)
    if valid?
      begin
        Stripe::Charge.create(amount: amount_cents,
                              currency: "usd",
                              card: token,
                              description: email)
        save!
      rescue Stripe::CardError => e
        logger.error "Stripe error while creating customer: #{e.mesage}"
        errors.add :base, "There was a problem with your credit card."
      end
    end
  end
end
