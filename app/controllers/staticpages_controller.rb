class StaticpagesController < ApplicationController
  def index
    @shopcategories = ShopCategory.order(:name).all;
    respond_to do |format|
      format.html
    end
  end
  
  def about
    respond_to do |format|
      format.html
    end
    
  end
  
  def contact
    respond_to do |format|
      format.html
    end
  end
  
  def shopindex
    unless params[:id].nil?
      @shopcategory = ShopCategory.find_by_id(params[:id])
    else
      @shopcategory = ShopCategory.order(:name).all
    end
    
    respond_to do |format|
      if @shopcategory
        if !@shopcategory.instance_of?(Array)
           @shops = @shopcategory.shops.order(:created_at).paginate(page: params[:page], per_page: 20)
        end
        format.html
      else
        format.html { redirect_to root_path, notice: "Category is not exist" }
      end
      
    end
  end
end
