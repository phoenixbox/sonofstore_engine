class Store < ActiveRecord::Base
  attr_accessible :name, :path, :description, :users_attributes
  cattr_accessor :current_id

  validates_uniqueness_of :name, :path
  validates_presence_of :name, :path

  has_many :products
  has_many :users
  has_many :orders
  has_many :categories
  has_many :carts

  accepts_nested_attributes_for :users

  def self.find(path)
    find_by_path(path)
  end

  def to_param
    path
  end

end
