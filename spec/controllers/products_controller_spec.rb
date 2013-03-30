require 'spec_helper'

describe ProductsController do
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

  describe "POST #create" do
    context "with invalid information" do
      it "has no product title" do 
        post :create, product: {description: "cheeseburgers are delicious", price_in_dollars: 1.00}
        expect(response).to render_template :new
      end

      it "has no description" do
        post :create, product: {title: "El Mormono Hamburguesa con Queso", price_in_dollars: 3.00}
        expect(response).to render_template :new
      end

      it "has no price" do
        post :create, product: {title: "El Mormono Hamberguesa con Queso con largo papas fritas", description: "Muy delicioso"} 
        expect(response).to render_template :new
      end
    end

    context "with valid information" do
      it "creates new product" do
        post :create, product: {title: "El Mormono Hamberguesa con Queso con largo papas fritas", description: "Muy delicioso", price_in_dollars: 8.99}
        product = assigns(:product)
        expect(response).to redirect_to product_path(product)
      end
    end
  end

  describe "GET #show" do
    it "shows a single product" do
      product = Product.create(title: "El Mormono Hamberguesa con Queso con largo papas fritas", description: "Muy delicioso", price_in_dollars: 80.00)
      get 'show', id: product.id
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "renders template edit" do
      product = Product.create(title: "El Mormono Hamberguesa con Queso con largo papas fritas", description: "Muy delicioso", price_in_dollars: 80.00)
      get 'edit', id: product.id
      expect(response).to render_template :edit
    end
  end

  describe "POST #update" do
    context "with invalid information" do
      it "does not update a single product" do
        product = Product.create(title: "El Mormono Hamberguesa con Queso con largo papas fritas", description: "Muy delicioso", price_in_dollars: 80.00)
        put :update, id: product.id, product: {title: "El Mormono Hamberguesa con Queso con largo papas fritas", description: nil}
        expect(response).to render_template :edit
      end
    end
  end
  describe "DELETE #destroy" do
    context "removing items from product index" do
      it "redirects after delete" do
        product = Product.create(title: "El Mormono Hamberguesa con Queso con largo papas fritas", description: "Muy delicioso", price_in_dollars: 80.00)
        delete :destroy, id: product.id 
        expect(response).to redirect_to products_path
      end
      it "removes a single product" do
        product = Product.create(title: "El Mormono Hamberguesa con Queso con largo papas fritas", description: "Muy delicioso", price_in_dollars: 80.00)
        delete :destroy, id: product.id
        expect(Product.exists?(product.id)).to eq false 
      end
    end
  end
end

