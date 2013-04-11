class StoresController < ApplicationController

  def new
    @store = Store.new
    @store.users.build
    render :layout => 'application'
  end

  def create
    @store = Store.new(params[:store])
    if @store.save
      flash[:notice] = "Cheeers"
      redirect_to admin_dashboard_path(@store.path)
    else
      flash[:notice] = "Fuck"
      render "new"
    end
  end

  def show
  end


end
