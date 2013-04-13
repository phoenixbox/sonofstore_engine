class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_store
  
  def current_store
    @store ||= Store.find(params[:store_id])
  end

  private

  def current_cart
    if session[:cart_id]
      cart = Cart.find(session[:cart_id])
      unless cart.store == current_store
        cart = Cart.find_or_create_by_sid_and_store_id(session[:session_id], current_store.id)
      end
    else
      cart = Cart.find_by_sid(session[:session_id])
      if cart.nil?
        cart = Cart.create!(store_id: current_store.id, sid: session[:session_id])
      end
    end
    session[:cart_id] = cart.id
    cart
  end


  helper_method :current_cart

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
