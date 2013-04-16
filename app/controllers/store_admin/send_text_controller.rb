class StoreAdmin::SendTextController < ApplicationController

  def index
  end

  def send_text_message number_to_send_to = params[:number_to_send_to]

    twilio_sid = ENV["TWILIO_SID"]
    twilio_token = EVN["TWILIO_TOKEN"]
    twilio_phone_number = "12402930574"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "Your order has been shipped! and will be,
        delivered on Monday, April 7th, 2013"
    )
  end
end
