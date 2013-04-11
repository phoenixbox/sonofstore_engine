class ProductsController < ApplicationController
  def index
    @products = current_store.products
  end

  def show
    @product = current_store.products.find(params[:id])
  end
end
