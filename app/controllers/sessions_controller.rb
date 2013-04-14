class SessionsController < ApplicationController
  layout 'session'
  def new
  end

  def index
  end

  def create
    @user = User.find_by_email(params[:sessions][:email])
    if @user && @user.authenticate(params[:sessions][:password])
      # if @user.admin
      #   session[:user_id] = @user.id
      #   redirect_to admin_dashboard_path, notice: "Logged in!"
      # elsif @user.admin == false
      #   session[:user_id] = @user.id
      #   redirect_to root_url, notice: "Logged in!"
      # end
      session[:user_id] = @user.id
      flash[:notice] = "Logged In!"
      redirect_to(session[:return_to])
    else
      flash.now[:error] = "Wrong user email and/or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You successfully logged out!"
    redirect_to root_url
  end
end
