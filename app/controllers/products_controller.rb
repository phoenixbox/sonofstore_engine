class ProductsController < ApplicationController
<<<<<<< HEAD
  before_filter :require_current_store
=======
>>>>>>> dd0bb1744908784848da184d4a9253b7adbb504f

  def index
    @products = current_store.products.page.per(16)
  end

  def show
    @product = current_store.products.find(params[:id])
  end
end
