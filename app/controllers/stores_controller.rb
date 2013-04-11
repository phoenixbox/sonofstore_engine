class StoreController < ApplicationController

  # def current_tenant
  #   @tenant ||= Tenant.find(params[:tenant_id])
  # end

  # helper_method :current_tenant

  # def index
  #   @products = current_tenant.products
  # end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(params[:store])
    if @store.save
      flash[:notice] = "Cheeers"
      redirect_to root_path
    else
      flash[:notice] = "Fuck"
      render "new"
    end
  end


end
