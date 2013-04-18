class Store < ActiveRecord::Base
  attr_accessible :name, :path, :description, :users_attributes, :status
  before_validation :set_default_status, on: :create


  validates_uniqueness_of :name, :path
  validates_presence_of :name, :path, :description
  validates :status,
   presence: true,
   inclusion: { in: %w(online offline pending declined) }

  has_many :products
  has_many :orders
  has_many :categories
  has_many :carts
  has_many :user_store_roles
  has_many :users, :through => :user_store_roles

  scope :approved, where(status: %w(online offline))
  scope :online, where(status: "online")
  scope :pending, where(status: "pending")
  scope :declined, where(status: "declined")

  accepts_nested_attributes_for :users

  def self.find(path)
    find_by_path(path)
  end

  def to_param
    path
  end

  def is_admin?(user)
    user.super_admin || UserStoreRole.exists?(store_id: self.id,
                                              user_id: user.id,
                                              role: "admin")
  end

  def is_stocker?(user)
    UserStoreRole.exists?(store_id: self.id, user_id: user.id, role: "stocker")
  end

  def is_admin_or_stocker?(user)
    is_admin?(user) || is_stocker?(user)
  end

  def is_any_kind_of_admin?(user)
    user.super_admin || is_admin?(user) || is_stocker?(user)
  end

  private

  def set_default_status
    self.status = 'pending'
  end

end
