class OrdersController < ApplicationController
  before_filter :signed_in?

  def index
    @orders = Order.find_all_by_user_id(current_user)
  end

  def new
    @cart = current_cart
    if @cart.line_items.empty?
      flash[:error] = "Your cart is currently empty."
      redirect_to products_path
      return
    end

    @cart = current_cart

    @order = Order.new

    @address = ShippingAddress.new
  end

  def create
    @address = ShippingAddress.new(params[:address])
    @address.user_id = session[:user_id]

    @cart = current_cart

    @order = Order.new(params[:order])
    @order.add_line_items(current_cart)
    @order.total_price = @order.total_price_from_cart(current_cart)
    @order.user = current_user

    if @address.save
      @order.save
      redirect_to order_path(@order)
      @cart.destroy
      session[:cart_id] = nil
    else
      render "new"
   end
  end

  def show
    @order = Order.find(params[:id])

    if @order.user == current_user
      render "show"
    else
      flash[:error] ="You are not authorized to view another customer's orders."
      redirect_to root_path
    end
  end


private
  def signed_in?
    if !current_user
      flash[:error] = "You must be logged in to checkout."
      redirect_to login_path
    end
  end
end
