require 'spec_helper'

describe Order do

  context "is a valid order" do
    let!(:consumer){Consumer.create(:email => "consumer@buy.com")}
    let!(:order){Order.create(store_id: 1, total_price: 45, :consumer_id => consumer.id)}
    it "is valid" do
      expect(order).to be_valid
    end
  end

  context "is missing total price" do
    let!(:order){Order.create(:consumer_id => 1)}
    it "is not valid" do
      expect(order).to be_invalid
    end
  end

  context "is missing user id" do
    let!(:order){Order.create(total_price: 45)}
    it "is not valid" do
      expect(order).to be_invalid
    end
  end

  it "extrapolates the total price from the cart" do
    cart = stub(:total_price => 45)
    order = Order.new
    expect(order.total_price_from_cart(cart)).to eq 45
  end

  describe "incrementing and decrementing" do
    before do
      cart = Cart.create
      @line_item = LineItem.create(product_id: 10, cart_id: cart.id, quantity: 3)
      @order = Order.create(:consumer_id => 1)
      @order.line_items = []
      @order.line_items << @line_item
    end

    it "increases the quantity of a line item" do
      @order.add_quantity(@line_item)
      expect(@order.line_items.find(@line_item).quantity).to eq 4
    end

    it "decreases the quantity of a line item" do
      @order.decrease_quantity(@line_item)
      expect(@order.line_items.find(@line_item).quantity).to eq 2
    end

    it "increases quantity" do
      expect(@order.add_quantity(@line_item)).to be
    end

    it "decreases quantity" do
      expect(@order.decrease_quantity(@line_item)).to be
    end
  end

  describe 'Order.create_from_cart' do
    let(:consumer){Consumer.create(:email => "consumer@buy.com")}
    let!(:cart){Cart.create}
    let!(:store){Store.create}
    let!(:product){Product.create(:title => "os title", :description => "os desc", :price_in_dollars => 123, :store_id => store.id)}
    let!(:line_item){LineItem.create(:product_id => 1, :cart_id => cart.id)}
    it 'can self.create_from_cart(cart, order_details, consumer)' do
      order = Order.create_from_cart(cart, {"stripe_card_token"=>"tok_1f6oxg5j6k1FLn",
 "email"=>"dooder@oo",
 "billing_address_attributes"=>
  {"street"=>"1123", "city"=>"Denver", "state"=>"CO", "zipcode"=>"80203"},
 "shipping_address_attributes"=>
  {"street"=>"1123", "city"=>"Denver", "state"=>"CO", "zipcode"=>"80203"},
 "store_id"=>2}, consumer )
      expect(order).to be_valid
    end
  end

  describe 'Order.all.select' do
    it 'do what it do' do
      expect(Order.pending).to be_kind_of(Array)
    end

    it 'can Order.paid' do
      expect(Order.paid).to be_kind_of(Array)
    end

    it 'can Order.cancelled' do
      expect(Order.cancelled).to be_kind_of(Array)
    end

    it 'can Order.shipped' do
      expect(Order.shipped).to be_kind_of(Array)
    end

    it 'can Order.returned' do
      expect(Order.returned).to be_kind_of(Array)
    end
  end
  # describe "save_with_payment" do
  #   let!(:consumer){Consumer.create(:email => "consumer@buy.com")}
  #   let!(:cart){Cart.create}
  #   let!(:store){Store.create}
  #   let!(:product){Product.create(:title => "os title", :description => "os desc", :price_in_dollars => 123, :store_id => store.id)}
  #   let!(:line_item){LineItem.create(:product_id => 1, :cart_id => cart.id)}
  #   let(:order){Order.create(store_id: store.id, consumer_id: consumer.id, total_price: line_item.total_price)}
  #   it 'can save_with_payment' do
  #     expect(order).to be_valid
  #     expect(order.save_with_payment).to be_valid
  #   end
  # end
end
