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

  def add_quantity_to_cart
    @cart = current_cart
    item = @cart.line_items.find(params[:id])
    item.quantity + 1
    item.save
  end
end
