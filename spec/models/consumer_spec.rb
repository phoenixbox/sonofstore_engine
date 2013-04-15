require 'spec_helper'

describe Consumer do

  context "email" do

    let(:consumer){Consumer.new}
    let(:consumer1){Consumer.new}

    it "validates presence of email" do
      consumer.email = nil
      expect(consumer.save).to_not be
    end

    it "validates uniqueness of email" do
      consumer.email = "email@test.com"
      consumer.save
      consumer1.email = "email@test.com"
      expect(consumer1.save).to_not be
    end    

    it "validates presence of billing_address_id" do
      consumer.billing_address_id = nil
      expect(consumer.save).to_not be
    end

    it "validates uniqueness of billing_address_id" do
      consumer.billing_address_id = 123
      consumer.save
      consumer1.billing_address_id = 123
      expect(consumer1.save).to_not be
    end

    it "validates presence of shipping_address_id" do
      consumer.shipping_address_id = nil
      expect(consumer.save).to_not be
    end

    it "validates presence of user_id" do
      consumer.user_id = nil
      expect(consumer.save).to_not be
    end

    it "validates uniqueness of user_id" do
      consumer.user_id = 12345
      consumer.save
      consumer1.user_id = 12345
      expect(consumer.save).to_not be
    end

  end

end
