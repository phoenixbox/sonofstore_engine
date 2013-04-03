require 'spec_helper'

describe Order do
  
  context "is a valid order" do
    let!(:order){Order.create(status: "pending", total_price: 45, user_id: 1)}
    it "is valid" do
      expect(order).to be_valid
    end
  end

  context "is missing total price" do
    let!(:order){Order.create(status: "pending", user_id: 1)}
    it "is not valid" do
      expect(order).to be_invalid
    end
  end

  context "is missing user id" do
    let!(:order){Order.create(status: "pending", total_price: 45)}
    it "is not valid" do
      expect(order).to be_invalid
    end
  end

  it "extrapolates the total price from the cart" do
    cart = stub(:total_price => 45)
    order = Order.new
    expect(order.total_price_from_cart(cart)).to eq 45
  end
end
