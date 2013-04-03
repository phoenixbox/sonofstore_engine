require 'spec_helper'

describe Admin::ProductsController do

  describe "GET #index" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "renders the index template" do
      get 'index'
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it 'renders the new template' do
      get 'new'
      expect(response).to render_template :new
    end
  end
#   describe "GET 'new'" do
#     it "returns http success" do
#       get 'new'
#       response.should be_success
#     end
#   end

#   describe "GET 'edit'" do
#     it "returns http success" do
#       get 'edit'
#       response.should be_success
#     end
#   end

#   describe "GET 'index'" do
#     it "returns http success" do
#       get 'index'
#       response.should be_success
#     end
#   end

#   describe "GET 'update'" do
#     it "returns http success" do
#       get 'update'
#       response.should be_success
#     end
#   end

#   describe "GET 'create'" do
#     it "returns http success" do
#       get 'create'
#       response.should be_success
#     end
#   end

end
