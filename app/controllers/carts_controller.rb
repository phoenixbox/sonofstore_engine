class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])

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
end
