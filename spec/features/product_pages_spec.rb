require 'spec_helper'
require 'capybara/rspec'

describe "Product Pages" do

  describe "individual product page" do

    before do
      category2 = Category.create(name: "wigs")
      category1 = Category.create(name: "beards")
      product = Product.create(title: "Mustache", description: "I mustache you a question.", price_in_dollars: 5.99)
      ProductCategory.create(product_id: (product.id), category_id: (category1.id))
      ProductCategory.create(product_id: (product.id), category_id: (category2.id))
      visit product_path(product)
    end

    it "should show the page for an individual product" do
      expect( page ).to have_content "I mustache you a question."
    end
  end

  describe "product index page" do
    before do
      @product_1 = Product.create(title: "Mustache", description: "I mustache you a question.", price_in_dollars: 5.99)
      @product_2 = Product.create(title: "Wig", description: "I'm wigging out!", price_in_dollars: 15.50)
      visit products_path
    end

    it "lists all products" do
      expect( page ).to have_content "Mustache"
      expect( page ).to have_content "Wig"
    end

    it "has links to the individual products" do
      expect( page ).to have_link("edit", :href => edit_product_path(@product_1))
      expect( page ).to have_link("edit", :href => edit_product_path(@product_2))
    end
  end


  describe "Adding a product to the cart" do
    let!(:product) {Product.create(title: "Mustache", description: "Hi", price_in_dollars: 34.99)}

    context "When clicking the 'Add to Cart' button" do
      it "creates a line item" do
        visit product_path(product)
        expect { click_button("Add to Cart")}.to change(LineItem, :count).by(1)
      end

      it "displays a cart with the item added" do
        visit product_path(product)
        click_button "Add to Cart"
        expect( page ).to have_content "Mustache"
      end
    end
  end
  
  describe "Adding multiple items to a cart" do
    let!(:product) {Product.create(title: "Mustache", description: "Hi", price_in_dollars: 34.99)}

    context "When adding multiple of the same item" do
      it "lists quantity without duplication of lines" do
        visit product_path(product)
        click_button("Add to Cart")
        visit product_path(product)
        click_button("Add to Cart")
        expect( page ).to have_content "2"
      end
    end
  end

  describe "Deleting items from a cart" do
    let!(:product) {Product.create(title: "Mustache", description: "Hi", price_in_dollars: 34.99)} 
    
    it "shows an empty cart" do
      visit product_path(product)
      click_button("Add to Cart")
      expect{ click_button("Empty cart") }.to change(Cart, :count).by(-1)
    end
  end
end
