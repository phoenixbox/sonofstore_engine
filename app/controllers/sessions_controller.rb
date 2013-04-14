class SessionsController < ApplicationController
  layout 'session'
  
  def create
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash[:notice] = "Invalid email or password"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end

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
#       redirect_to static_pages_path
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
