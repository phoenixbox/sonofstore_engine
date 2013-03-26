require 'spec_helper'
require 'capybara/rspec'

describe "Category pages" do
  subject { page }
  
  describe "Creating a category" do
    before { visit new_category_path }

    describe "with invalid information" do

      it "should not create a new category" do
        expect { click_button "submit" }.not_to change(Category, :count)
      end

      it "should display error message" do
        click_button "submit"
        page.should have_content("prohibited")
      end
    end

    describe "with valid information" do

      it "should increase Category count" do
        fill_in "Name", with: "Anything"
        expect { click_button "submit"}.to change(Category, :count)
      end
    end
  end
end
