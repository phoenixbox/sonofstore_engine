class ProductsController < ApplicationController
  before_filter :require_current_store

  def index
    @products = current_store.products
  end

  def show
    @product = current_store.products.find(params[:id])
  end

  # private

  # def find_cart
  #   logger.debug("prod_controller up in this bitch")
  #   logger.debug(session[:cart_id])

  #   cart = nil
  #   if current_cart.store == current_store
  #     cart = current_cart
  #   else
  #     cart = Cart.find_by_store_id(current_store.id)
  #     if cart
  #       session[:cart_id] = cart.id
  #     else
  #       cart = Cart.create!(:store_id => current_store.id)
  #       session[:cart_id] = cart.id
  #     end

  #   end
  #   logger.debug(session[:cart_id])
  #   cart


  # end
end
