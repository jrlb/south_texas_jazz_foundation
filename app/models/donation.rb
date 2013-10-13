class Donation < ActiveRecord::Base
  attr_accessible :amount, :email, :name

  monetize :amount_cents

  validates :name, :email,  presence: true
  validates :amount, numericality: { greater_than: 0 }, presence: true
end
