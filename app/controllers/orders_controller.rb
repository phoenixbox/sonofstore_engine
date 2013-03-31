class OrdersController < ApplicationController

  def new
    @cart = current_cart
    @user = User.find(session[:user_id])
    if @cart.line_items.empty?
      redirect_to products_path, notice: "Your cart is currently empty."
      return
    end

    if @user
      @order = Order.new
      respond_to do |format|
        format.html
        format.json { render json: @order }
      end
    else
      render "login", notice: "You must be logged in to checkout."
    end
  end

  def create
    @order = Order.new(params[:order])
    @order.add_line_items(current_cart)
    @order.total_price(current_cart)
    if @order.save
      redirect_to order_path(@order)
      @cart = current_cart
      @cart.destroy
      session[:cart_id] = nil
    else
      render "new"
    end
  end
end
