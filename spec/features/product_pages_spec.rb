require 'spec_helper'
require 'capybara/rspec'

describe "Product Pages" do
  describe "viewing products" do
    before { visit new_product_path }
    let(:submit) { "Create Product" }

    context "with invalid information" do
      it "should not create a new product" do
        expect { click_button submit }.not_to change(Product, :count)
      end
    end

    context "with valid information" do
      before do
        fill_in "title", with: "banana"
        fill_in "description", with: "yummy"
        fill_in "price", with: 10.00
      end
    end
  end
end

#   context "viewing products" do

#     it "should create a new product" do 
#       visit new_product_path
#       fill_in "product_title", :with => "ironing board"
#       fill_in "product_price", :with => "100"
#       fill_in "product_description", :with => "we do ironing boards well"
#       click_button "Create Product"
#       expect( page ).to have_content "ironing board"
#     end 

#     it "has a link on the page that redirects to all products" do
#       visit new_product_path
#       fill_in "product_title", :with => "ironing board"
#       fill_in "product_price", :with => "100"
#       fill_in "product_description", :with => "we do ironing boards well"
#       click_button "Create Product"
#       expect(page).to have_link "back to all"
#     end

#     it "links to the products index" do
#       visit new_product_path
#       fill_in "product_title", :with => "ironing board"
#       fill_in "product_price", :with => "100"
#       fill_in "product_description", :with => "we do ironing boards well"
#       click_button "Create Product"
#       click_link "back to all"
#       expect(page).to have_content "banana"
#     end
#   end
# end