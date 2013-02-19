class Biography < ActiveRecord::Base
  attr_accessible :biography, :first_name, :instrument, :last_name

  if Rails.env.production?
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  else
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable 
  end
end
