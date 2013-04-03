class BillingAddress < ActiveRecord::Base
  attr_accessible :street, :city, :state, :zipcode

  belongs_to :user
  validates_presence_of :street, :city, :state, :zipcode
end
