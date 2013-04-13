class SessionsController < ApplicationController
  layout 'session'
  def new
  end

  def create
<<<<<<< Updated upstream
    @user = User.find_by_email(params[:sessions][:email])
    if @user && @user.authenticate(params[:sessions][:password])
=======
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
>>>>>>> Stashed changes
      # if @use.admin
      #   session[:user_id] = @user.id
      #   redirect_to admin_dashboard_path, notice: "Logged in!"
      # elsif @user.admin == false
      #   session[:user_id] = @user.id
      #   redirect_to root_url, notice: "Logged in!"
      # end
      session[:user_id] = @user.id
      flash[:notice] = "Created!"
<<<<<<< Updated upstream
      redirect_to products_path
=======
      redirect_to static_pages_path
>>>>>>> Stashed changes
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
