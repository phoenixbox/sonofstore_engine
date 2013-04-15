# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :consumer do
    email "MyString"
    billing_address_id 1
    shipping_address_id 1
    user_id 1
  end
end
