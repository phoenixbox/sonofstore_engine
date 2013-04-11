# class SessionsController < ApplicationController
#   def new
#   end

#   def create
#     @user = User.find_by_email(params[:session][:email])
#     if @user && @user.authenticate(params[:session][:password])
#       # if @use.admin
#       #   session[:user_id] = @user.id
#       #   redirect_to admin_dashboard_path, notice: "Logged in!"
#       # elsif @user.admin == false
#       #   session[:user_id] = @user.id
#       #   redirect_to root_url, notice: "Logged in!"
#       # end
#       session[:user_id] = @user.id
#       flash[:notice] = "Created!"
#       redirect_to products_path
#     else
#       flash.now[:error] = "Wrong user email and/or password"
#       render "new"
#     end
#   end

#   def destroy
#     session[:user_id] = nil
#     flash[:notice] = "You successfully logged out!"
#     redirect_to root_url
#   end
# end
