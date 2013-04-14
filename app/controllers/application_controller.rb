class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_referrer, :only => [:new]

  helper_method :current_store

  def get_referrer
    if request.referrer.include?("login")
      session[:return_to]
    elsif request.referrer.include?("users")
      session[:return_to]
    else
      session[:return_to] = request.referrer
    end
  end
  
  def current_store
    @store ||= Store.find(params[:store_id])
  end

  private

  def current_cart
    if !session[:cart_id]
      cart = Cart.find_or_create_by_sid_and_store_id(session[:session_id], current_store.id)
    else
      cart = Cart.find(session[:cart_id])
    end
    session[:cart_id] = cart.id
    cart
  end


  helper_method :current_cart

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_customer
    @current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end

  helper_method :current_user, :current_customer, :admin_user

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  def admin_user
    current_user && current_user.admin?
  end

  def require_admin_user
    redirect_to login_path,
    alert: "Not authorized to access admin section" if !admin_user
  end
end
