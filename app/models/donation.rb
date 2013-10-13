class Donation < ActiveRecord::Base
  attr_accessible :amount, :email, :name

  validates :name, :email,  presence: true
end
