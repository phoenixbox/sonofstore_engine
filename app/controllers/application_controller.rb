class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

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

  # def current_cart
  #   if !session[:cart_id]
  #     cart = Cart.find_or_create_by_sid_and_store_id(session[:session_id], current_store.id)
  #   else
  #     cart = Cart.find(session[:cart_id])
  #   end
  #   session[:cart_id] = cart.id
  #   cart
  # end

  helper_method :current_cart

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_consumer
    @current_consumer ||= Consumer.find(session[:consumer_id])
  end

  helper_method :current_user, :current_consumer, :admin_user

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
