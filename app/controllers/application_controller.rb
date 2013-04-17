class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  before_filter :get_referrer, :only => [:new, :checkout_funnel]


  def get_referrer
    if request.referrer.include?("login")
      session[:return_to]
    elsif request.referrer.include?("users")
      session[:return_to]
    elsif request.referrer.include?("checkout")
      session[:return_to]
    elsif request.referrer.include?("carts")
      session[:return_to] = new_order_path(current_store)
    else
      session[:return_to] = request.referrer
    end
  end

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


  def current_store
    @store ||= Store.find(params[:store_id])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_consumer
    @current_consumer ||= Consumer.find(session[:consumer_id])
  end

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  # def admin_user
  #   current_user && current_user.has_any_role?(:super_admin, :store_admin, :stocker_admin)
  # end

  # def require_admin_user
  #   redirect_to login_path,
  #   alert: "Not authorized to access admin section" if !admin_user
  # end

  helper_method :current_user, :current_consumer, :admin_user, :current_store, :current_cart

  # def is_super_admin?
  #   current_user && current_user.has_role?(:super_admin)
  # end

  # def is_store_or_stocker_admin?
  #   current_user && current_user.has_any_role?(:store_admin, :stocker_admin)
  # end

  # def has_store_access?
  #   current_store.id == current_user.store_id
  # end

  # def check_admin_access
  #   unless (is_store_or_stocker_admin? && has_store_access?) || is_super_admin?
  #     redirect_to root_path, notice: "not authorized"
  #   end
  # end

  def require_super_admin
    redirect_to root_path, alert: "Not a Platform Admin" unless current_user.is_super_admin?
  end
end
