  class StoreController < ApplicationController

  def index
    @categories = Category.order(:name)
    @featured = Product.first(4)
  end
end
