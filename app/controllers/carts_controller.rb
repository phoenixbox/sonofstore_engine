class CartsController < ApplicationController
  def show
    @cart = current_cart

    respond_to do |format| 
      format.html
    end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html {redirect_to products_path, notice: 'Your cart is currently empty' }
      format.json {head :no_content}
    end
  end

  def add_quantity_to_cart
    @cart = current_cart
    @cart.increase_quantity(params[:id])
    redirect_to :back
  end

  def decrease_quantity_from_cart
    @cart = current_cart
    @cart.decrease_quantity(params[:id])
    redirect_to :back
  end

end
