class Customer < ActiveRecord::Base
  attr_accessible :display_name, :email, :full_name, :password, :password_confirmation
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :email, :password, :password_confirmation, :full_name
end
