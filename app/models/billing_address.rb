class BillingAddress < ActiveRecord::Base
  attr_accessible :street, :city, :state, :zipcode, :consumer_id

  belongs_to :consumer
  validates_presence_of :street, :city, :state, :zipcode, :consumer_id
end
