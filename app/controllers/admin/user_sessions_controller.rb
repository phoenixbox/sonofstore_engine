class Admin::UserSessionsController < Admin::BaseController
  def new
  end

  def create
    @user = User.find_by_email(params[:user_session][:email])
    if @user && @user.authenticate(params[:user_session][:password])
      # if @use.admin
      #   session[:user_id] = @user.id
      #   redirect_to admin_dashboard_path, notice: "Logged in!"
      # elsif @user.admin == false
      #   session[:user_id] = @user.id
      #   redirect_to root_url, notice: "Logged in!"
      # end
      session[:user_id] = @user.id
      flash[:notice] = "Logged In!"
      redirect_to admin_user_path(@user)
    else
      flash.now[:error] = "Wrong user email and/or password"
      render new_admin_user_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You successfully logged out!"
    redirect_to root_url
  end
end
