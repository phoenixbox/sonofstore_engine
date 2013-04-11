class LineItemsController < ApplicationController

  def create
    cart = find_cart
    binding.pry
    product = Product.find(params[:product_id])
    @line_item = cart.add_product(product.id)
    @line_item.product = product

    if @line_item.save
      redirect_to product_path(product.store, product)
    else
      flash[:error] = 'An error occurred, please try again'
    end
  end

  def destroy
    line_item = LineItem.find(params[:id])
    if line_item.cart.line_items.count == 1
      line_item.destroy
      flash[:error] = "Your cart is currently empty."
      redirect_to :back
    else
      line_item.destroy
      flash[:notice] = "Item has been deleted!"
      redirect_to :back
    end
  end

  private

  def find_cart
    if current_cart.store == current_store
      cart = current_cart
    else
      cart = Cart.find_by_store_id(current_store.id)
      if cart
        session[:cart_id] = cart.id
      else
        cart = Cart.create!(:store_id => current_store.id)
        session[:cart_id] = cart.id
      end
      cart
    end
  end

end
