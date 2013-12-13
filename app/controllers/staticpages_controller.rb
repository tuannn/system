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
    respond_to do |format|
      format.html
    end
  end
end
