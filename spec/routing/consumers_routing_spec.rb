require "spec_helper"

describe ConsumersController do
  describe "routing" do

    it "routes to #index" do
      get("/consumers").should route_to(:controller =>"products", :action=>"index", :store_id=>"consumers")
    end

    it "routes to #new" do
      get("/consumers/new").should route_to(:action=>"new",:controller =>"consumers")
    end

    # it "routes to #show" do
    #   get("/consumers/1").should route_to("consumers#show", :id => "1")
    # end

    # it "routes to #edit" do
    #   get("/consumers/1/edit").should route_to("consumers#edit", :id => "1")
    # end

    it "routes to #create" do
      post("/consumers").should route_to(:action=>"create",:controller =>"consumers")
    end

    it "routes to #update" do
      put("/consumers/1").should route_to(:action=>"create", :id => "1")
    end

    # it "routes to #destroy" do
    #   delete("/consumers/1").should route_to("consumers#destroy", :id => "1")
    # end

  end
end
