class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :display_name,
                  :email,
                  :full_name,
                  :password,
                  :password_confirmation,
                  :phone_number_attributes,
                  :store_id,
                  :store_name

  attr_accessor :store_name

  validates_uniqueness_of :email
  validates_presence_of :full_name, :email, :password
  validates :display_name, :length => { :minimum => 2,
    :maximum => 32 }, :allow_blank => true

  has_one :phone_number
  has_one :consumer
  has_many :user_store_roles
  has_many :stores, :through => :user_store_roles

  accepts_nested_attributes_for :phone_number

  def phone
    phone_number ? phone_number.phone : nil
  end

  def receive_sms?
    phone_number ? phone_number.receive_sms : false
  end

  def can_receive_messages?
    phone.present? && receive_sms?
  end

  def assign_super_admin
    self.super_admin = true
    self.save
  end

  def is_super_admin?
    self.super_admin
  end

end
