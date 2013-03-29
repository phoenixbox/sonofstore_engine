class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])

    respond_to do |format| 
      format.html
    end
  end
end
