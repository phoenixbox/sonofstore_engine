require 'spec_helper'
require 'capybara/rspec'

describe "User pages" do
  subject { page }
  
  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Sign Up" }

    describe "with invalid information" do
      it "should not create a new user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "First name", with: "Kareem"
        fill_in "Last name", with: "Grant"
        fill_in "Email", with: "sample@sample.com"
        fill_in "user_password", with: "yes"
        fill_in "Password confirmation", with: "yes"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  # describe "login" do
  #   before { visit login_path }
  #   let(:submit) { "Log In" }

  #   describe "with invalid information" do
  #     it "should not log in a user" do
  #       expect { click_button submit }.not_to 
  # end
end