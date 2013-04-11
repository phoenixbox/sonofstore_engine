class Tenant < ActiveRecord::Base
  attr_accessible :name, :subdomain, :user_attributes
  cattr_accessor :current_id

  has_many :products
  has_one :user

  accepts_nested_attributes_for :user
end
