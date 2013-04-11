class StoreController < ApplicationController

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

  def show
  end


end
