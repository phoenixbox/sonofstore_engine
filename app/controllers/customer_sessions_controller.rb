# class CustomerSessionsController < ApplicationController
#   def new
#   end

#   def create
#     @customer = Customer.find_by_email(params[:session][:email])
#     if @customer && @customer.authenticate(params[:session][:password])

#       session[:customer_id] = @customer.id
#       flash[:notice] = "LOGGED IN!!"
#       redirect_to products_path
#     else
#       flash.now[:error] = "Wrong customer email and/or password"
#       render "new"
#     end
#   end

#   def destroy
#     session[:customer_id] = nil
#     flash[:notice] = "You successfully logged out!"
#     redirect_to root_url
#   end


# end
