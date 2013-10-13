class Donation < ActiveRecord::Base
  attr_accessible :amount, :email, :name
end
