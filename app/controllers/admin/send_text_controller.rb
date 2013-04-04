class Admin::SendTextController < Base::ApplicationController
  def index
  end

  def send_text_message
    number_to_send_to = params[:number_to_send_to]

    twilio_sid = "AC97f969af999d2976405246ebc3af819d"
    twilio_token = "10e694292dc87016b3b1e668543c7baa"
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
