class Consumer < ActiveRecord::Base
  attr_accessible :billing_address_id, :email, :shipping_address_id, :user_id

  validates_presence_of :email, :billing_address_id, :shipping_address_id, :user_id
  validates_uniqueness_of :email, :billing_address_id, :user_id

  has_many :orders
  has_one :user
  has_one :billing_address_id
  has_one :shipping_address_id
  
end
