require 'spec_helper'

describe "customers/new" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :full_name => "MyString",
      :email => "MyString",
      :display_name => "MyString",
      :password_digest => "MyString"
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_path, "post" do
      assert_select "input#customer_full_name[name=?]", "customer[full_name]"
      assert_select "input#customer_email[name=?]", "customer[email]"
      assert_select "input#customer_display_name[name=?]", "customer[display_name]"
      assert_select "input#customer_password_digest[name=?]", "customer[password_digest]"
    end
  end
end
