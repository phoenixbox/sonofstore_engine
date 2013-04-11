  class ProductsController < ApplicationController
  
  
  # def current_tenant
  #   @tenant = Tenant.find_by_path(params[:tenant_id])
  #   unless @tenant
  #     flash[:message] = "Blog does not exist"
  #     redirect_to tenants_path
  #   end
  #   @tenant
  # end


  def index
    @products = current_tenant.products
    # @products = Product.page(params[:page]).per(12)
    # @categories = Category.all
  end


  def show
    @product = Product.find(params[:id])
    @cart = current_cart
  end

end
