class TenantsController < ApplicationController

  def new
    @tenant = Tenant.new
    @tenant.build.user
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


end