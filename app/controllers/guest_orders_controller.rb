class GuestOrdersController < ApplicationController

  def new
    @cart = current_cart
    if @cart.line_items.empty?
      flash[:error] = "Your cart is currently empty."
      redirect_to products_path
      return
    end

    @cart = current_cart

    @order = Order.new
  end

   def create
    @order = Order.create_from_cart(current_cart, params[:order], current_user)

    if @order.id
      UserMailer.order_confirmation_email(current_user).deliver
      current_cart.destroy
      session[:cart_id] = nil
      flash[:notice] = "Your payment was successfully submitted!"
      redirect_to order_path(@order)
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
end
