class StaticPagesController < ApplicationController
  layout 'static_layout'

  def index
    # @tenant = Tenant.new 
    @stores = Stores.all  
  end

end
