require 'spec_helper'

describe Cart do
  it "is not empty" do
    cart = Cart.create
    line_item1 = LineItem.create(product_id: 1, cart_id: cart.id)
    expect(cart.empty?).to be_false
  end
end
