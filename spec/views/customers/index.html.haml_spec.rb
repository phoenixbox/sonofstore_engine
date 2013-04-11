require 'spec_helper'

describe "customers/index" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
        :full_name => "Full Name",
        :email => "Email",
        :display_name => "Display Name",
        :password_digest => "Password Digest"
      ),
      stub_model(Customer,
        :full_name => "Full Name",
        :email => "Email",
        :display_name => "Display Name",
        :password_digest => "Password Digest"
      )
    ])
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Display Name".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
  end
end
