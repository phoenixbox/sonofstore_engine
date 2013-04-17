class CartsController < ApplicationController
  def show
    @cart = current_store.carts.find(params[:id])
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    flash[:error] = "Your cart is currently empty."
    redirect_to :back
  end

  def increase_quantity
    product = Product.find(params[:id])
    line_item = current_cart.line_items.find_by_product_id(product)
    line_item.quantity +=1
    line_item.save
    expire_fragment("product-details-show-page")
    redirect_to :back
  end

  def decrease_quantity
    product = Product.find(params[:id])
    line_item = current_cart.line_items.find_by_product_id(product)
    line_item.quantity -=1
    line_item.save
    redirect_to :back
  end

end
