class TenantsController < ApplicationController

  # def current_tenant
  #   @tenant ||= Tenant.find(params[:tenant_id])
  # end

  # helper_method :current_tenant

  # def index
  #   @products = current_tenant.products
  # end

  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.new(params[:tenant])
    # @user = @tenant.build.user(params[:users])
    if @tenant.save #&& @user.save
      flash[:notice] = "Cheeers"
      redirect_to root_path
    else
      flash[:notice] = "Fuck"
      render "new"
    end
  end

  def show
  end


end