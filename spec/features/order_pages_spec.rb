# require 'spec_helper'
# require 'capybara'

# describe "Order pages" do
#   describe "Redirecting a customer to checkout" do
#     before do
#       product = Product.create(title: "Mustache", description: "I mustache you a question.", price_in_dollars_and_cents: 5.99)
#       visit product_path(product)
#     end

#     context "with items in the customer's cart" do
#       it "redirects the customer to the checkout page" do
#         click_button("Add to Cart")
#         click_button("Checkout")
#         expect(page).to have_content "Please enter your details"
#       end
#     end
#   end
# end