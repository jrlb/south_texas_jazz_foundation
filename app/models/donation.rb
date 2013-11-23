# -*- coding: utf-8 -*-
class Donation < ActiveRecord::Base
  attr_accessible :amount, :email, :name, :token

  monetize :amount_cents

  validates :name, :email,  presence: true
  validates :amount, numericality: { greater_than: 0 }, presence: true

  def self.donors
    all.group_by { |d| Donation::Level.membership d.amount }
  end

  def save_with_payment(stripe_token)
    if valid?
      begin
        Stripe::Charge.create(amount: amount_cents,
                              currency: 'usd',
                              card: stripe_token,
                              description: email)
        self.token = stripe_token
        save!
      rescue Stripe::CardError => e
        logger.error "Stripe error while creating customer: #{e.mesage}"
        errors.add :base, "There was a problem with your credit card."
      end
    end
  end
end
