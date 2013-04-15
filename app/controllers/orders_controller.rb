class OrdersController < ApplicationController
  before_filter :signed_in?

  def index
    @orders = Order.find_all_by_consumer_id(current_user)
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

  end

  def create
    binding.pry
    # log in check
    if current_user
      # logged in then create new consumer
      consumer = Consumer.find_by_user_id(current_user)
      unless consumer
        consumer = Consumer.create(email: current_user.email)      
      end
    else
      consumer = Consumer.create(email: params[:email])      
    end
    
    @order = Order.create_from_cart(current_cart, params[:order], consumer)

    if @order.id
      UserMailer.order_confirmation_email(current_user).deliver
      current_cart.destroy
      session[:cart_id] = nil
      flash[:notice] = "Your payment was successfully submitted!"
      redirect_to order_path(@order)
    else
      flash.now[:notice] = "There was an error processing your card!"
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
