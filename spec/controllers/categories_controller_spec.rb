require 'spec_helper'

describe CategoriesController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it 'renders the new template' do
      get 'new'
      expect(response).to render_template :new
    end
  end

  describe "GET 'show'" do
    let(:category){Category.create name: "category"}

    it "assigns the requested category to category" do
      get :show, id: category
      expect(assigns(:category)).to eq category
    end

    it "renders the show template" do
      get :show, id: category
      expect(response).to render_template :show
    end

  end
end
