require 'spec_helper'
require 'capybara/rspec'

describe "Product Pages" do

  describe "creating products" do
    before do
      Category.create(name: "wigs")
      Category.create(name: "beards") 
      visit new_admin_product_path
    end
    let(:submit) { "Create Product" }
    

    context "with invalid information" do
      it "should not create a new product" do
        expect { click_button submit }.not_to change(Product, :count)
      end
    end

    context "with valid information" do
      before do
        fill_in "Title", with: "banana"
        fill_in "Description", with: "yummy"
        fill_in "Price", with: 10.00
      end

      it "should create a product" do
        expect{ click_button submit }.to change(Product, :count).by(1)
      end
    end

    it "should have checkboxes for categories" do
      expect( page ).to have_content "wigs"
      expect( page ).to have_content "beards"
    end
  end

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
      pending
      expect( page ).to have_content "I mustache you a question."
    end
  end
  
  describe "product index page" do
    before do
      @product_1 = Product.create(title: "Mustache", description: "I mustache you a question.", price_in_dollars: 5.99)
      @product_2 = Product.create(title: "Wig", description: "I'm wigging out!", price_in_dollars: 15.50)
      visit admin_products_path
    end

    it "lists all products" do
      expect( page ).to have_content "Mustache"
      expect( page ).to have_content "Wig"
    end

    it "has links to the individual products" do
      expect( page ).to have_link("edit", :href => edit_admin_product_path(@product_1))
      expect( page ).to have_link("edit", :href => edit_admin_product_path(@product_2))
    end
  end
  
  describe "editing a product" do
    before do
      Category.create(name: "wigs")
      Category.create(name: "beards") 
      @product = Product.create(title: "Mustache", description: "I mustache you a question.", price_in_dollars: 5.99)
      visit edit_admin_product_path(@product)
    end

    context "with invalid information" do
      it "does not update the product" do
        pending 
        fill_in "Title", with: nil
        fill_in "Description", with: "yummy"
        fill_in "Price", with: 7.99
        click_button "Update Product"
        page.should have_content("An error occurred, please try again")
      end
    end

    context "with valid information" do
      it "updates the product" do
        fill_in "Title", with: "bandana"
        fill_in "Description", with: "yummy"
        fill_in "Price", with: 5.99
        click_button "Update Product"
        page.should have_content("bandana")
      end
    end

    it "should have checkboxes for categories" do
      expect( page ).to have_content "wigs"
      expect( page ).to have_content "beards"
    end
  end

  describe "destroying a product" do
    let!(:product){Product.create(title: "Mustache", description: "I mustache you a question.", price_in_dollars: 5.99)}

    context "removing items from the product index" do
      it "deletes a product" do
        pending
        visit product_path(product)
        expect{ click_link "Delete" }.to change(Product, :count).by(-1)
      end
    end
  end
end
