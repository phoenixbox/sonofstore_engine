class Admin::StoresController < Admin::BaseController


  def index
    @stores = Store.all
  end

  def edit
    @store = Store.find(params[:store_id])
  end

  def update
    @store = Store.find(params[:store_id])
    if @store.update_attributes(params[:store])
      flash[:notice] = "Profile updated!"
      redirect_to root_url
    else
      redirect_to admin_path
    end
  end

  def show
    @store = Store.find(params[:store_id])
  end

end
