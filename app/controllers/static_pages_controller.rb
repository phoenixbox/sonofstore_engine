class StaticPagesController < ApplicationController
  layout 'static_layout'
  
  def index
    @tenant = Tenant.new   
  end

end