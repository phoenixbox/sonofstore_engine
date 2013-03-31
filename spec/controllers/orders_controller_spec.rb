# require 'spec_helper'

# describe OrdersController do
#   describe "GET #new" do
    
#     it "returns http success" do
#       product = Product.create(title: "a", description: "b", price_in_dollars_and_cents: 13)
#       item = LineItem.new(quantity: 2, product_id: product.id)
#       item.build_cart
#       item.save!
#       session[:cart_id] = item.cart.id

#       get :new
#       assert_response :success
#     end
#   end
# end
