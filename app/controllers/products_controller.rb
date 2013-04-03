  class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10)
    @categories = Category.all
  end


  def show
    @product = Product.find(params[:id])
    @cart = current_cart
  end

end
