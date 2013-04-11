require 'spec_helper'

describe "customers/edit" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :full_name => "MyString",
      :email => "MyString",
      :display_name => "MyString",
      :password_digest => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do
      assert_select "input#customer_full_name[name=?]", "customer[full_name]"
      assert_select "input#customer_email[name=?]", "customer[email]"
      assert_select "input#customer_display_name[name=?]", "customer[display_name]"
      assert_select "input#customer_password_digest[name=?]", "customer[password_digest]"
    end
  end
end
