class Store < ActiveRecord::Base
  attr_accessible :name, :path, :users_attributes
  cattr_accessor :current_id

  has_many :products
  has_many :users
  has_many :orders

  accepts_nested_attributes_for :users
  def self.find(path)
    find_by_path(path)
  end

  def to_param
    path
  end

end
