class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render action: "new" 
    end
  end

  def show
    @categories = Category.all
    if params[:id].nil?
      @products = Product.all
    else
      @category = Category.find(params[:id])
      @products = @category.products
    end

    if @category
      respond_to do |format|
        format.html
      end
    else
      redirect_to products_path
    end
  end


end
