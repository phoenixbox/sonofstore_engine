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

  describe "POST 'create'" do
    it "creates a new Jorge category" do
      post 'create'
      expect(response).to be_success
    end

    it "renders a create template" do
      post 'create'
      expect(response).to render_template :new
    end
  end

  describe "GET'edit'" do
    let(:category) { Category.create(name: "category")  }

    it "edits a category" do
      get 'edit', id: category.id
      expect(response).to be_success
    end

    it "renders an edit template" do
      get 'edit', id: category.id
      expect(response).to render_template :edit
    end
  end

end
