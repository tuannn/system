class ShopCategoriesController < ApplicationController
  load_and_authorize_resource :except => [:create, :update]
  
  def new
    @category = ShopCategory.new
    respond_to do |format|
      format.html
    end
  end
  
  def index
    @categories = ShopCategory.order(:name).all.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @category = ShopCategory.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @category = ShopCategory.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to shop_categories_path, notice: "Shop category was created"}
      else
        format.html { render action: :new }
      end
      
    end
  end
  
  def edit
    respond_to do |format|
      format.html
    end
  end
  
  def update
    @category = ShopCategory.find(params[:id])
    @category.update_attributes(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to shop_categories_path, notice: "Shop category was updated"}
      else
        format.html { render action: :show}
      end
    end
  end
private
  def category_params
    params.require(:shop_category).permit(:name, :description)
  end
end
