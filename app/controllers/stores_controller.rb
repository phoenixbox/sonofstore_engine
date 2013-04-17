class StoresController < ApplicationController
  layout 'session'

  def index
    @stores = Store.online
  end

  def new
    @store = Store.new
   @store.users.build
    render :stores => 'new'
  end

  def create
    @store = Store.new(params[:store])
    if @store.save
      current_user.store_id = @store.id
      current_user.save

      flash[:notice] = "Cheeers"
      redirect_to store_admin_path(@store)
    else
      flash[:notice] = "There was a problem"
      render "new"
    end
  end

  def show
    @store = Store.find(params[:store_id])
  end


end
