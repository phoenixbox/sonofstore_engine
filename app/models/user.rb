class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :display_name,
                  :email,
                  :full_name,
                  :password,
                  :password_confirmation,
                  :phone_number_attributes

  validates :password, presence: true, length: { minimum: 6 }
  # validates :password_confirmation, presence: true
  validates_uniqueness_of :email
  validates_presence_of :full_name, :email, :password
  validates :display_name, :length => { :minimum => 2,
    :maximum => 32 }, :allow_blank => true

  has_many :orders
  has_one :phone_number
  accepts_nested_attributes_for :phone_number

  def phone
    self.phone_number.phone
  end

  def receive_sms?
    self.phone_number.receive_sms
  end

  def can_receive_messages?
    phone.present? && receive_sms?
  end
end
