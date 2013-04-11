class StaticPagesController < ApplicationController
  layout 'static_layout'

  def index
    @store = Store.new
  end

end
