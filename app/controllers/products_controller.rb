class ProductsController < ApplicationController

  def index
    @products = current_store.products
    # @products = Product.page(params[:page]).per(12)
    # @categories = Category.all
  end


  def show
    @product = current_store.products.find(params[:id])
    @cart = current_cart
  end

end
