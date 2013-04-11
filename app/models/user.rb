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

  # validates :password, presence: true, length: { minimum: 6 }
  # validates :password_confirmation, presence: true
  validates_uniqueness_of :email
  validates_presence_of :full_name, :email, :password
  validates :display_name, :length => { :minimum => 2,
    :maximum => 32 }, :allow_blank => true

  has_many :orders
  has_one :phone_number
  belongs_to :store

  accepts_nested_attributes_for :phone_number

  after_create :create_store


  def phone
    phone_number ? phone_number.phone : nil
  end

  def receive_sms?
    phone_number ? phone_number.receive_sms : false
  end

  def can_receive_messages?
    phone.present? && receive_sms?
  end

  private

  def create_store
    if self.store.nil?
      t = Store.create(name: self.store_name)
      if t.save
        self.store_id = t.id
        self.save
      end
    end
  rescue ArgumentError
    errors.add "you fucked up!!1"
  end

end
