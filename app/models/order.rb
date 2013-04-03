class Order < ActiveRecord::Base
  attr_accessible :status, :total_price, :user_id

  has_many :line_items
  belongs_to :user
  validates_presence_of :status, :total_price, :user_id

  def add_line_items(cart)
    cart.line_items.each do |li|
      li.cart_id = nil
      line_items << li
    end
  end

  def total_price_from_cart(cart)
    self.total_price = cart.total_price
    total_price
  end

  def from_cart(cart)
    self.line_items = cart.line_items.each do |li|
      li.cart_id = nil
      self.line_items << li
    end

    total_price_from_cart(cart)
    self.status = "pending"
    self
  end
end
