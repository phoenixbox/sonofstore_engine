class Admin::ProductsController < Admin::BaseController

  def index
    @products = current_tenant.products
    # @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes params[:product]
      redirect_to admin_products_path, notice: "Product Updated!"
    else
      # flash[:error] = "An error occurred, please try again"
      render :edit
    end
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to admin_products_path, notice: "Product Added!"
    else
      render :new
    end
  end
end
