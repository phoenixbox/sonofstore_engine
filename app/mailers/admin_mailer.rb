class AdminMailer < ActionMailer::Base
  default from: "mrorange@getuserwise.com"

  def unregistered_admin_invite_email(data)
    @email = data[:user]
    @store = data[:store_id]
    mail(:to => @email, :subject => "You've been invited to be an Admin for #{@store.name} on Shopmazing!")
  end

  def registered_admin_invite_email(data)
    @user = data[:user]
    @store = data[:store_id]
    mail(:to => @user.email, :subject => "You've have been invited to be an Admin for #{@store.name} on Shopmazing!")
  end

  def admin_removal_confirmation_email(data)
    @user = data[:user]
    @store = data[:store_id]
    mail(:to => @user.email, :subject => "You've removed as an Admin for #{@store.name} on Shopmazing")
  end


end
