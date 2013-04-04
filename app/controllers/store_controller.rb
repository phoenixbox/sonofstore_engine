  class StoreController < ApplicationController

  def index
    @categories = Category.order(:name) 
    @featured = Product.order("RANDOM()").first(4)
  end
end
