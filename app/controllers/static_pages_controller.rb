class StaticPagesController < ApplicationController
  layout 'static_layout'
  
  def index
    # @tenant = Tenant.new 
    @tenants = Tenant.all  
  end

end