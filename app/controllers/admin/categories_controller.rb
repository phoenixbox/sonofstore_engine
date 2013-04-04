class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes params[:category]
      redirect_to admin_categories_path, notice: "Category Updated!"
    else
      flash[:error] = "An error occurred, please try again"
      render :edit
    end
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to admin_categories_path, 
      notice: "Category Added!"
    else
      render "new"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_categories_path, 
      notice: "Category was successfully deleted"
  end

end
