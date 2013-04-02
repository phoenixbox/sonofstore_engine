class OrdersController < ApplicationController
before_filter :signed_in?
  
  def index
    @orders = Order.all
  end

  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to products_path, notice: "Your cart is currently empty."
      return
    end

    @order = Order.new
    respond_to do |format|
      format.html
      format.json { render json: @order }
    end
  end

  def create
    @order = Order.new(params[:order])
    @order.add_line_items(current_cart)
    @order.total_price = @order.total_price_from_cart(current_cart)
    @order.status = "pending"
    @order.user = current_user
    if @order.save
      redirect_to order_path(@order)
      @cart = current_cart
      @cart.destroy
      session[:cart_id] = nil
    else
      render "new"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes params[:order]
      redirect_to order_path(@order)
    else
      render :edit
    end
  end

private
  def signed_in?
    redirect_to login_path, notice: "You must be logged in to checkout." unless current_user
  end
end
