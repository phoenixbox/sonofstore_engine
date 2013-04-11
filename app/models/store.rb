class Store < ActiveRecord::Base
  attr_accessible :name, :path #, :user_attributes
  cattr_accessor :current_id

  has_many :products
  has_many :users
  has_many :orders

  # accepts_nested_attributes_for :user
  def self.find(path)
    find_by_path(path)
  end

  def to_param
    path
  end

end
