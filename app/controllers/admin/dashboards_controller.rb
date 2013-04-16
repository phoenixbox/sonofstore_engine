class Admin::DashboardsController < Admin::BaseController
  
  def show
    @orders = current_store.orders

    # receieve status from params[:status]
    # selected_orders = Order.all
    # @orders = Order.all
    method = params[:status]

    # if method && Order.respond_to?(method)
    #   @orders = Order.send(method.to_sym)
    # else
    #   @orders = Order.all
    # end
  end

  def edit
    @store = Store.find(params[:store_id])
  end
end
