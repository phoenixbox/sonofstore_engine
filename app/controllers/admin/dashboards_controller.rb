class Admin::DashboardsController < Admin::BaseController
  def show
    # receieve status from params[:status]
    # selected_orders = Order.all
    # @orders = Order.all
    method = params[:status]

    if method && Order.respond_to?(method)
      @orders = Order.send(method.to_sym)
    else
      @orders = Order.all
    end
  end
end
