class Admin::DashboardsController < Admin::BaseController
  def show
    # receieve status from params[:status]
    # selected_orders = Order.all
    @orders = Order.all
  end
end
