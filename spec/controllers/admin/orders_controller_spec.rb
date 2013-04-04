require 'spec_helper'

describe Admin::OrdersController do

  before :each do
    @user = User.create(full_name: 'Michael J', email: 'mj@mj.com', password: 'password')
    @user.admin = true
    @user.save
    session[:user_id] = @user.id
  end


  # describe 'GET #show' do
  #   it 'assigns the requested order to @order' do
  #     get :show, id: @order
  #     expect(assigns(:order)).to eq @order
  #   end
  # end

  # describe 'GET #show' do
  #   it "returns http success" do
  #     get 'show'
  #     response.should be_success
  #   end
  # end



#   describe "GET 'index'" do
#     it "returns http success" do
#       get 'index'
#       response.should be_success
#     end
#   end

end
